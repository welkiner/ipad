//
//  HETAddressInfo.h
//  HETPublicSDK_UserInfoCenter
//
//  Created by tl on 16/7/4.
//  Copyright © 2016年 HET. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HETAddressInfo : NSObject
@property (nonatomic,copy)NSString *country;
@property (nonatomic,copy)NSString *province;
@property (nonatomic,copy)NSString *city;
@property (nonatomic,copy)NSString *district;

/**
 *  是否是国外
 */
@property (nonatomic,assign)BOOL isHomeland;

/**
 *  @param address @"广东-深圳-南山区" | @"爱尔兰-克莱尔",会按@"-"来分割
 */
-(instancetype)initAddressString:(NSString *)address;
/**
 *  把完整地址用"-"拼接起来（会包含国家（除中国）),下面的方法传的YES
 *
 */
-(NSString *)addressString;




/**
 *  地址拼接
 *
 *  @param needCountry  是否需要国家
 */
-(NSString *)stringWithCountry:(BOOL)needCountry;


/**
 *  新的地址，只是对每项做简单赋值
 */
-(void)setNewInfo:(HETAddressInfo *)info;
@end
