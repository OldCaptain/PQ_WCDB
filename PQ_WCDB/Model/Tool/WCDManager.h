//
//  WCDManager.h
//  WCDBTest
//
//  Created by Captain on 2018/7/6.
//  Copyright © 2018年 Captain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"

@interface WCDManager : NSObject

+(WCDManager *)defaultManager;

//关闭数据库
+(void)killDB;

//添加数据
- (BOOL)insertUser:(UserModel*)mod;

//更新所有的数据
- (BOOL)updateUser:(UserModel*)mod;

//根据userid进行更新数据
- (BOOL)updateAgeAndUserIDWithMod:(UserModel*)mod;

//通过model进行删除
- (BOOL)deleteUser:(UserModel*)mod;

//删除所有
- (BOOL)deleteAllUsers;

//通过userid查询
- (UserModel *)getUserWithId:(NSString*)userID;

//查询所有数据
- (NSArray*)getAllUser;


@end
