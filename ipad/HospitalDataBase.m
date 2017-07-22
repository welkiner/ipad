//
//  HospitalDataBase.m
//  ipad
//
//  Created by tl on 2017/7/22.
//  Copyright © 2017年 welkiner. All rights reserved.
//

#import "HospitalDataBase.h"
#import <FMDB/FMDB.h>
static FMDatabase *fmDB;
@implementation HospitalDataBase
+(instancetype)shareInstance{
    static HospitalDataBase* base;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        base = [HospitalDataBase new];
        [base openDB];
    });
    return base;
}
/**
 *  打开数据库
 *
 *  @return 返回打开成功或失败
 */
- (BOOL)openDB {
    BOOL isSuccess = NO;
    if (!fmDB) {
        fmDB = [FMDatabase databaseWithPath:[[NSBundle mainBundle] pathForResource:@"hospital" ofType:@"db"]];
        [fmDB setShouldCacheStatements:YES];
    }
    if ([fmDB open]) {
        isSuccess = YES;
    }
    return isSuccess;
}
-(NSArray *)queryWithName:(NSString *)name{
    if (name.length == 0) {
        return @[];
    }
    NSMutableArray *resultsArr = [NSMutableArray array];
    NSString *sqlString = [NSString stringWithFormat:@"SELECT PYName from hospitalTable WHERE PinYin like '%%%@%%' or PYName like '%%%@%%' or ShortPy like '%%%@%%'",name,name,name];
    FMResultSet *fmResult = [fmDB executeQuery:sqlString];
    while ([fmResult next]) {
        [resultsArr addObject:[fmResult resultDictionary]];
    }
    
    return  resultsArr;
}

@end
