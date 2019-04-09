//
//  QuestionBaseController.h
//  ipad
//
//  Created by tian.liang on 2017/7/24.
//  Copyright © 2017年 welkiner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Button1.h"
#import "UserModel.h"
@interface QuestionBaseController : UIViewController
+(instancetype)controllerWithModel:(UserModel *)model;

@property (strong, nonatomic) UIImageView* backImageView;
@property (strong, nonatomic) Button1* answerBtn1;
@property (strong, nonatomic) Button1* answerBtn2;
@property (strong, nonatomic) Button1* answerBtn3;
@property (strong, nonatomic) Button1* answerBtn4;
@property (strong, nonatomic) Button1* answerBtn5;
@property (strong, nonatomic)UserModel *model;

@property (strong, nonatomic) UIButton* backBtn;
@property (strong, nonatomic) UIButton* nextBtn;

#define kHeight 55
-(NSString *)answerStr;
-(void)nextBtnClick;
-(void)backBtnClick;
@end
