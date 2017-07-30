//
//  WifiView.m
//  ipad
//
//  Created by tl on 2017/7/26.
//  Copyright © 2017年 welkiner. All rights reserved.
//

#import "WifiView.h"
#import "Masonry.h"
#import "GCDWebUploader.h"
@interface WifiView(){
    GCDWebUploader* _webUploader;
}
@property (weak, nonatomic) IBOutlet UIView *bigBigView;
@property (weak, nonatomic) IBOutlet UILabel *ipLabel;
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bgConstraint;
@end
@implementation WifiView
+(void)showInView:(UIView *)view{
    WifiView *vi =[[NSBundle mainBundle] loadNibNamed:@"WifiView" owner:nil options:nil][0];
    [view.window addSubview:vi];
    vi.bgView.layer.cornerRadius = 10.f;
    vi.bgView.clipsToBounds = YES;
    vi.ipLabel.layer.cornerRadius = 5.f;
    vi.ipLabel.clipsToBounds = YES;
    
    [vi mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.window.mas_top);
        make.right.equalTo(view.window.mas_right);
        make.bottom.equalTo(view.window.mas_bottom);
        make.left.equalTo(view.window.mas_left);
    }];
    vi.bgConstraint.constant = -vi.frame.size.height;
    [vi layoutIfNeeded];
    
    vi.bgConstraint.constant = 167;
    vi.alpha = 0;
    [UIView animateWithDuration:0.25 animations:^{
        [vi layoutIfNeeded];
        vi.alpha = 1;
    } completion:^(BOOL finished) {
        
    }];
}
-(void)awakeFromNib{
    [super awakeFromNib];
    self.bgView.clipsToBounds = YES;
    self.bgView.layer.cornerRadius = 10.f;
    self.ipLabel.layer.cornerRadius = 5.f;
    self.ipLabel.clipsToBounds = YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancelBtnClick)];
    [self.bigBigView addGestureRecognizer:tapGesture];
    NSString* documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    _webUploader = [[GCDWebUploader alloc] initWithUploadDirectory:documentsPath];
    [_webUploader start];
    if ([_webUploader.serverURL absoluteString].length == 0) {
        self.ipLabel.text = @"请确保ipad连接WiFi";
    }else{
        self.ipLabel.text = [_webUploader.serverURL absoluteString];
    }
    
}
-(void)cancelBtnClick{
    [_webUploader stop];
    self.bgConstraint.constant = -self.frame.size.height;
    [UIView animateWithDuration:0.25 animations:^{
        [self layoutIfNeeded];
        self.alpha = 0;
    } completion:^(BOOL finished) {
        if (finished) {
            [self removeFromSuperview];
        }
    }];
}
-(void)dealloc{
    NSLog(@"%s",__func__);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
