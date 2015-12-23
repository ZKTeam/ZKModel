//
//  ZKModelAdapter.h
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

#import <Foundation/Foundation.h>
#import "ZKModel.h"

@interface ZKModelAdapter : NSObject
/**
 *  将字典转换实体
 *
 *  @param modelClass 实体类型
 *  @param dictionary 字典
 *
 *  @return 实体
 */
+ (id)modelOfClass:(Class)modelClass fromDictionary:(NSDictionary *)dictionary;
/**
 *  将字典集合转换实体集合
 *
 *  @param modelClass 实体类型
 *  @param array      字典集合
 *
 *  @return 实体集合
 */
+ (NSArray *)modelsOfClass:(Class)modelClass fromArray:(NSArray *)array;
/**
 *  将实体转换为JSON
 *
 *  @param modelClass 将实体转换为JSON
 *  @param model      实体
 *
 *  @return JSON
 */
+ (NSString *)JSONOfModelClass:(Class)modelClass fromModel:(ZKModel<ZKModelSerializing> *)model;
/**
 *  将实体集合转换为JSON
 *
 *  @param models 实体集合
 *
 *  @return JSON
 */
+ (NSString *)JSONOfModelArray:(NSArray *)models;
@end
