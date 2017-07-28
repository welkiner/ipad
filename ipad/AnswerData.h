//
//  AnswerData.h
//  ipad
//
//  Created by tian.liang on 2017/7/25.
//  Copyright © 2017年 welkiner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"
#import "UserModel2.h"
@interface AnswerData : NSObject
+(void)saveData:(UserModel *)model;
+(void)saveData2:(UserModel2 *)model;
+(void)csvData;
@end
