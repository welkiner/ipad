//
//  Q1Controller4.m
//  ipad
//
//  Created by tian.liang on 2017/7/24.
//  Copyright © 2017年 welkiner. All rights reserved.
//

#import "Q1Controller4.h"
#import "FinishController.h"
#import "AnswerData.h"
#import <Masonry.h>
@interface Cell : UITableViewCell
@property (strong,nonatomic)UILabel *label;
@property (strong,nonatomic)UILabel *label2;
@end
@implementation Cell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.label = [UILabel new];
        self.label.textColor = [UIColor blackColor];
        self.label.font = [UIFont systemFontOfSize:24];
        self.label.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.label];
        [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.left.equalTo(self);
            make.bottom.equalTo(self);
            make.width.mas_equalTo(48);
        }];
        self.label2 = [UILabel new];
        self.label2.textColor = [UIColor blackColor];
        self.label2.font = [UIFont systemFontOfSize:24];
        self.label2.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.label2];
        [self.label2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.right.equalTo(self);
            make.bottom.equalTo(self);
            make.left.equalTo(self.label.mas_right);
        }];
    }
    return self;
}
@end
@interface Cell2 : Cell
@property (strong,nonatomic)UITextField *textField;
@end
@implementation Cell2
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.label2 removeFromSuperview];
        self.label2 = nil;
        
        self.textField = [UITextField new];
        self.textField.textColor = [UIColor blackColor];
        self.textField.font = [UIFont systemFontOfSize:24];
        self.textField.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.textField];
        [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.right.equalTo(self);
            make.bottom.equalTo(self);
            make.left.equalTo(self.label.mas_right);
        }];
    }
    return self;
}
@end


@interface Q1Controller4 ()<UITableViewDelegate,UITableViewDataSource>{
    NSMutableArray *_listArray;
    NSString *_EStr;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation Q1Controller4

- (void)viewDidLoad {
    [super viewDidLoad];
    _listArray = @[@"A",@"B",@"C",@"D",@"E"].mutableCopy;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[Cell class] forCellReuseIdentifier:@"cell"];
    [self.tableView registerClass:[Cell2 class] forCellReuseIdentifier:@"cell2"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView setEditing:YES animated:YES];
    // Do any additional setup after loading the view.
}
- (IBAction)nextBtnClick:(id)sender {
//    self.model.question4 = [self answerStr];
//    if (self.model.question4.length == 0) {
//        UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请选择" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//        [view show];
//        return;
//    }
//
//    [AnswerData saveData:self.model];
//    FinishController *con = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"FinishController"];
//    [self.navigationController pushViewController:con animated:YES];
}

static NSDictionary *__dic(){
    return @{@"A":@"儿童ECMO套包",@"B":@"心室辅助套包",@"C":@"Mecc套包",@"D":@"自定义体外循环套包",@"E":@"其他请注明"};
}
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    NSUInteger fromRow = [sourceIndexPath row];
    NSUInteger toRow = [destinationIndexPath row];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 47;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _listArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([_listArray[indexPath.row] isEqualToString:@"E"]) {
        Cell2 *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2" forIndexPath:indexPath];
        cell.textField.text = __dic()[_listArray[indexPath.row]];
        cell.label.text = [NSString stringWithFormat:@"%@ ：",_listArray[indexPath.row]];
        return cell;
    }
    Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.label2.text = __dic()[_listArray[indexPath.row]];
    cell.label.text = [NSString stringWithFormat:@"%@ ：",_listArray[indexPath.row]];
    return cell;
}

-(BOOL)tableView:(UITableView *) tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleNone;
}



- (IBAction)backBtnClick:(id)sender {
    self.model.question4 = nil;
    [self.navigationController popViewControllerAnimated:YES];
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
