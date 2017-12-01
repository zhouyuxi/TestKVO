//
//  NSObject+ZHOUKVO.m
//  TestKVO
//
//  Created by zhouyuxi on 2017/11/28.
//  Copyright © 2017年 zhouyuxi. All rights reserved.
//

#import "NSObject+ZHOUKVO.h"
#import <objc/message.h>

@implementation NSObject (ZHOUKVO)
- (void)ZHOU_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context
{
    // 1 动态创建一个子类
    // 2 修改self的类型
    // 3 动态添加setName方法
    
    
    
    // 1 创建子类
    NSString *oldClassName = NSStringFromClass([self class]);
    NSString *newClassName = [@"ZHOU_" stringByAppendingString:oldClassName];
    Class newClass = objc_allocateClassPair([self class], newClassName.UTF8String, 0);
    // 注册类
    objc_registerClassPair(newClass);
    
    
    
    // 2 修改self的类型 把self 修改成newClass 类
    object_setClass(self, newClass);
    

    // 3 给newClass添加setName方法 -- 重写 添加和父类同名的set方法
    class_addMethod(newClass, @selector(setName:), (IMP)setname, "v@:@");
    
    // 4 绑定对象
    objc_setAssociatedObject(self, (__bridge const void *)@"zhou", observer, OBJC_ASSOCIATION_ASSIGN);

}



void setname(id self ,SEL _cmd ,NSString *newName){
    
    NSLog(@"获得了新的名称--%@",newName);
    
    
    id class = [self class];
    object_setClass(self, class_getSuperclass([self class]));
    objc_msgSend(self, @selector(setName:),newName);
    
    id observer = objc_getAssociatedObject(self,(__bridge const void *)@"zhou");
    
    objc_msgSend(observer, @selector(observeValueForKeyPath:ofObject:change:context:),@"name",self,@{@"name": newName},nil);
    
    object_setClass(self, class);
}

@end
