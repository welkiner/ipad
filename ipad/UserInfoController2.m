//
//  UserInfoController2.m
//  ipad
//
//  Created by tian.liang on 2017/7/24.
//  Copyright © 2017年 welkiner. All rights reserved.
//

#import "UserInfoController2.h"
#import "HETAddressPicker.h"
#import "HospitalSearchView.h"
#import <ReactiveCocoa.h>
#import "Q1Controller1.h"
#import "UserModel.h"
@interface UserInfoController2 (){
    HETAddressInfo *_addressinfo;
    UserModel *_model;
}
@property (weak, nonatomic) IBOutlet UIButton *cityBtn;
@property (weak, nonatomic) IBOutlet UIButton *keshiBtn;

@property (weak, nonatomic) IBOutlet UIButton *hospital;
@end

@implementation UserInfoController2

- (void)viewDidLoad {
    [super viewDidLoad];
    _model = [UserModel new];
    // Do any additional setup after loading the view.
}
- (IBAction)cityBtnClick:(id)sender {
    @weakify(self);
    [HETAddressPicker pickerIn:self.view defaultInfo:_addressinfo choose:^(HETAddressInfo * _Nonnull newInfo) {
        @strongify(self);
        self -> _addressinfo = newInfo;
        self -> _model.province = _addressinfo.province;
        self -> _model.city = _addressinfo.city;
        NSMutableString *str = [self ->_addressinfo.province mutableCopy];
        if (_addressinfo.city.length > 0 ) {
            [str appendFormat:@"-%@",_addressinfo.city];
        }
        [self.cityBtn setTitle:str.copy forState:UIControlStateNormal];
    }];
}
- (IBAction)hospitalBtnClick:(id)sender {
    @weakify(self);
    [HospitalSearchView showInView:self.view primaryName:_model.hospital hospitalName:^(NSString *str){
        @strongify(self);
        self -> _model.hospital = str;
        [self.hospital setTitle:self ->_model.hospital forState:UIControlStateNormal];
    }];
}
- (IBAction)keshiBtnClick:(id)sender {
    @weakify(self);
    [HETKeshiPicker pickerIn:self.view choose:^(NSString * _Nonnull keshiName) {
        @strongify(self);
        self -> _model.keshi = keshiName;
        [self.keshiBtn setTitle:self -> _model.keshi forState:UIControlStateNormal];
    }];
}
- (IBAction)submitBtnClick:(id)sender {
    if (_model.keshi.length == 0 ||
        _model.hospital.length == 0 ||
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
 
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
