// RuntimeSummary - 一个集合了常用 Objective-C Runtime 用法的 Playground
// https://github.com/Tuccuay/RuntimeSummary

// Messaging / 消息机制介绍

#import "ViewController.h"

#import "HTMITest.h"

#import <objc/message.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    // 使用 Runtime 创建一个对象
    // 根据类名获取到类
    Class testClass = objc_getClass("HTMITest");
    
    // 通过类创建实例对象
    // 如果这里报错，请将 Build Setting -> Enable Strict Checking of objc_msgSend Calls 改为 NO
    HTMITest *test = objc_msgSend(testClass, @selector(alloc));

    test = objc_msgSend(test, @selector(init));
    objc_msgSend(test, @selector(test));
    
    HTMITest *otherTest = objc_msgSend(objc_msgSend(objc_getClass("HTMITest"), sel_registerName("alloc")), sel_registerName("init"));
    objc_msgSend(otherTest, @selector(testInteger:), 10);
}

@end
