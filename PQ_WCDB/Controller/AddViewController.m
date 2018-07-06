//
//  AddViewController.m
//  PQ_WCDB
//
//  Created by Captain on 2018/7/6.
//  Copyright © 2018年 Captain. All rights reserved.
//

#import "AddViewController.h"
#import "UserModel.h"
#import "WCDManager.h"

#define PQ_WIDTH [UIScreen mainScreen].bounds.size.width
#define PQ_HEIGHT [UIScreen mainScreen].bounds.size.height


@interface AddViewController ()

@property(nonatomic,strong)UITextField *nameText;
@property(nonatomic,strong)UITextField *ageText;
@property(nonatomic,strong)UITextField *mobileText;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"添加数据";

    [self creatUI];
    
}

-(void)creatUI{
    
    _nameText = [[UITextField alloc]init];
    _nameText.backgroundColor = [UIColor greenColor];
    _nameText.placeholder = @"姓名";
    [self.view addSubview:_nameText];
    _nameText.frame = CGRectMake(30, 30 + 70, PQ_WIDTH - 60, 50);
    
    _ageText = [[UITextField alloc]init];
    _ageText.backgroundColor = [UIColor greenColor];
    _ageText.placeholder = @"年龄";
    [self.view addSubview:_ageText];
    _ageText.frame = CGRectMake(30, 110 + 70, PQ_WIDTH - 60, 50);
    
    
    _mobileText = [[UITextField alloc]init];
    _mobileText.backgroundColor = [UIColor greenColor];
    _mobileText.placeholder = @"电话";
    [self.view addSubview:_mobileText];
    _mobileText.frame = CGRectMake(30, 190 + 70, PQ_WIDTH - 60, 50);
    
    
    
    UIButton *sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
    sureButton.frame = CGRectMake(40, 280 + 70, PQ_WIDTH - 80, 50);
    [sureButton setTitle:@"确定提交" forState:UIControlStateNormal];
    [sureButton setBackgroundColor:[UIColor orangeColor]];
    [sureButton addTarget:self action:@selector(surebuttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sureButton];

}

-(void)surebuttonAction:(UIButton *)btn{
    UserModel *model = [[UserModel alloc] init];
    model.name = _nameText.text;
//    model.uid = @"";
    model.age = [_ageText.text integerValue];
    model.mobile = _mobileText.text;
    NSLog(@"提交数据");

    NSLog(@"tempMod.userID %ld",(long)model.uid);
    
    if ([[WCDManager defaultManager] insertUser:model]) {
        
        NSLog(@"添加字段成功");
        if (self.AddBlock) {
            self.AddBlock(@"");
        }
        [self.navigationController popViewControllerAnimated:YES];
        
    }else{
        
        NSLog(@"添加字段失败");
        
    }
}

@end
