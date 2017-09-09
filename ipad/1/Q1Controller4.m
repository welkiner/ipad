//
//  Q1Controller4.m
//  ipad
//
//  Created by tian.liang on 2017/7/24.
//  Copyright © 2017年 welkiner. All rights reserved.
//

#import "Q1Controller4.h"
#import "Q1Controller5.h"


@implementation Q1Controller4

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view.
}
- (IBAction)nextBtnClick:(id)sender {
    self.model.question4 = [NSString stringWithFormat:@"%@%@%@%@%@",[self answerStr],[self answerStr2],[self answerStr3],[self answerStr4],[self answerStr5]];
    if (self.model.question4.length < 5) {
        UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请选择" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [view show];
        return;
    }
    Q1Controller5 *con = [Q1Controller5 controllerWithModel:self.model];
    [self.navigationController pushViewController:con animated:YES];
}

- (IBAction)backBtnClick:(id)sender {
    self.model.question4 = nil;
    [self.navigationController popViewControllerAnimated:YES];
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
