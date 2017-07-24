//
//  HETAddressPicker.m
//  HETPublicSDK_UserInfoCenter
//
//  Created by tl on 16/6/28.
//  Copyright © 2016年 HET. All rights reserved.
//

#import "HETAddressPicker.h"
#import "HETPublicPickerView.h"
#import "HETAddressInfo_Private.h"
#import <ReactiveCocoa.h>
@interface HETAddressPicker()
@end
@implementation HETAddressPicker
+(void)pickerIn:(UIView *)view defaultInfo:(HETAddressInfo *)defaultInfo choose:(void (^)(HETAddressInfo *))choosed{
    
    void (^add_)(NSMutableArray *)= ^(NSMutableArray *array){
        [array insertObject:@"----" atIndex:0];
    };
    
    NSError *error = nil;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"HETCity" ofType:@"json"];
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:path] options:NSJSONReadingMutableContainers error:&error];
    NSArray *originPList = dic[@"citylist"];
    
    __block NSMutableArray * pList = [NSMutableArray array];
    [originPList enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [pList addObject:obj[@"p"]];
    }];
    __block NSMutableArray * cList = [NSMutableArray array];
    __block NSMutableArray * dList = [NSMutableArray array];
    add_(pList);
    add_(cList);
    add_(dList);
    
    __block NSInteger p=0,c=0,d=0;
    [pList enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger pidx, BOOL * _Nonnull stop) {
        if (defaultInfo.province && ([defaultInfo.province isEqualToString:obj] || [defaultInfo.aliasProvince isEqualToString:obj])) {
            p = pidx;
            [(NSArray *)originPList[pidx-1][@"c"] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [cList addObject:obj[@"n"]];
            }];
            [cList enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger cidx, BOOL * _Nonnull stop) {
                if (defaultInfo.city && ([defaultInfo.city isEqualToString:obj] || [defaultInfo.aliasCity isEqualToString:obj])) {
                    c = cidx;
                    [(NSArray *)originPList[pidx-1][@"c"][cidx-1][@"a"] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                        [dList addObject:obj[@"s"]];
                    }];
                    [dList enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                        if (defaultInfo.district && [defaultInfo.district isEqualToString:obj]) {
                            d = idx;
                        }
                    }];
                }
            }];
        }
    }];
    
    NSArray *totalArray =@[pList,cList,dList];
    
    
    HETPublicPickerView *pickerView = [HETPublicPickerView viewWithTitle:@""];
    
    
    pickerView.numberOfComponent = ^NSInteger{
        return 3;
    };
    pickerView.numberOfRowsInComponent = ^NSInteger(NSInteger component){
        return [totalArray[component] count];
    };
    
    pickerView.titleForRowAndComponent =^NSString *(NSInteger componentIndex, NSInteger row){
        return totalArray[componentIndex][row];
    };
    @weakify(pickerView);
    pickerView.rowChangedNeedReloadComponentIndex =^NSArray *(NSInteger changedComponent,NSInteger changeedRow){
        if (changedComponent == 2) {
            return  nil;
        }
        
        if (changedComponent == 0) {
            [cList removeAllObjects];
            add_(cList);
            [dList removeAllObjects];
            add_(dList);
            if (changeedRow == 0) {
                return @[@1,@2];
            }else{
                [(NSArray *)originPList[changeedRow-1][@"c"] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    [cList addObject:obj[@"n"]];
                }];
                return @[@1,@2];
            }
        }else{
            [dList removeAllObjects];
            add_(dList);
            if (changeedRow == 0) {
                return @[@2];
            }
            @strongify(pickerView);
            if ([pickerView currentRowInComponent:0] > 0 &&
                [(NSArray *)originPList[[pickerView currentRowInComponent:0]-1][@"c"] count] > changeedRow-1) {
                
                [(NSArray *)originPList[[pickerView currentRowInComponent:0]-1][@"c"][changeedRow-1][@"a"] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    [dList addObject:obj[@"s"]];
                }];
            }
            return @[@2];
        }
    };
    [pickerView showInView:view pickChanged:^(NSArray *indexArray) {
        @strongify(pickerView);
        HETAddressInfo *info = [HETAddressInfo new];
        info.country = @"中国";
        if ([indexArray[0] integerValue]>0) {
            info.province = pickerView.titleForRowAndComponent(0,[indexArray[0] integerValue]);
        }
        if ([indexArray[1] integerValue]>0) {
            info.city = pickerView.titleForRowAndComponent(1,[indexArray[1] integerValue]);
        }
        if ([indexArray[2] integerValue]>0) {
            info.district = pickerView.titleForRowAndComponent(2,[indexArray[2] integerValue]);
        }
        !choosed?:choosed(info);
    }];
    [pickerView defaultSelect:@[@(p),@(c),@(d)] animated:YES];
}

@end
