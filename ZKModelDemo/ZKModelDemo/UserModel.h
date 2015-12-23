//
//  UserModel.h
//  ZKModelDemo
//
//  Created by 王文壮 on 15/12/23.
//  Copyright © 2015年 ZKTeam. All rights reserved.
//

#import "ZKModel.h"

@interface UserModel : ZKModel<ZKModelSerializing>
/**
 *  对应数据表字段id，对应json字段id
 */
@property(nonatomic, copy) NSString *key;
/**
 *  对应数据表字段name，对应json字段name
 */
@property(nonatomic, copy) NSString *name;
/**
 *  对应数据表字段age，对应json字段
 */
@property(nonatomic, copy) NSNumber *age;
@end
