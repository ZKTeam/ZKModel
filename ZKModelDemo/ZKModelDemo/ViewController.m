//
//  ViewController.m
//  ZKModelDemo
//
//  Created by 王文壮 on 15/12/23.
//  Copyright © 2015年 ZKTeam. All rights reserved.
//

#import "ViewController.h"
#import "UserModel.h"
#import "ZKModelAdapter.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
