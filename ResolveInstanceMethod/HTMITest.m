//
//  Cat.m
//  RuntimeSummary
//
//  Created by 朔 洪 on 16/4/21.
//  Copyright © 2016年 Tuccuay. All rights reserved.
//

#import "HTMITest.h"

#import <objc/message.h>

@implementation HTMITest

void test(id self, SEL _cmd,  NSNumber *test) {
    NSLog(@"测试%@",test);
}

// 当调用了一个未实现的方法会来到这里
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == NSSelectorFromString(@"test:")) {
        // 动态添加方法
        class_addMethod(self, @selector(test:), test, "v@:@");
        
        return YES;
    }
    
    return [super resolveInstanceMethod:sel];
}

@end
