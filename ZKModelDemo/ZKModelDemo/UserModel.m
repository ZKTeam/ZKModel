//
//  UserModel.m
//  ZKModelDemo
//
//  Created by 王文壮 on 15/12/23.
//  Copyright © 2015年 ZKTeam. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

+ (NSString *)ZKDBTableName {
    return @"User";
}
+ (NSDictionary *)ZKDBPrimaryKeys {
    return @{ @"key" : @"id" };
}
+ (NSDictionary *)ZKPropertyKeys {
    return @{
             @"key" : @"id",
             @"name" : @"name",
             @"age" : @"age"
             };
}
@end
