//
//  ZKModelAdapter.m
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

#import "ZKModelAdapter.h"

@implementation ZKModelAdapter

+ (id)modelOfClass:(Class)modelClass fromDictionary:(NSDictionary *)dictionary {
    NSParameterAssert(modelClass && dictionary);
    NSDictionary *propertyKeys = [ZKModel propertyKeysForModelClass:modelClass];
    NSObject *model = [[modelClass alloc] init];
    for (NSString *propertyKey in propertyKeys.allKeys) {
        NSString *propertyValue = propertyKeys[propertyKey];
        if ([dictionary.allKeys containsObject:propertyValue]) {
            [model setValue:dictionary[propertyValue] forKey:propertyKey];
        }        
    }
    return model;
}

+ (NSArray *)modelsOfClass:(Class)modelClass fromArray:(NSArray *)array {
    NSParameterAssert(modelClass && array);
    NSMutableArray *models = [[NSMutableArray alloc] initWithCapacity:array.count];
    for (NSDictionary *dictionary in array) {
        [models addObject:[self modelOfClass:modelClass fromDictionary:dictionary]];
    }
    return models;
}

+ (NSString *)JSONOfModelClass:(Class)modelClass fromModel:(ZKModel<ZKModelSerializing> *)model {
    NSParameterAssert(modelClass && model);
    return [model toJSON];
}

+ (NSString *)JSONOfModelArray:(NSArray *)models {
    NSParameterAssert(models);
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:models.count];
    for (ZKModel *model in models) {
        NSAssert(model, @"实体类型不正确");
        NSParameterAssert([model.class conformsToProtocol:@protocol(ZKModelSerializing)]);
        [array addObject:[model dictionry]];
    }
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:array options:NSJSONWritingPrettyPrinted error:nil];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

@end
