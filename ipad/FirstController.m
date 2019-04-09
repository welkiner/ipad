//
//  FirstController.m
//  ipad
//
//  Created by tian.liang on 2017/7/24.
//  Copyright © 2017年 welkiner. All rights reserved.
//

#import "FirstController.h"
#import "UserModel.h"
#import "AnswerData.h"
#import "MBProgressHUD.h"
#import "WifiView.h"
#import "Q1Controller1.h"
@interface FirstController (){
    
}

@end

@implementation FirstController


- (IBAction)beginBtnClick:(UIButton *)sender {
    Q1Controller1 *vc = [Q1Controller1 controllerWithModel:nil];
    vc.model = UserModel.new;
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)shareBtnClick:(id)sender {
    
    MBProgressHUD *hud=[[MBProgressHUD alloc] initWithView:[UIApplication sharedApplication].keyWindow] ;
    [[UIApplication sharedApplication].keyWindow addSubview:hud];
    [hud showAnimated:true];
    [AnswerData csvData];
    [hud hideAnimated:true];
    
    [WifiView showInView:self.view];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
