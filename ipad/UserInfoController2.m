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
@interface UserInfoController2 (){
    HETAddressInfo *_addressinfo;
    NSString *_keshiInfo;
    NSString *_hospitalInfo;
}
@property (weak, nonatomic) IBOutlet UIButton *cityBtn;
@property (weak, nonatomic) IBOutlet UIButton *keshiBtn;

@property (weak, nonatomic) IBOutlet UIButton *hospital;
@end

@implementation UserInfoController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)cityBtnClick:(id)sender {
    @weakify(self);
    [HETAddressPicker pickerIn:self.view defaultInfo:_addressinfo choose:^(HETAddressInfo * _Nonnull newInfo) {
        @strongify(self);
        _addressinfo = newInfo;
        [self.cityBtn setTitle:[NSString stringWithFormat:@"%@-%@",_addressinfo.province,_addressinfo.city] forState:UIControlStateNormal];
    }];
}
- (IBAction)hospitalBtnClick:(id)sender {
    @weakify(self);
    [HospitalSearchView showInView:self.view hospitalName:^(NSString *str) {
        @strongify(self);
        self -> _hospitalInfo = str;
        [self.cityBtn setTitle:_hospitalInfo forState:UIControlStateNormal];
    }];
}
- (IBAction)keshiBtnClick:(id)sender {
    @weakify(self);
    [HETKeshiPicker pickerIn:self.view choose:^(NSString * _Nonnull keshiName) {
        @strongify(self);
        _keshiInfo = keshiName;
        [self.keshiBtn setTitle:_keshiInfo forState:UIControlStateNormal];
    }];
}
- (IBAction)submitBtnClick:(id)sender {
    
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
