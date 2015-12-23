//
//  ZKModel.h
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

@protocol ZKModelSerializing
@required
/**
 *  实体对应的数据表名称
 *
 *  @return 数据表名称
 */
+ (NSString *)ZKDBTableName;
/**
 *  实体对应数据表中的主键字段、唯一字段等（用于 update、delete 中的 where 条件语句）
 *
 *  @return <#return value description#>
 */
+ (NSDictionary *)ZKDBPrimaryKeys;
/**
 *  实体对应数据表中的所有字段
 *
 *  @return <#return value description#>
 */
+ (NSDictionary *)ZKPropertyKeys;
@end

@interface ZKModel : NSObject<NSCopying>

+ (NSString *)tableNameForModelClass:(Class)modelClass;
/**
 *  key   : 实体属性
 *  value : 数据库 或 Json 字段
 */
+ (NSDictionary *)propertyKeysForModelClass:(Class)modelClass;
/**
 *  key   : 实体属性
 *  value : 数据库 或 Json 字段
 */
+ (NSDictionary *)DBPrimaryKeysForModelClass:(Class)modelClass;

- (NSString *)toJSON;
- (NSDictionary *)dictionry;
@end
