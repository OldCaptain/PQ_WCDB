//
//  UserModel+WCTTableCoding.h
//  PQ_WCDB
//
//  Created by Captain on 2018/7/6.
//  Copyright © 2018年 Captain. All rights reserved.
//

#import "UserModel.h"
#import <WCDB/WCDB.h>

@interface UserModel (WCTTableCoding) <WCTTableCoding>

WCDB_PROPERTY(uid)
WCDB_PROPERTY(age)
WCDB_PROPERTY(name)
WCDB_PROPERTY(mobile)

@end
