//
//  HETUserInfoPickerView.h
//  HETPublic
//
//  Created by tl on 15/9/17.
//  Copyright (c) 2015年 HET. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface HETPublicPickerView : UIView

/**
 *  生成pick选择器
 *
 */
+(instancetype)viewWithTitle:(NSString *)title;


/**
 *  展现
 *
 *  @param view        在哪个视图展示
 *  @param pickChanged    每一个元素代表一行中选中的第几列
 */
-(void)showInView:(UIView *)view pickChanged:(void (^)(NSArray*indexArray))pickChanged;

/**
 *  默认选择第几个
 *
 *  @param indexArray       每一个元素代表一行中选中的第几列
 *  @param animated 是否动画
 */
-(void)defaultSelect:(NSArray *)indexArray animated:(BOOL)animated;

/**
 *  有几列
 */
@property (copy, nonatomic)NSInteger (^(numberOfComponent))();


@property (copy, nonatomic)NSInteger (^(numberOfRowsInComponent))(NSInteger componentIndex);

@property (copy, nonatomic)NSString *(^(titleForRowAndComponent))(NSInteger componentIndex,NSInteger row);

/**
 *  值改变时需要刷新第几列的数据源，不写不刷新（不联动）
 *  返回数组是需要联动多个列
 */
@property (copy, nonatomic)NSArray* (^(rowChangedNeedReloadComponentIndex))(NSInteger changedComponent,NSInteger changeedRow);

/**
 *  当前有在第几行
 *
 *  @param component 列
 */
-(NSInteger)currentRowInComponent:(NSInteger)component;
@end
