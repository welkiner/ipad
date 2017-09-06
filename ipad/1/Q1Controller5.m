//
//  Q1Controller5.m
//  ipad
//
//  Created by tian.liang on 2017/9/6.
//  Copyright © 2017年 welkiner. All rights reserved.
//

#import "Q1Controller5.h"
#import "AnswerData.h"
#import "FinishController.h"
@interface Q1Controller5 ()

@end

@implementation Q1Controller5

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)nextBtnClick:(id)sender {
    
    self.model.question5 = [self answerStr];
    if (self.model.question5.length == 0) {
        UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请选择" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [view show];
        return;
    }
    
    [AnswerData saveData:self.model];
    FinishController *con = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"FinishController"];
    [self.navigationController pushViewController:con animated:YES];
}
- (IBAction)backBtnClick:(id)sender {
    self.model.question5 = nil;
    [self.navigationController popViewControllerAnimated:YES];
}
-(BOOL)mutiAnswer{
    return YES;
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
