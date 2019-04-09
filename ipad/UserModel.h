//
//  UserModel.h
//  ipad
//
//  Created by tian.liang on 2017/7/25.
//  Copyright © 2017年 welkiner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

@property (nonatomic,strong)NSMutableString * choose;
@property (nonatomic,copy)NSString *advice;
-(void)change:(NSString *)s index:(NSInteger)index;
-(void)clearIndex:(NSInteger)index;
@end
