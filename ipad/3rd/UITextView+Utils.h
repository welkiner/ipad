//
//  UITextView+Utils.h
//  HETPublicSDK_Core
//
//  Created by tl on 16/1/28.
//  Copyright © 2016年 HET. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (Utils)
/**
 *  关闭emoji
 */
-(void)disableEmoji;

//最大长度
-(void)maxLength:(NSInteger)length;
@end
