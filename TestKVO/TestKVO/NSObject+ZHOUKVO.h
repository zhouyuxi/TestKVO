//
//  NSObject+ZHOUKVO.h
//  TestKVO
//
//  Created by zhouyuxi on 2017/11/28.
//  Copyright © 2017年 zhouyuxi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ZHOUKVO)
- (void)ZHOU_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context;

@end
