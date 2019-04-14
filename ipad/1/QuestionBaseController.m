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
    [self makepageBtn];
    // Do any additional setup after loading the view.
}
#pragma mark -----title
-(void)addTitle{
    UILabel *label = [[UILabel alloc] init];
    [self.view addSubview:label];
    NSString *classStr = NSStringFromClass(self.class);
    NSString *numberStr = [classStr substringFromIndex:@"Q1Controller".length];
    label.text = __ArrayName()[numberStr.integerValue-1];
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
             @"2、展馆内部导向示意图和图标",
             @"3、展馆停车场规模",
             @"4、展会规模以及水平",
             @"5、展会主题的吸引力",
             @"6、展会宣传力度",
             @"7、展会同期活动",
             @"8、参展商知名度",
             @"9、展会门票价格",
             @"10、展会现场秩序及安全情况",
             @"11、展会现场工作人员专业性和及时性",
             @"12、展会现场餐饮配套服务",
             @"13、欢迎您提出宝贵的建议"
             ];
}

#pragma mark -----answerBtns

#define kSpace 5
#define kTag 100
-(void)makeButton{
    self.answerBtn1 = [Button1 button];
    [self.view addSubview:self.answerBtn1];
    [self.answerBtn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(320);
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
        
        obj.tag = kTag+idx+1;
        NSString * a = [NSString stringWithFormat:@"%@",@(obj.tag)];
        [obj setTitle:__dicName()[a] forState:UIControlStateNormal];
        
        obj.titleLabel.font = [UIFont systemFontOfSize:26];
        obj.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        obj.titleEdgeInsets = UIEdgeInsetsMake(0, 80, 0, 80);
    }];
    
}
static NSDictionary *__dicName(){
    return @{@"101":@"A：满意",@"102":@"B：较满意",@"103":@"C：一般",@"104":@"D：较不满意",@"105":@"E：不满意"};
}
-(void)answerBtnsClick:(Button1 *)btn{
    for (UIButton *btn in self.answerBtns) {
        btn.selected = NO;
    }
    btn.selected = !btn.selected;
}
#pragma mark -----pageBtn
#define kPageHeight 75
-(void)makepageBtn{
    self.backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.backBtn setImage:[UIImage imageNamed:@"上一题"] forState:UIControlStateNormal];
    [self.view addSubview:self.backBtn];
    [self.backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(-83);
        make.height.mas_equalTo(kPageHeight);
        make.width.mas_equalTo(kPageHeight*1.49);
        make.left.equalTo(self.view.mas_left).offset(78);
    }];
    
    self.nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.nextBtn setImage:[UIImage imageNamed:@"下一题"] forState:UIControlStateNormal];
    [self.view addSubview:self.nextBtn];
    [self.nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(-83);
        make.height.mas_equalTo(kPageHeight);
        make.width.mas_equalTo(kPageHeight*1.49);
        make.right.equalTo(self.view.mas_right).offset(-78);
    }];
    [self.nextBtn addTarget:self action:@selector(nextBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
}
-(void)nextBtnClick{
    NSString *answerStr =[self answerStr];
    if (answerStr.length == 0) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"请选择" preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alertController animated:YES completion:nil];
        return;
    }
    NSString *classStr = NSStringFromClass(self.class);
    NSString *numberStr = [classStr substringFromIndex:@"Q1Controller".length];
    [self.model change:answerStr index:numberStr.integerValue];
    
    Class a = NSClassFromString([NSString stringWithFormat:@"Q1Controller%@",@(numberStr.integerValue+1)]);
    QuestionBaseController *vc = [a controllerWithModel:self.model];
    [self.navigationController pushViewController:vc animated:YES];
//    NSLog(@"%@ %s",self.model.choose,__func__);
}
-(void)backBtnClick{
    NSString *classStr = NSStringFromClass(self.class);
    NSString *numberStr = [classStr substringFromIndex:@"Q1Controller".length];
    
    [self.model clearIndex:numberStr.integerValue];
    [self.navigationController popViewControllerAnimated:YES];
//    NSLog(@"%@ %s",self.model.choose,__func__);
}



-(NSString *)answerStr{
    NSString *str = @"";
    for (UIButton *btn in self.answerBtns) {
        if (btn.selected) {
            str = [NSString stringWithFormat:@"%@",@(btn.tag - kTag)];
        }
    }
    return str;
}


-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
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
