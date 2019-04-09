//
//  AnswerData.m
//  ipad
//
//  Created by tian.liang on 2017/7/25.
//  Copyright © 2017年 welkiner. All rights reserved.
//

#import "AnswerData.h"
#import <FMDB/FMDB.h>
#import "CHCSVParser.h"
static FMDatabase *__fmDB;
@implementation AnswerData
+(void)initialize{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *docPathName = [paths firstObject];
    docPathName = [docPathName stringByAppendingPathComponent:@"answerDB.db"];
    NSString *bundlePath;
    //[[NSFileManager defaultManager]removeItemAtPath:docPathName error:nil];
    if(![[NSFileManager defaultManager] fileExistsAtPath:docPathName]) {
        bundlePath =  [[NSBundle mainBundle] pathForResource:@"answerDB" ofType:@"db"];
        if ([[NSFileManager defaultManager] fileExistsAtPath:bundlePath]) {
            NSError *error;
            [[NSFileManager defaultManager] copyItemAtPath:bundlePath toPath:docPathName error:&error];
        }
    }
}


+(instancetype)shareInstance{
    static AnswerData* base;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        base = [AnswerData new];
        [base initDB];
    });
    return base;
}

- (void)initDB {
    if (!__fmDB) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
        NSString *docPathName = [paths firstObject];
        docPathName = [docPathName stringByAppendingPathComponent:@"answerDB.db"];
        __fmDB = [FMDatabase databaseWithPath:docPathName];
        [__fmDB setShouldCacheStatements:YES];
    }
}






+(void)saveData:(UserModel *)model{
    [self shareInstance];
    if (![__fmDB open]) {
        return ;
    }
    NSString *sql = [NSString stringWithFormat:
                     @"INSERT INTO answerTable (choose, advice) values ('%@', '%@' ) ",
                     model.choose,
                     model.advice
                     ];
    
    BOOL res = [__fmDB executeUpdate:sql];
    if (!res) {
        NSLog(@"error to insert data");
    } else {
        NSLog(@"success to insert data");
    }
    [__fmDB close];
}
#define COMMAA ','
+(void)csvData{
    [self shareInstance];
    if (![__fmDB open]) {
        return ;
    }
    FMResultSet *results = [__fmDB executeQuery:@"SELECT * FROM answerTable"];
    
    NSOutputStream *stream = [NSOutputStream outputStreamToFileAtPath:[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"answers.csv"] append:NO];
    NSStringEncoding enc=CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    CHCSVWriter *csvWriter = [[CHCSVWriter alloc] initWithOutputStream:stream encoding:enc delimiter:COMMAA];
    BOOL isFirst = YES;
    while([results next]) {
        NSMutableDictionary *resultRow = [results resultDictionary].mutableCopy;
        
        NSString *q3str = resultRow[@"question1"];
        
        NSArray *orderedKeys =@[@"id\题号",
                                @"province",
                                @"city",
                                @"hospital",
                                @"question1_A",
                                @"question1_B",
                                @"question1_C",
                                @"question1_D",
                                @"question1_E",
                                @"question2",
                                @"question3_A",
                                @"question3_B",
                                @"question3_C",
                                @"question3_D",
                                @"question4_A",
                                @"question4_B",
                                @"question4_C",
                                @"question4_D",
                                @"question4_E",
                                @"question5_A",
                                @"question5_B",
                                @"question5_C",
                                @"question5_D",
                                @"question6_A",
                                @"question6_B",
                                @"question6_C",
                                @"question6_D",
                                @"question7",
                                @"question8",
                                @"question9",
                                @"question10",
                                ];
        if (isFirst) {
            isFirst = NO;
            for (NSString *columnName in orderedKeys) {
                [csvWriter writeField:columnName];
            }
            [csvWriter finishLine];
        }
        //iterate over the dictionary
        for (NSString *columnName in orderedKeys) {
            id value = [resultRow objectForKey:columnName];
            if (!value || [value isKindOfClass:[NSNull class]]) {
                value = @"";
            }
            [csvWriter writeField:value];
        }
        [csvWriter finishLine];
    }
    [csvWriter closeStream];
    [__fmDB close];
}
@end



