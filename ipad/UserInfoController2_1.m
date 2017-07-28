//
//  UserInfoController2_1.m
//  ipad
//
//  Created by tl on 2017/7/28.
//  Copyright © 2017年 welkiner. All rights reserved.
//

#import "UserInfoController2_1.h"
#import "HETAddressPicker.h"
#import <ReactiveCocoa.h>
#import "Q2Controller1.h"
#import "UserModel2.h"
@interface UserInfoController2_1 (){
    HETAddressInfo *_addressinfo;
    UserModel2 *_model;
}
@property (weak, nonatomic) IBOutlet UIButton *cityBtn;

@end

@implementation UserInfoController2_1

- (void)viewDidLoad {
    [super viewDidLoad];
    _model = [UserModel2 new];
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
    if (
        _model.province.length == 0) {
        UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请选择省市" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [view show];
        return;
    }
    Q2Controller1 *con = [Q2Controller1 controllerWithModel2:_model];
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
