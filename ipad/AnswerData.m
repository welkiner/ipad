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
                     @"INSERT INTO answerTable (province, city, hospital, question1, question2, question3, question4, question5, question6, question7, question8, question9, question10) values ('%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@' ) ",
                     model.province,
                     model.city,
                     model.hospital,
                     model.question1,
                     model.question2,
                     model.question3,
                     model.question4,
                     model.question5,
                     model.question6,
                     model.question7,
                     model.question8,
                     model.question9,
                     model.question10
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
        if ([q3str containsString:@"A"]) {
            resultRow[@"question1_A"] = @"√";
        }
        if ([q3str containsString:@"B"]) {
            resultRow[@"question1_B"] = @"√";
        }
        if ([q3str containsString:@"C"]) {
            resultRow[@"question1_C"] = @"√";
        }
        if ([q3str containsString:@"D"]) {
            resultRow[@"question1_D"] = @"√";
        }
        if ([q3str containsString:@"E"]) {
            resultRow[@"question1_E"] = @"√";
        }
        
        
        if ([resultRow[@"question3"] length] == 4) {
            resultRow[@"question3_A"] = [resultRow[@"question3"] substringWithRange:NSMakeRange(0, 1)];
            resultRow[@"question3_B"] = [resultRow[@"question3"] substringWithRange:NSMakeRange(1, 1)];
            resultRow[@"question3_C"] = [resultRow[@"question3"] substringWithRange:NSMakeRange(2, 1)];
            resultRow[@"question3_D"] = [resultRow[@"question3"] substringWithRange:NSMakeRange(3, 1)];
        }
        if ([resultRow[@"question4"] length] == 5) {
            resultRow[@"question4_A"] = [resultRow[@"question4"] substringWithRange:NSMakeRange(0, 1)];
            resultRow[@"question4_B"] = [resultRow[@"question4"] substringWithRange:NSMakeRange(1, 1)];
            resultRow[@"question4_C"] = [resultRow[@"question4"] substringWithRange:NSMakeRange(2, 1)];
            resultRow[@"question4_D"] = [resultRow[@"question4"] substringWithRange:NSMakeRange(3, 1)];
            resultRow[@"question4_E"] = [resultRow[@"question4"] substringWithRange:NSMakeRange(4, 1)];
        }
        if ([resultRow[@"question5"] length] == 4) {
            resultRow[@"question5_A"] = [resultRow[@"question5"] substringWithRange:NSMakeRange(0, 1)];
            resultRow[@"question5_B"] = [resultRow[@"question5"] substringWithRange:NSMakeRange(1, 1)];
            resultRow[@"question5_C"] = [resultRow[@"question5"] substringWithRange:NSMakeRange(2, 1)];
            resultRow[@"question5_D"] = [resultRow[@"question5"] substringWithRange:NSMakeRange(3, 1)];
        }
        if ([resultRow[@"question6"] length] == 4) {
            resultRow[@"question6_A"] = [resultRow[@"question6"] substringWithRange:NSMakeRange(0, 1)];
            resultRow[@"question6_B"] = [resultRow[@"question6"] substringWithRange:NSMakeRange(1, 1)];
            resultRow[@"question6_C"] = [resultRow[@"question6"] substringWithRange:NSMakeRange(2, 1)];
            resultRow[@"question6_D"] = [resultRow[@"question6"] substringWithRange:NSMakeRange(3, 1)];
        }
        NSArray *orderedKeys =@[@"id",
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



