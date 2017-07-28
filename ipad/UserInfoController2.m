//
//  UserInfoController2.m
//  ipad
//
//  Created by tian.liang on 2017/7/24.
//  Copyright © 2017年 welkiner. All rights reserved.
//

#import "UserInfoController2.h"
#import "HETAddressPicker.h"
#import <ReactiveCocoa.h>
#import "Q1Controller1.h"
#import "UserModel.h"
@interface UserInfoController2 (){
    HETAddressInfo *_addressinfo;
    UserModel *_model;
}
@property (weak, nonatomic) IBOutlet UIButton *cityBtn;
@property (weak, nonatomic) IBOutlet UITextField *textfield;

@end

@implementation UserInfoController2

- (void)viewDidLoad {
    [super viewDidLoad];
    _model = [UserModel new];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    // Do any additional setup after loading the view.
}
- (IBAction)cityBtnClick:(id)sender {
    @weakify(self);
    [HETAddressPicker pickerIn:self.view defaultInfo:_addressinfo choose:^(HETAddressInfo * _Nonnull newInfo) {
        @strongify(self);
        self -> _addressinfo = newInfo;
        self -> _model.province = _addressinfo.province;
        self -> _model.city = _addressinfo.city;
        [self.cityBtn setTitle:[NSString stringWithFormat:@"%@-%@",self -> _addressinfo.province,_addressinfo.city] forState:UIControlStateNormal];
    }];
}

- (IBAction)submitBtnClick:(id)sender {
    _model.organization = self.textfield.text;
    if (_model.organization.length == 0 ||
        _model.province.length == 0) {
        UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请填写所有资料" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [view show];
        return;
    }
    Q1Controller1 *con = [Q1Controller1 controllerWithModel:_model];
    [self.navigationController pushViewController:con animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
 
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
