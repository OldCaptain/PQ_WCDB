//
//  ViewController.m
//  PQ_WCDB
//
//  Created by Captain on 2018/7/5.
//  Copyright © 2018年 Captain. All rights reserved.
//

#import "ViewController.h"
#import "AddViewController.h"
#import "UserTableViewCell.h"

#import "WCDManager.h"
#import "UserModel.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)UITextField *passTextF;
@property (nonatomic,strong)NSMutableArray *dataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"测试WCDB";
    self.dataSource = [NSMutableArray array];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self creatRight];
    
    [self creatTableView];
    
    [self getData];
    
}
-(void)getData{
    
    [self.dataSource removeAllObjects];
    
    NSArray *array = [[WCDManager defaultManager] getAllUser];
    [self.dataSource addObjectsFromArray:array];
    [self.tableView reloadData];
    
}


-(void)creatRight{
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:@selector(rightBtn:)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"清空" style:UIBarButtonItemStylePlain target:self action:@selector(leftBtn:)];
}
-(void)leftBtn:(UIBarButtonItem *)btn{
    
    [[WCDManager defaultManager] deleteAllUsers];
    [self getData];

}

-(void)rightBtn:(UIBarButtonItem *)btn{
    
    AddViewController *student = [[AddViewController alloc] init];
    student.AddBlock = ^(NSString *name) {
        [self getData];

    };
    [self.navigationController pushViewController:student animated:YES];
    
}


-(void)creatTableView{
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UserTableViewCell class] forCellReuseIdentifier:@"usercell"];
    [self.view addSubview:self.tableView];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataSource.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"usercell"];
    if (!cell) {
        cell = [[UserTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"usercell"];
    }
    UserModel *model = self.dataSource[indexPath.row];
    cell.dataLabel.text = [NSString stringWithFormat:@"%ld----%@----%@-----%ld",(long)model.uid,model.name,model.mobile,(long)model.age];
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    UserModel *model = self.dataSource[indexPath.row];

    [[WCDManager defaultManager] deleteUser:model];

    [self getData];
}

@end
