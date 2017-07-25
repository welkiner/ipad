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
#import "GCDWebUploader.h"
@interface FirstController (){
    GCDWebUploader* _webUploader;
}

@end

@implementation FirstController


- (IBAction)beginBtnClick:(UIButton *)sender {
    UIViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"UserInfoController2"];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)shareBtnClick:(id)sender {
    [AnswerData csvData];
    
    NSString* documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    _webUploader = [[GCDWebUploader alloc] initWithUploadDirectory:documentsPath];
    [_webUploader start];
    NSLog(@"Visit %@ in your web browser", _webUploader.serverURL);
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
