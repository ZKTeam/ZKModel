# ZKModel

[![Build Status](https://img.shields.io/badge/build-passing-brightgreen.svg)](https://github.com/WangWenzhuang/ZKModel)
[![license](https://img.shields.io/badge/license-MIT-brightgreen.svg)](https://github.com/WangWenzhuang/ZKModel)
[![CocoaPods](https://img.shields.io/badge/pod-1.0-brightgreen.svg)](https://github.com/WangWenzhuang/ZKModel)
[![platform](https://img.shields.io/badge/platform-iOS-brightgreen.svg)](https://github.com/WangWenzhuang/ZKModel)
[![platform](https://img.shields.io/badge/contact-1020304029%40q.com-brightgreen.svg)](https://github.com/WangWenzhuang/ZKModel)

ZKModel 是一个实体模型转换器

## 安装

### 手动安装

拷贝 `ZKModel` 目录到项目里即可。

### CocoaPods

```pod 'ZKModel'```

## 使用

### 实体类:

`UserModel.h`

```objc
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
```

`UserModel.m`

```objc
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
```

###示例

```objc
    NSDictionary *userDic = @{ @"id" : @"1", @"name" : @"王文壮", @"age" : @30 };
    // 将 NSDictionary 转换为 UserModel
    UserModel *user = [ZKModelAdapter modelOfClass:[UserModel class] fromDictionary:userDic];
    
    NSArray *userArray = @[
                           @{ @"id" : @"1", @"name" : @"王文壮", @"age" : @30 },
                           @{ @"id" : @"2", @"name" : @"壮文王", @"age" : @30 }
                           ];
    // 将元素为 NSDictionary 的 NSArray 转换为元素为 UserModel 的 NSArray
    NSArray *users = [ZKModelAdapter modelsOfClass:[UserModel class] fromArray:userArray];
    
    // 将 UserModel 转换为 JSON
    NSString *json = [ZKModelAdapter JSONOfModelClass:[UserModel class] fromModel:user];
    NSLog(@"User JSON:%@", json);
    
    // 将元素为 UserModel 的 NSArray 转换为 JSON
    json = [ZKModelAdapter JSONOfModelArray:users];
    NSLog(@"Users JSON:%@", json);
    
    // 实体输出 JSON
    json = [user toJSON];
    NSLog(@"Users JSON:%@", json);
    
    // 实体输出 NSDictionary
    userDic = [user dictionry];
```

## 运行环境
- iOS 7+
- 支持 armv7/armv7s/arm64
