//
//  Person.h
//  TestKVO
//
//  Created by zhouyuxi on 2017/11/28.
//  Copyright © 2017年 zhouyuxi. All rights reserved.
//  OC的属性 带有下划线的成员变量 setter getter

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic,copy) NSString *name;  // kvo 观察的是set方法





@end
