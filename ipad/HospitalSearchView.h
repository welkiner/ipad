//
//  HospitalSearchView.h
//  ipad
//
//  Created by tian.liang on 2017/7/24.
//  Copyright © 2017年 welkiner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HospitalSearchView : UIView
+(void)showInView:(UIView *)view hospitalName:(void (^)(NSString* str))hospitalName;
@end
