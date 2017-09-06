//
//  Q1Controller4.m
//  ipad
//
//  Created by tian.liang on 2017/7/24.
//  Copyright © 2017年 welkiner. All rights reserved.
//

#import "Q1Controller4.h"
#import "Q1Controller5.h"

@interface Q1Controller4 (){

}
@end

@implementation Q1Controller4

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    // Do any additional setup after loading the view.
}
- (IBAction)nextBtnClick:(id)sender {
    self.model.question4 = [self answerStr];
    if (self.model.question4.length == 0) {
        UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请选择" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [view show];
        return;
    }
    Q1Controller5 *con = [Q1Controller5 controllerWithModel:self.model];
    [self.navigationController pushViewController:con animated:YES];

}


-(void)keyboardWillShow:(NSNotification*)sender{
//    CGRect textFildRect = [self.view convertRect:self.textField.frame fromView:self.textField.superview ];
//    CGRect keyboardRect = [sender.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
//    
//    CGFloat deltaY = keyboardRect.origin.y -textFildRect.size.height-textFildRect.origin.y - 60;
//    if (deltaY <0) {
//        [UIView animateWithDuration:[sender.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue] animations:^{
//            self.view.transform = CGAffineTransformMakeTranslation(0, deltaY);
//        }];
//    }
}
-(void)keyboardWillHide:(NSNotification*)sender{
    [UIView animateWithDuration:[sender.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue] animations:^{
        self.view.transform = CGAffineTransformIdentity;
    }];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (IBAction)backBtnClick:(id)sender {
    self.model.question4 = nil;
    self.model.question4_other = nil;
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
