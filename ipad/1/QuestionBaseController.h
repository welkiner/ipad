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
@property (strong, nonatomic) IBOutletCollection(Button1) NSArray *answerBtns;
@property (strong, nonatomic) IBOutletCollection(Button1) NSArray *answerBtns2;
@property (strong, nonatomic) IBOutletCollection(Button1) NSArray *answerBtns3;
@property (strong, nonatomic) IBOutletCollection(Button1) NSArray *answerBtns4;
@property (strong, nonatomic) IBOutletCollection(Button1) NSArray *answerBtns5;
@property (strong, nonatomic)UserModel *model;
-(void)answerBtnsClick:(Button1 *)btn;
-(BOOL)mutiAnswer;

-(NSString *)answerStr;
-(NSString *)answerStr2;
-(NSString *)answerStr3;
-(NSString *)answerStr4;
-(NSString *)answerStr5;
@end
