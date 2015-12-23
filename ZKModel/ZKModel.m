//
//  ZKModel.m
//  ZKModel
//
//  Created by WangWenzhuang on 15/10/20.
//  Copyright © 2015年 WangWenzhuang. All rights reserved.
//

/*
 *******************************************************
 *                                                      *
 * 感谢您的支持，如果下载的代码在使用过程中出现 Bug 或者其他问题   *
 * 您可以发邮件到1020304029@qq.com 或者到                     *
 * https://github.com/WangWenzhuang/ZKModel 提交问题       *
 *                                                      *
 *******************************************************
 */

#import "ZKModel.h"
#import <objc/runtime.h>

@implementation ZKModel

+ (NSString *)tableNameForModelClass:(Class)modelClass {
    NSParameterAssert(modelClass);
    NSParameterAssert([modelClass conformsToProtocol:@protocol(ZKModelSerializing)]);
    NSParameterAssert([modelClass isSubclassOfClass:ZKModel.class]);
    NSString *tableName = [modelClass ZKDBTableName];
    NSAssert(tableName && tableName.length>0, @"未实现“ZKDBTableName”");
    return tableName;
}
+ (NSDictionary *)propertyKeysForModelClass:(Class)modelClass {
    NSParameterAssert(modelClass);
    NSParameterAssert([modelClass conformsToProtocol:@protocol(ZKModelSerializing)]);
    NSParameterAssert([modelClass isSubclassOfClass:ZKModel.class]);
    NSDictionary *propertyKeys = [modelClass ZKPropertyKeys];
    NSAssert(propertyKeys && propertyKeys.count>0, @"未实现“ZKPropertyKeys”");
    return propertyKeys;
}
+ (NSDictionary *)DBPrimaryKeysForModelClass:(Class)modelClass {
    NSParameterAssert(modelClass);
    NSParameterAssert([modelClass conformsToProtocol:@protocol(ZKModelSerializing)]);
    NSParameterAssert([modelClass isSubclassOfClass:ZKModel.class]);
    NSDictionary *primaryKeys = [modelClass ZKDBPrimaryKeys];
    NSAssert(primaryKeys && primaryKeys.count>0, @"未实现“ZKDBPrimaryKeys”");
    return primaryKeys;
}

- (id)copyWithZone:(nullable NSZone *)zone {
    Class selfClass = [self class];
    id model = [[selfClass allocWithZone:zone] init];
    unsigned int outCount;
    objc_property_t *propertyList = class_copyPropertyList(selfClass, &outCount);
    for (int i=0; i < outCount; i++)
    {
        objc_property_t property = propertyList[i];
        NSString *propertyName = [NSString stringWithUTF8String:property_getName(property)];
        id value = [[self valueForKey:propertyName] copy];
        [model setValue:value forKey:propertyName];
    }
    free(propertyList);
    return model;
}

- (NSString *)toJSON {
    NSDictionary *dictionary = [self dictionry];
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:nil];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

- (NSDictionary *)dictionry {
    Class selfClass=self.class;
    NSDictionary *propertyKeys = [selfClass propertyKeysForModelClass:selfClass];
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    for (NSString *propertyKey in propertyKeys.allKeys) {
        NSString *propertyValue = propertyKeys[propertyKey];
        [dictionary setObject:[self valueForKey:propertyKey] forKey:propertyValue];
    }
    return dictionary;
}
@end
