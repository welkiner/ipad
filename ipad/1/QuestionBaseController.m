//
//  QuestionBaseController.m
//  ipad
//
//  Created by tian.liang on 2017/7/24.
//  Copyright © 2017年 welkiner. All rights reserved.
//

#import "QuestionBaseController.h"
#import "Masonry.h"
@interface QuestionBaseController ()
@property (strong, nonatomic)NSArray<Button1*> *answerBtns;
@end

@implementation QuestionBaseController
+(instancetype)controllerWithModel:(UserModel *)model{
    QuestionBaseController *con = [[self alloc] init];
    con.model = model;
    return con;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"问题2-21"]];
    [self.view addSubview:self.backImageView];
    [self.backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [self addTitle];
    [self makeButton];
    
    // Do any additional setup after loading the view.
}
-(void)addTitle{
    UILabel *label = [[UILabel alloc] init];
    [self.view addSubview:label];
    NSString *classStr = NSStringFromClass(self.class);
    NSString *numberStr = [classStr substringFromIndex:@"Q1Controller".length];
    label.text = __ArrayName()[numberStr.integerValue];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(227);
        make.height.mas_equalTo(60);
        make.left.equalTo(self.view.mas_left).offset(250);
        make.right.equalTo(self.view.mas_right).offset(-190);
    }];
    label.font = [UIFont systemFontOfSize:32];
    label.textColor = [UIColor colorWithRed:0.051 green:0.098 blue:0.318 alpha:1.000];
}
static NSArray *__ArrayName(){
    return @[@"1、您是否汽车相关行业观众",
             @"2、展馆位置",
             @"3、展馆的周边交通情况",
             @"4、展厅规模和布局",
             @"5、展馆内部导向示意图和图标",
             @"6、展馆停车场规模",
             @"7、展会规模以及水平",
             @"8、展会主题的吸引力",
             @"9、展会宣传力度",
             @"10、展会同期活动",
             @"11、参展商数量",
             @"12、参展商知名度",
             @"13、参展商展台搭建设计",
             @"14、参展商服务质量",
             @"15、展会门票价格",
             @"16、展会登记流程",
             @"17、展会现场秩序及安全情况",
             @"18、展会现场工作人员专业性和及时性",
             @"19、展会现场餐饮配套服务"
             ];
}

#define kHeight 50
#define kSpace 10
-(void)makeButton{
    self.answerBtn1 = [Button1 button];
    [self.view addSubview:self.answerBtn1];
    [self.answerBtn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(323);
        make.height.mas_equalTo(kHeight);
        make.left.equalTo(self.view.mas_left).offset(220);
        make.right.equalTo(self.view.mas_right).offset(-220);
    }];
    
    
    self.answerBtn2 = [Button1 button];
    [self.view addSubview:self.answerBtn2];
    [self.answerBtn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.answerBtn1.mas_bottom).offset(kSpace);
        make.height.mas_equalTo(kHeight);
        make.left.equalTo(self.view.mas_left).offset(220);
        make.right.equalTo(self.view.mas_right).offset(-220);
    }];
    
    
    self.answerBtn3 = [Button1 button];
    [self.view addSubview:self.answerBtn3];
    [self.answerBtn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.answerBtn2.mas_bottom).offset(kSpace);
        make.height.mas_equalTo(kHeight);
        make.left.equalTo(self.view.mas_left).offset(220);
        make.right.equalTo(self.view.mas_right).offset(-220);
    }];
    
    
    self.answerBtn4 = [Button1 button];
    [self.view addSubview:self.answerBtn4];
    [self.answerBtn4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.answerBtn3.mas_bottom).offset(kSpace);
        make.height.mas_equalTo(kHeight);
        make.left.equalTo(self.view.mas_left).offset(220);
        make.right.equalTo(self.view.mas_right).offset(-220);
    }];
    
    
    self.answerBtn5 = [Button1 button];
    [self.view addSubview:self.answerBtn5];
    [self.answerBtn5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.answerBtn4.mas_bottom).offset(kSpace);
        make.height.mas_equalTo(kHeight);
        make.left.equalTo(self.view.mas_left).offset(220);
        make.right.equalTo(self.view.mas_right).offset(-220);
    }];
    
    self.answerBtns = @[_answerBtn1,_answerBtn2,_answerBtn3,_answerBtn4,_answerBtn5];
    
    
    [self.answerBtns enumerateObjectsUsingBlock:^(Button1 * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj addTarget:self action:@selector(answerBtnsClick:) forControlEvents:UIControlEventTouchUpInside];
        
        obj.tag = 100+idx;
        NSString * a = [NSString stringWithFormat:@"%@",@(obj.tag)];
        [obj setTitle:__dicName()[a] forState:UIControlStateNormal];
        
        obj.titleLabel.font = [UIFont systemFontOfSize:26];
    }];
    
}
static NSDictionary *__dicName(){
    return @{@"100":@"满意",@"101":@"较满意",@"102":@"一般",@"103":@"较不满意",@"104":@"不满意"};
}
-(void)answerBtnsClick:(Button1 *)btn{
    for (UIButton *btn in self.answerBtns) {
        btn.selected = NO;
    }
    btn.selected = !btn.selected;
}



-(NSString *)answerStr{
    NSMutableString *str = @"".mutableCopy;
    for (UIButton *btn in self.answerBtns) {
        if (btn.selected) {
            [str appendString:[NSString stringWithFormat:@"%@",@(btn.tag)]];
        }
    }
    return str.copy;
}


-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    NSString *classStr = NSStringFromClass(self.class);
    NSString *numberStr = [classStr substringFromIndex:@"Q1Controller".length];
    id a = [self.model valueForKeyPath:[NSString stringWithFormat:@"question%@",numberStr]];
    NSLog(@"页面%@答案%@",numberStr,a);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
