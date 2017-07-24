//
//  HETAddressPicker.h
//  HETPublicSDK_UserInfoCenter
//
//  Created by tl on 16/6/28.
//  Copyright © 2016年 HET. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "HETAddressInfo.h"
NS_ASSUME_NONNULL_BEGIN

/**
 *  地址选择器
 */
@interface HETAddressPicker : NSObject

/**只有一个类方法
 *  @param view        在哪个view显示
 *  @param defaultInfo 默认显示地址
 *  @param choosed     选择之后的地址block
 */
+(void)pickerIn:(UIView *)view
    defaultInfo:(HETAddressInfo * __nullable)defaultInfo
         choose:(void (^)(HETAddressInfo *newInfo))choosed;
@end

@interface HETKeshiPicker : NSObject
+(void)pickerIn:(UIView *)view
         choose:(void (^)(NSString *keshiName))choosed;
@end

NS_ASSUME_NONNULL_END
