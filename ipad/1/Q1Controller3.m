//
//  Q1Controller3.m
//  ipad
//
//  Created by tian.liang on 2017/7/24.
//  Copyright © 2017年 welkiner. All rights reserved.
//

#import "Q1Controller3.h"
#import "FinishController.h"
#import "AnswerData.h"
@interface Q1Controller3 (){
    NSMutableArray <Button1 *> * _selectBtnArray;
}

@end

@implementation Q1Controller3

- (void)viewDidLoad {
    [super viewDidLoad];
    _selectBtnArray = @[].mutableCopy;
    
    // Do any additional setup after loading the view.
}

-(void)answerBtnsClick:(Button1 *)btn{
    if (_selectBtnArray.count == 2 && ![_selectBtnArray containsObject:btn]) {
        UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请先取消一个" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [view show];
        return;
    }
    if ([_selectBtnArray containsObject:btn]) {
        [_selectBtnArray removeObject:btn];
        btn.selected = NO;
        return;
    }
    if (_selectBtnArray.count < 2) {
        [_selectBtnArray addObject:btn];
        btn.selected = YES;
    }
}

- (IBAction)nextBtnClick:(id)sender {
    self.model.question3 = [self answerStr];
    if (self.model.question3.length != 2) {
        UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请选择" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [view show];
        return;
    }
    
    
    [AnswerData saveData:self.model];
    FinishController *con = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"FinishController"];
    [self.navigationController pushViewController:con animated:YES];
    
//    Q1Controller4 *con = [Q1Controller4 controllerWithModel:self.model];
//    [self.navigationController pushViewController:con animated:YES];
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
