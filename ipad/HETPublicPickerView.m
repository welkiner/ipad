//
//  HETUserInfoPickerView.m
//  HETPublic
//
//  Created by tl on 15/9/17.
//  Copyright (c) 2015年 HET. All rights reserved.
//

#import "HETPublicPickerView.h"
#import "Masonry.h"
@interface HETPublicPickerView ()<UIPickerViewDelegate,UIPickerViewDataSource>{
    
}
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bgConstraint;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIView *bgView;

@property (copy, nonatomic) void ((^pickChanged)(NSArray *));
@end
@implementation HETPublicPickerView
+(instancetype)viewWithTitle:(NSString *)title{
    HETPublicPickerView *view = [[NSBundle mainBundle] loadNibNamed:@"HETPublicPickerView" owner:nil options:nil][0];
    [view configViews];
    view.title.text = title;
    return view;
}
-(void)configViews{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancelBtnClick)];
    [self addGestureRecognizer:tapGesture];
    self.bgView.layer.cornerRadius = 10.f;
    self.bgView.clipsToBounds = YES;
    
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    self.pickerView.showsSelectionIndicator = YES;
}


-(void)defaultSelect:(NSArray *)indexArray animated:(BOOL)animated{
    [indexArray enumerateObjectsUsingBlock:^(NSNumber *obj, NSUInteger idx, BOOL *stop) {
        [self.pickerView selectRow:obj.integerValue inComponent:idx animated:animated];
    }];
}

-(void)showInView:(UIView *)view pickChanged:(void (^)(NSArray *))pickChanged{
    self.pickChanged = pickChanged;
    
    [view.window addSubview:self];
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.window.mas_top);
        make.right.equalTo(view.window.mas_right);
        make.bottom.equalTo(view.window.mas_bottom);
        make.left.equalTo(view.window.mas_left);
    }];
    
    
    
    self.bgConstraint.constant = -self.frame.size.height;
    [self layoutIfNeeded];
    
    self.bgConstraint.constant = 50;
    self.alpha = 0;
    [UIView animateWithDuration:0.25 animations:^{
        [self layoutIfNeeded];
        self.alpha = 1;
    } completion:^(BOOL finished) {
        
    }];
}

- (IBAction)sureBtnClick:(id)sender {
    NSMutableArray *tempArray = @[].mutableCopy;
    for (NSInteger i = 0; i<self.numberOfComponent(); i++) {
        tempArray[i] = @([self.pickerView selectedRowInComponent:i]);
    }
    !self.pickChanged?:self.pickChanged([tempArray copy]);
    [self cancelBtnClick];
}

-(void)cancelBtnClick{
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

#pragma mark ------pickerView Delegate&Datasource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView//————返回一个数字，表示UIPickerView显示有多少列
{
    return self.numberOfComponent();
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component//————返回数字，表示每一列显示的行数。注意：若每一列显示的行数不一样，可以用swich语句分别进行定义。（以两列为例）
{
    return self.numberOfRowsInComponent(component);
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component//————这个方法是定义在PickerView接收点击，滚动，选择事件的时候所做出的反映。
{
    
    if (self.rowChangedNeedReloadComponentIndex && self.rowChangedNeedReloadComponentIndex(component,row).count > 0) {
        [self.rowChangedNeedReloadComponentIndex(component,row) enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj integerValue]>0) {
                [pickerView reloadComponent:[obj integerValue]];
                [pickerView selectRow: 0 inComponent:[obj integerValue] animated:YES];
            }
        }];
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component//————这个方法是定义PickerView的各列中每一行显示的文字
{
    return self.titleForRowAndComponent(component,row);
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component//————这个方法定义每一列的宽度
{
    CGFloat componentWidth = [UIScreen mainScreen].bounds.size.width /(self.numberOfComponent()+2);
    return componentWidth;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 60;
}
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel){
        pickerLabel = [[UILabel alloc] init];
        // Setup label properties - frame, font, colors etc
        //adjustsFontSizeToFitWidth property to YES
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        [pickerLabel setFont:[UIFont boldSystemFontOfSize:40]];
    }
    // Fill the label text here
    pickerLabel.text=[self pickerView:pickerView titleForRow:row forComponent:component];
    return pickerLabel;
}
-(NSInteger)currentRowInComponent:(NSInteger)component{
    return [self.pickerView selectedRowInComponent:component];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
