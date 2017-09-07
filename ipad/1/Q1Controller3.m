//
//  Q1Controller3.m
//  ipad
//
//  Created by tian.liang on 2017/7/24.
//  Copyright © 2017年 welkiner. All rights reserved.
//

#import "Q1Controller3.h"
#import "Q1Controller4.h"
#import <ReactiveCocoa.h>
@interface Q1Controller3 (){
    __weak Button1 *_btn;
}
@property (weak, nonatomic) IBOutlet UITextField *textfield;

@end

@implementation Q1Controller3

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    for (Button1 *btn in self.answerBtns) {
        if (btn.tag == 104) {
            btn.userInteractionEnabled = NO;
            _btn = btn;
        }
        
    }
//    @weakify(self);
//    [self.textfield.rac_textSignal subscribeNext:^(NSString *x) {
//        @strongify(self);
//
//    }];
    // Do any additional setup after loading the view.
}
- (IBAction)nextBtnClick:(id)sender {
    self.model.question3 = [self answerStr];
    if (self.model.question3.length == 0) {
        UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请选择" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [view show];
        return;
    }
    Q1Controller4 *con = [Q1Controller4 controllerWithModel:self.model];
    [self.navigationController pushViewController:con animated:YES];
}
- (IBAction)backBtnClick:(id)sender {
    self.model.question3 = nil;
    self.model.question3_other = nil;
    [self.navigationController popViewControllerAnimated:YES];
}

-(BOOL)mutiAnswer{
    return YES;
}
-(void)keyboardWillShow:(NSNotification*)sender{
    CGRect textFildRect = [self.view convertRect:self.textfield.frame fromView:self.textfield.superview ];
    CGRect keyboardRect = [sender.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    CGFloat deltaY = keyboardRect.origin.y -textFildRect.size.height-textFildRect.origin.y - 60;
    if (deltaY <0) {
        [UIView animateWithDuration:[sender.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue] animations:^{
            self.view.transform = CGAffineTransformMakeTranslation(0, deltaY);
        }];
    }
}
-(void)keyboardWillHide:(NSNotification*)sender{
    if (self.textfield.text.length >0 && self.model.question3_other.length >0) {
        
    }else if (self.textfield.text.length == 0 && self.model.question3_other.length == 0){
        
    }else {
        [self answerBtnsClick:_btn];
    }

    self.model.question3_other = self.textfield.text;
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
