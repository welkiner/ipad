//
//  Q2Controller4.m
//  ipad
//
//  Created by tl on 2017/7/28.
//  Copyright © 2017年 welkiner. All rights reserved.
//

#import "Q2Controller4.h"
#import "FinishController.h"
#import "AnswerData.h"
@interface Q2Controller4 ()

@end

@implementation Q2Controller4

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)nextBtnClick:(id)sender {
    self.model2.question4 = [self answerStr];
    if (self.model2.question4.length == 0) {
        UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请选择" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [view show];
        return;
    }
    [AnswerData saveData2:self.model2];
    FinishController *con = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"FinishController"];
    [self.navigationController pushViewController:con animated:YES];
    //    Q1Controller4 *con = [Q1Controller4 controllerWithModel:self.model];
    //    [self.navigationController pushViewController:con animated:YES];
}
- (IBAction)backBtnClick:(id)sender {
    self.model2.question4 = nil;
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
