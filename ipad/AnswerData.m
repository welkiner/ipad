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
    
//    CHCSVWriter *csvWriter = [[CHCSVWriter alloc] initWithOutputStream:stream encoding:NSUTF8StringEncoding delimiter:COMMAA];
    
    NSStringEncoding enc=CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    CHCSVWriter *csvWriter = [[CHCSVWriter alloc] initWithOutputStream:stream encoding:enc delimiter:COMMAA];
    BOOL isFirst = YES;
    while([results next]) {
        NSDictionary *resultRow = [results resultDictionary];
        
        NSArray *orderedKeys =@[@"id",
                                @"题目1",
                                @"题目2",
                                @"题目3",
                                @"题目4",
                                @"题目5",
                                @"题目6",
                                @"题目7",
                                @"题目8",
                                @"题目9",
                                @"题目10",
                                @"题目11",
                                @"题目12",
                                @"题目13",
                                @"题目14",
                                @"题目15",
                                @"题目16",
                                @"题目17",
                                @"题目18",
                                @"题目19",
                                @"题目20",
                                ];
        if (isFirst) {
            isFirst = NO;
            for (NSString *columnName in orderedKeys) {
                [csvWriter writeField:columnName];
            }
            [csvWriter finishLine];
        }
        //iterate over the dictionary
        
        NSString *s = resultRow[@"id"];
        if (!s || [s isKindOfClass:[NSNull class]] ) {
            s = @"";
        }
        [csvWriter writeField:s];
        
        NSRange range ;
        NSString *theString = resultRow[@"choose"];
        //方法三(正确，可打印emoji)
        for(int i=0; i<theString.length; i+=range.length){
            range = [theString rangeOfComposedCharacterSequenceAtIndex:i];
            NSString *s = [theString substringWithRange:range];
            if (!s || [s isKindOfClass:[NSNull class]]) {
                s = @"";
            }
            [csvWriter writeField:s];
        }
        s = resultRow[@"advice"];
        if (!s || [s isKindOfClass:[NSNull class]] || ([s isKindOfClass:[NSString class]]&& [s isEqualToString:@"(null)"])) {
            s = @"";
        }
        [csvWriter writeField:s];
        [csvWriter finishLine];
    }
    [csvWriter closeStream];
    [__fmDB close];
}
@end



