//
//  Button1.m
//  ipad
//
//  Created by tian.liang on 2017/7/24.
//  Copyright © 2017年 welkiner. All rights reserved.
//

#import "Button1.h"

@implementation Button1
- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = cornerRadius > 0;
//    self.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.4];
}
-(void)awakeFromNib{
    [super awakeFromNib];
    [self setBackgroundImage:[Button1 imageWithColor:[[UIColor blackColor] colorWithAlphaComponent:0.3]] forState:UIControlStateHighlighted];
    [self setBackgroundImage:[Button1 imageWithColor:[[UIColor blackColor] colorWithAlphaComponent:0.3]] forState:UIControlStateSelected];
}
+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
