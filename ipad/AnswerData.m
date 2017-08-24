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
    NSString *sql = [NSString stringWithFormat:@"INSERT INTO answerTable (province, city, hospital, keshi, question1, question2, question3, question4, question4_E) values ('%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@' ) ",model.province,model.city,model.hospital,model.keshi,model.question1,model.question2,model.question3,model.question4,[model.question4_E length] > 0?model.question4_E:@""] ;
    
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
        if ([resultRow[@"question3"] length] == 3) {
            resultRow[@"question3_1"] = [resultRow[@"question3"] substringWithRange:NSMakeRange(0, 1)];
            resultRow[@"question3_2"] = [resultRow[@"question3"] substringWithRange:NSMakeRange(1, 1)];
            resultRow[@"question3_3"] = [resultRow[@"question3"] substringWithRange:NSMakeRange(2, 1)];
        }
        if ([resultRow[@"question4"] length] == 5) {
            resultRow[@"question4_1"] = [resultRow[@"question4"] substringWithRange:NSMakeRange(0, 1)];
            resultRow[@"question4_2"] = [resultRow[@"question4"] substringWithRange:NSMakeRange(1, 1)];
            resultRow[@"question4_3"] = [resultRow[@"question4"] substringWithRange:NSMakeRange(2, 1)];
            resultRow[@"question4_4"] = [resultRow[@"question4"] substringWithRange:NSMakeRange(3, 1)];
            resultRow[@"question4_5"] = [resultRow[@"question4"] substringWithRange:NSMakeRange(4, 1)];
        }
        NSArray *orderedKeys = @[@"id",@"province",@"city",@"hospital",@"keshi",@"question1",@"question2",@"question3_1",@"question3_2",@"question3_3",@"question4_1",@"question4_2",@"question4_3",@"question4_4",@"question4_5",@"question4_E"];
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



