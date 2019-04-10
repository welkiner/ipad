//
//  Q1Controller1.m
//  ipad
//
//  Created by tian.liang on 2017/7/24.
//  Copyright © 2017年 welkiner. All rights reserved.
//

#import "Q1Controller1.h"
#import "Masonry.h"
@interface Q1Controller1 ()

@end

@implementation Q1Controller1

- (void)viewDidLoad {
    [super viewDidLoad];
    self.backBtn.hidden = YES;
    self.backImageView.image = [UIImage imageNamed:@"问题1"];
    [self.answerBtn1 mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(350);
        make.height.mas_equalTo(kHeight);
        make.left.equalTo(self.view.mas_left).offset(220);
        make.right.equalTo(self.view.mas_right).offset(-220);
    }];
    [self.answerBtn1 setTitle:@"A：是" forState:UIControlStateNormal];
    [self.answerBtn2 setTitle:@"B：否" forState:UIControlStateNormal];
    self.answerBtn3.hidden = YES;
    self.answerBtn4.hidden = YES;
    self.answerBtn5.hidden = YES;
    // Do any additional setup after loading the view.
}


@end
