//
//  ShareData.m
//  ipad
//
//  Created by tl on 2017/7/22.
//  Copyright © 2017年 welkiner. All rights reserved.
//

#import "ShareData.h"
#import "CHCSVParser.h"
#import "FMDB.h"
@implementation ShareData
+(void)saveData{

    FMDatabase *db = [[FMDatabase alloc] initWithPath:[[NSBundle mainBundle] pathForResource:@"11111" ofType:@"db"]];
    [db setShouldCacheStatements:YES];
    if (![db open]) {
        //couldn't open the database
        return ;
    }
    FMResultSet *results = [db executeQuery:@"SELECT * FROM answerTable"];
    CHCSVWriter *csvWriter = [[CHCSVWriter alloc] initForWritingToCSVFile:[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"answers.csv"]];
    BOOL isFirst = YES;
    while([results next]) {
        NSDictionary *resultRow = [results resultDictionary];
        NSArray *orderedKeys = [[resultRow allKeys] sortedArrayUsingSelector:@selector(compare:)];
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
            [csvWriter writeField:value];
        }
        [csvWriter finishLine];
    }
    [csvWriter closeStream];
    
    [db close];
}
@end
