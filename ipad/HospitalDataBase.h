//
//  HospitalDataBase.h
//  ipad
//
//  Created by tl on 2017/7/22.
//  Copyright © 2017年 welkiner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HospitalDataBase : NSObject
+(instancetype)shareInstance;
-(NSArray *)queryWithName:(NSString *)name;
@end
