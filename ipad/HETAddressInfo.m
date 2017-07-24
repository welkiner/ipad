//
//  HETAddressInfo.m
//  HETPublicSDK_UserInfoCenter
//
//  Created by tl on 16/7/4.
//  Copyright © 2016年 HET. All rights reserved.
//

#import "HETAddressInfo.h"
#import "HETAddressInfo_Private.h"
@implementation HETAddressInfo
-(instancetype)initAddressString:(NSString *)address{
    if (self = [super init]) {
        if (address.length == 0) {
            return self;
        }
        if ([HETAddressInfo isWordCountry:address]) {
            [self configWordcountry:address];
        }else{
            [self configHomeland:address];
        }
    }
    return self;
}
-(BOOL)isHomeland{
    _isHomeland = ![HETAddressInfo isWordCountry:self.country];
    return _isHomeland;
}
-(void)configHomeland:(NSString *)address{

    self.country = @"中国";
    [[address componentsSeparatedByString:@"-"] enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx == 0) {
            if ([obj isEqualToString:@"中国"]) {
                return ;
            }
            self.province = obj;
            
        }else if (idx ==1){
            self.city = obj;
            
        }else if (idx == 2){
            self.district = obj;
        }
    }];
}
-(NSString *)aliasProvince{
    if ([self.province hasSuffix:@"省"]) {
        self.aliasProvince = [self.province substringToIndex:self.province.length - 1];
    }else{
        self.aliasProvince = self.province;
    }
    return _aliasProvince;
}
-(NSString *)aliasCity{
    if ([self.city hasSuffix:@"市"]) {
        self.aliasCity = [self.city substringToIndex:self.city.length - 1];
    }else{
        self.aliasCity = self.city;
    }
    return _aliasCity;
}
-(void)configWordcountry:(NSString *)address{
    [[address componentsSeparatedByString:@"-"] enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx == 0) {
            self.country = obj;
        }else if (idx ==1){
            self.province = obj;
        }else if (idx == 2){
            self.city = obj;
        }
    }];
}


-(NSString *)addressString{
    return [self stringWithCountry:YES];
}
-(NSString *)stringWithCountry:(BOOL)needCountry{
    NSMutableString *str = [@"" mutableCopy];
    if (self.country.length >0 &&
        (!self.isHomeland || self.province.length == 0) &&
        needCountry) {
        [str appendString:self.country];
    }
    
    if (self.province.length >0) {
        [str appendFormat:@"%@%@",str.length == 0?@"":@"-",self.province];
    }
    if (self.city.length >0) {
        [str appendFormat:@"-%@",self.city];
    }
    if (self.district.length >0) {
        [str appendFormat:@"-%@",self.district];
    }
    
    return str;
}


-(NSString *)description{
    return [NSString stringWithFormat:@"%@ %@ %@ %@",self.country,self.province,self.city,self.district];
}
-(void)setNewInfo:(HETAddressInfo *)info{
    self.country = info.country;
    self.city = info.city;
    self.province = info.province;
    self.district = info.district;
}


+(BOOL)isWordCountry:(NSString *)countryStr{
    NSError *error = nil;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"HETCountry" ofType:@"json"];
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:path] options:NSJSONReadingMutableContainers error:&error];
    NSArray *originPList = dic[@"countrylist"];
    
    __block NSMutableArray * pList = [NSMutableArray array];
    [originPList enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [pList addObject:obj[@"country"]];
    }];
    __block BOOL is = NO;
    [[countryStr componentsSeparatedByString:@"-"] enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx == 0) {
            for (NSString *str in pList) {
                if ([obj isEqualToString:str]) {
                    is = YES;
                    *stop = YES;
                }
            }
        }
    }];
    return is;
}
@end
