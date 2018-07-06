//
//  UserModel.h
//  PQ_WCDB
//
//  Created by Captain on 2018/7/6.
//  Copyright © 2018年 Captain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

@property(nonatomic, assign) NSInteger uid;
@property(nonatomic, assign) NSInteger age;
@property(nonatomic, retain) NSString *name;
@property(nonatomic, retain) NSString *mobile;

@end
