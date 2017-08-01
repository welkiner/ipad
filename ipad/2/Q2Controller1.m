//
//  Q1Controller1.m
//  ipad
//
//  Created by tian.liang on 2017/7/24.
//  Copyright © 2017年 welkiner. All rights reserved.
//

#import "Q2Controller1.h"
#import "Q2Controller2.h"
@interface Q2Controller1 ()

@end

@implementation Q2Controller1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
//-(void)answerBtnsClick:(Button1 *)btn{
//    btn.selected = !btn.selected;
//}
- (IBAction)nextBtnClick:(id)sender {
    self.model2.question1 = [self answerStr];
    if (self.model2.question1.length == 0) {
        UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请选择" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [view show];
        return;
    }
    Q2Controller2 *con = [Q2Controller2 controllerWithModel2:self.model2];
    [self.navigationController pushViewController:con animated:YES];
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