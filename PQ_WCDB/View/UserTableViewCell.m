//
//  UserTableViewCell.m
//  PQ_WCDB
//
//  Created by Captain on 2018/7/6.
//  Copyright © 2018年 Captain. All rights reserved.
//

#import "UserTableViewCell.h"
#define PQ_WIDTH [UIScreen mainScreen].bounds.size.width
#define PQ_HEIGHT [UIScreen mainScreen].bounds.size.height


@implementation UserTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatUI];
    }
    return self;
}


-(void)creatUI{
    
    _dataLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 0, PQ_WIDTH - 60, 60)];
    _dataLabel.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:_dataLabel];
    
    
}


@end
