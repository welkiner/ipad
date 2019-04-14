//
//  Q1Controller20.m
//  ipad
//
//  Created by tl on 2019/4/9.
//  Copyright © 2019 welkiner. All rights reserved.
//

#import "Q1Controller13.h"
#import "AnswerData.h"
#import "FinishController.h"
#import "Masonry.h"
#import "UITextView+Utils.h"
@interface Q1Controller13 (){
    
    UITextView *_textView;
}

@end

@implementation Q1Controller13

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
        make.bottom.equalTo(self.view.mas_bottom).offset(-70);
        make.height.mas_equalTo(64);
        make.width.mas_equalTo(182);
        make.centerX.equalTo(self.view);
    }];
    [self.nextBtn addTarget:self action:@selector(nextBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    _textView = [[UITextView alloc] init];
    [self.view addSubview:_textView];
    _textView.backgroundColor = [UIColor clearColor];
    _textView.font = [UIFont systemFontOfSize:28];
    _textView.textColor = [UIColor whiteColor];
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(313);
        make.bottom.equalTo(self.view.mas_bottom).offset(-177);
        make.left.equalTo(self.view.mas_left).offset(230);
        make.right.equalTo(self.view.mas_right).offset(-230);
    }];
    [_textView disableEmoji];
    [_textView maxLength:150];
}
-(void)nextBtnClick{
    if (_textView.text.length > 0) {
        self.model.advice = _textView.text;
    }
    self.model.dateStr = [self dateToString:[NSDate date]];
    [AnswerData saveData:self.model];
    [self.navigationController pushViewController:FinishController.new animated:true];
}
-(void)backBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

-(NSDateFormatter *)dateFormatter{
    static NSDateFormatter *_dateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _dateFormatter = [[NSDateFormatter alloc] init];
    });
    return _dateFormatter;
}

- (NSString *)dateToString: (NSDate *)date {
    
    NSAssert(date, @"Parameter 'date' should not be nil");
    
    NSDateFormatter *_dateFormatter = [self dateFormatter];
    
    [_dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm"];
    NSString *dateStr= [_dateFormatter stringFromDate: date];
    return dateStr;
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
