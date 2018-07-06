//
//  WCDManager.m
//  WCDBTest
//
//  Created by Captain on 2018/7/6.
//  Copyright © 2018年 Captain. All rights reserved.
//

#import "WCDManager.h"
#import "UserModel+WCTTableCoding.h"

static WCDManager *instance = nil;
static NSString *const stairNoteTabel = @"stairNoteTabel";

@interface WCDManager ()

@property (nonatomic,strong) WCTDatabase *noteDataBase;

/**
 一级笔记
 */
@property (nonatomic,strong) WCTTable    *stairNotetable;

@end

@implementation WCDManager

+(WCDManager *)defaultManager
{
    if (instance) {
        return instance;
    }
    @synchronized (self) {
        if (instance == nil) {
            instance = [[WCDManager alloc]init];
            [instance creatDB];
        }
    }
    return instance;
}

+(void)killDB
{
    instance = nil;
}

- (BOOL)creatDB
{
    NSString *stairbBPath = [self getStairDBPath];
    NSLog(@"DBPath:%@",stairbBPath);

    self.noteDataBase = [[WCTDatabase alloc]initWithPath:stairbBPath];

    //一级笔记
    BOOL stairResult = [self.noteDataBase createTableAndIndexesOfName:stairNoteTabel withClass:UserModel.class];
    self.stairNotetable    = [self.noteDataBase getTableOfName:stairNoteTabel withClass:UserModel.class];
    assert(stairResult);

    
    if ([self.noteDataBase canOpen]) {
        NSLog(@"能打开数据库");
    }else{
        NSLog(@"不能打开数据库");
    }
    if ([self.noteDataBase isOpened]) {
        NSLog(@"打开中");
    }else{
        NSLog(@"没打开");
    }
    return stairResult;
}
- (NSString *)getStairDBPath {
    NSString *databasePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/56ClassTeacher/noteModule"];
    databasePath = [databasePath stringByAppendingPathComponent:@"stairNoteTabel.db"];
    return databasePath;
}


#pragma mark  一级笔记

- (BOOL)insertUser:(UserModel*)mod
{
    mod.isAutoIncrement = YES;

    return [self.stairNotetable insertObject:mod];
}

- (BOOL)updateUser:(UserModel*)mod
{
    return [self.stairNotetable updateRowsOnProperties:UserModel.AllProperties withObject:mod where:UserModel.uid == mod.uid];
}

- (BOOL)updateAgeAndUserIDWithMod:(UserModel*)mod
{
    return [self.stairNotetable updateRowsOnProperties:{UserModel.name,UserModel.age,UserModel.mobile}  withObject:mod where:UserModel.uid == mod.uid];
}

- (BOOL)deleteUser:(UserModel*)mod
{
    return [self.stairNotetable deleteObjectsWhere:UserModel.uid == mod.uid];
}

- (BOOL)deleteAllUsers
{
    return [self.stairNotetable deleteAllObjects];
}

- (UserModel *)getUserWithId:(NSString*)userID
{
    return [self.stairNotetable getObjectsWhere:UserModel.uid == userID].firstObject;
}


- (NSArray*)getAllUser
{
    return [self.stairNotetable getAllObjects];
}

@end
