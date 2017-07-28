//
//  QuestionBaseController.m
//  ipad
//
//  Created by tian.liang on 2017/7/24.
//  Copyright © 2017年 welkiner. All rights reserved.
//

#import "QuestionBaseController.h"

@interface QuestionBaseController ()

@end

@implementation QuestionBaseController
+(instancetype)controllerWithModel:(UserModel *)model{
    QuestionBaseController *con = [[UIStoryboard storyboardWithName:@"1" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass(self)];
    con.model = model;
    return con;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    for (UIButton *btn in self.answerBtns) {
        [btn addTarget:self action:@selector(answerBtnsClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    // Do any additional setup after loading the view.
}
-(void)answerBtnsClick:(Button1 *)btn{
    if (![self mutiAnswer]) {
        for (UIButton *btn in self.answerBtns) {
            btn.selected = NO;
        }
    }
    btn.selected = !btn.selected;
}
-(BOOL)mutiAnswer{
    return NO;
}

-(NSString *)answerStr{
    NSDictionary *dic = @{@"100":@"A",
             @"101":@"B",
             @"102":@"C",
             @"103":@"D",
             @"104":@"E",
             @"105":@"F",
             @"106":@"G"};
    
    NSMutableString *str = @"".mutableCopy;
    for (UIButton *btn in self.answerBtns) {
        if (btn.selected) {
            [str appendString:dic[[NSString stringWithFormat:@"%@",@(btn.tag)]]];
        }
    }
    return str.copy;
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