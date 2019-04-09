//
//  Q1Controller20.m
//  ipad
//
//  Created by tl on 2019/4/9.
//  Copyright © 2019 welkiner. All rights reserved.
//

#import "Q1Controller20.h"
#import "AnswerData.h"
#import "FinishController.h"
#import "Masonry.h"
@interface Q1Controller3 ()

@end

@implementation Q1Controller3

- (void)viewDidLoad {
    [super viewDidLoad];
    self.answerBtn1.hidden = true;
    self.answerBtn2.hidden = true;
    self.answerBtn3.hidden = true;
    self.answerBtn4.hidden = true;
    self.answerBtn5.hidden = true;
    self.nextBtn.hidden = true;
    
    self.nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.nextBtn setImage:[UIImage imageNamed:@"提交"] forState:UIControlStateNormal];
    [self.view addSubview:self.nextBtn];
    [self.nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(-55);
        make.height.mas_equalTo(64);
        make.width.mas_equalTo(182);
        make.centerX.equalTo(self.view);
    }];
    [self.nextBtn addTarget:self action:@selector(nextBtnClick) forControlEvents:UIControlEventTouchUpInside];
}
-(void)nextBtnClick{
    [AnswerData saveData:self.model];
    [self.navigationController pushViewController:FinishController.new animated:true];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
