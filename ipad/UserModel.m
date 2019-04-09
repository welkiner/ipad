//
//  UserModel.m
//  ipad
//
//  Created by tian.liang on 2017/7/25.
//  Copyright © 2017年 welkiner. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

-(void)change:(NSString *)s index:(NSInteger)index{
    [self.choose replaceCharactersInRange:NSMakeRange(index-1, 1) withString:s];
}
-(void)clearIndex:(NSInteger)index{
    [self change:@"0" index:index];
}
-(instancetype)init{
    if (self = [super init]) {
        self.choose = @"".mutableCopy;
        for (NSInteger i = 0; i< 19; i++) {
            [self.choose appendString:@"0"];
        }
    }
    return self;
}
@end
