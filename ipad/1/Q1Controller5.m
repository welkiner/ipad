//
//  Q1Controller5.m
//  ipad
//
//  Created by tian.liang on 2017/9/6.
//  Copyright © 2017年 welkiner. All rights reserved.
//

#import "Q1Controller5.h"
#import "AnswerData.h"
@interface Q1Controller5 ()

@end

@implementation Q1Controller5

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)nextBtnClick:(id)sender {
//    NSMutableString *questionStr = @"".mutableCopy;
//    for (NSString *str in _listArray) {
//        [questionStr appendString:str];
//    }
//    self.model.question4 = questionStr.copy;
//    
//    if (_textField.text.length > 0) {
//        self.model.question4_E = _textField.text;
//    }
//    
//    [AnswerData saveData:self.model];
//    FinishController *con = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"FinishController"];
//    [self.navigationController pushViewController:con animated:YES];
}
- (IBAction)backBtnClick:(id)sender {
    self.model.question2 = nil;
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
