//
//  Q1Controller8.m
//  ipad
//
//  Created by tl on 2017/9/9.
//  Copyright © 2017年 welkiner. All rights reserved.
//

#import "Q1Controller8.h"
#import "Q1Controller9.h"
@interface Q1Controller8 ()

@end

@implementation Q1Controller8

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)nextBtnClick:(id)sender {
    self.model.question3 = [NSString stringWithFormat:@"%@%@%@",[self answerStr],[self answerStr2],[self answerStr3]];
    if (self.model.question3.length < 3) {
        UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请选择" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [view show];
        return;
    }
    Q1Controller9 *con = [Q1Controller9 controllerWithModel:self.model];
    [self.navigationController pushViewController:con animated:YES];
}
- (IBAction)backBtnClick:(id)sender {
    self.model.question3 = nil;
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
