//
//  UserModel.mm
//  PQ_WCDB
//
//  Created by Captain on 2018/7/6.
//  Copyright © 2018年 Captain. All rights reserved.
//

#import "UserModel+WCTTableCoding.h"
#import "UserModel.h"
#import <WCDB/WCDB.h>

@implementation UserModel

#pragma mark - 定义绑定到数据库表的类

WCDB_IMPLEMENTATION(UserModel)

#pragma mark - 定义需要绑定到数据库表的字段
WCDB_SYNTHESIZE(UserModel, uid)
WCDB_SYNTHESIZE(UserModel, age)
WCDB_SYNTHESIZE(UserModel, name)
WCDB_SYNTHESIZE(UserModel, mobile)
//WCDB_SYNTHESIZE_COLUMN(UserModel, <#property5#>, "<#column name#>") // Custom column name

//WCDB_SYNTHESIZE_DEFAULT(UserModel, <#property6#>, <#default value#>) // Default to WCTDefaultTypeCurrentTime, WCTDefaultTypeCurrentDate, WCTDefaultTypeCurrentTimestamp or your custom literal value
#pragma mark - 设置主键 主键自增
WCDB_PRIMARY_ASC_AUTO_INCREMENT(UserModel, uid)
//WCDB_UNIQUE(UserModel, <#property3#>)
//WCDB_NOT_NULL(UserModel, <#property4#>)

@end
