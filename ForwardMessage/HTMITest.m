//
//  Cat.m
//  RuntimeSummary
//
//  Created by 朔 洪 on 16/4/23.
//  Copyright © 2016年 Tuccuay. All rights reserved.
//

#import "HTMITest.h"

#import "HTMIOtherTest.h"
#import <objc/message.h>

@implementation HTMITest

#pragma mark - 实例方法

void test(id self,SEL _cmd) {
    NSLog(@"测试");
}

//
//  1、在没有找到方法时，会先调用此方法，可用于动态添加方法
//  返回 YES 表示相应 selector 的实现已经被找到并添加到了类中，否则返回 NO
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    //    if (sel == NSSelectorFromString(@"test")) {
    //        // 动态添加方法
    //        class_addMethod(self, @selector(test), test, "v@:");//添加的方法会立即执行
    //
    //        return NO;//一旦添加方法了，返回什么都没有影响
    //    }
    //
    //    return [super resolveInstanceMethod:sel];
    return NO;
}

//  2、如果第一步的返回 NO 或者直接返回了 YES 而没有添加方法，该方法被调用
//  在这个方法中，我们可以指定一个可以返回一个可以响应该方法的对象
//  如果返回 self 就会死循环
- (id)forwardingTargetForSelector:(SEL)aSelector {
    
    //    HTMIOtherTest *other =  [[HTMIOtherTest alloc] init];
    //    return other;
    return nil;
}


//  3、如果 `forwardingTargetForSelector:` 返回了 nil，则该方法会被调用，系统会询问我们要一个合法的方法签名
//  若返回 nil，则不会进入下一步，而是无法处理消息
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    return [NSMethodSignature signatureWithObjCTypes:"v@:"];
}

// 当实现了此方法后，-doesNotRecognizeSelector: 将不会被调用
// 在这里进行完整的消息转发
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    // 我们还可以改变方法选择器
    [anInvocation setSelector:@selector(myTest)];
    // 改变方法选择器后，还需要指定是哪个对象的方法
    [anInvocation invokeWithTarget:self];
}

//如果不实现forwardInvocation:方法，则会进入此方法，程序不会崩溃
- (void)doesNotRecognizeSelector:(SEL)aSelector {
    NSLog(@"无法处理消息：%@", NSStringFromSelector(aSelector));
}

- (void)myTest {
    NSLog(@"HTMITest 没有实现 -test 方法，并且成功的转成了 -myTest 方法");
}

#pragma mark - 类方法

+ (BOOL)resolveClassMethod:(SEL)sel {
    return NO;
}

+ (id)forwardingTargetForSelector:(SEL)aSelector {
    return nil;
}

+ (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    return [NSMethodSignature signatureWithObjCTypes:"v@:"];
}

+ (void)forwardInvocation:(NSInvocation *)anInvocation {
    [anInvocation setSelector:@selector(myTest)];
    [anInvocation invokeWithTarget:self];
}

+ (void)doesNotRecognizeSelector:(SEL)aSelector {
    NSLog(@"无法处理消息：%@", NSStringFromSelector(aSelector));
}

+ (void)myTest {
    NSLog(@"HTMITest 没有实现 +test 方法，并且成功的转成了 +myTest 方法");
}

@end
