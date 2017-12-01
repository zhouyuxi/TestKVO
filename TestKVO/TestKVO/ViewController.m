//
//  ViewController.m
//  TestKVO
//
//  Created by zhouyuxi on 2017/11/28.
//  Copyright © 2017年 zhouyuxi. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/runtime.h>
#import <objc/message.h> // 消息发送机制头文件
#import "NSObject+ZHOUKVO.h"

@interface ViewController ()
@property (nonatomic,strong) Person *p;

@end


@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    _p = [[Person alloc] init];
    
    NSLog(@"%@",_p);
    
//  [_p addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    [_p ZHOU_addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    
    NSLog(@"哈哈哈哈pr");
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    
    NSLog(@"观察到的名称----%@",_p.name);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    _p.name = @"哈哈哈";
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
