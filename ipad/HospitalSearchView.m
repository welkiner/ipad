//
//  HospitalSearchView.m
//  ipad
//
//  Created by tian.liang on 2017/7/24.
//  Copyright © 2017年 welkiner. All rights reserved.
//

#import "HospitalSearchView.h"
#import "Masonry.h"
#import "HospitalDataBase.h"
@interface HospitalSearchView()<UITableViewDelegate,UITableViewDataSource>{
    NSArray *_listArray;
}
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bgConstraint;
@property (weak, nonatomic) IBOutlet UIView *bigBgView;
@property (copy, nonatomic) void (^chooseHospitalName)(NSString *);
@end
@implementation HospitalSearchView
+(void)showInView:(UIView *)view hospitalName:(void (^)(NSString* str))hospitalName{
    HospitalSearchView *vi =[[NSBundle mainBundle] loadNibNamed:@"HospitalSearchView" owner:nil options:nil][0];
    [view.window addSubview:vi];
    [vi mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.window.mas_top);
        make.right.equalTo(view.window.mas_right);
        make.bottom.equalTo(view.window.mas_bottom);
        make.left.equalTo(view.window.mas_left);
    }];
    vi.bgConstraint.constant = -vi.frame.size.height;
    [vi layoutIfNeeded];
    
    vi.bgConstraint.constant = 50;
    vi.alpha = 0;
    [UIView animateWithDuration:0.25 animations:^{
        [vi layoutIfNeeded];
        vi.alpha = 1;
    } completion:^(BOOL finished) {
        [vi.textField becomeFirstResponder];
    }];
    vi.chooseHospitalName = hospitalName;
//    return vi;
}
-(void)awakeFromNib{
    [super awakeFromNib];
    self.bgView.clipsToBounds = YES;
    self.bgView.layer.cornerRadius = 10.f;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancelBtnClick)];
    [self.bigBgView addGestureRecognizer:tapGesture];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.tableFooterView = [UIView new];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(text) name:UITextFieldTextDidChangeNotification object:nil];
}
-(void)text{
    _listArray = [[HospitalDataBase shareInstance] queryWithName:self.textField.text];
    [self.tableView reloadData];
}

-(void)cancelBtnClick{
    if (self.textField.isFirstResponder) {
        [self.textField resignFirstResponder];
        return;
    }
    
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _listArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = _listArray[indexPath.row][@"PYName"];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:20.f];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    !self.chooseHospitalName?:self.chooseHospitalName(_listArray[indexPath.row][@"PYName"]);
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
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.f;
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
