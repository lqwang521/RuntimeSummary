// RuntimeSummary - 一个集合了常用 Objective-C Runtime 用法的 Playground
// https://github.com/Tuccuay/RuntimeSummary

// ResolveInstanceMethod / 动态加载方法

#import "ViewController.h"

#import "HTMITest.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HTMITest *test = [[HTMITest alloc] init];
    
    // 这个时候 billy 对象并没有 run: 方法
    // 所以会进入 + (BOOL)resolveClassMethod:(SEL)sel 处理
    // 然后方法被动态添加
    [test performSelector:@selector(test:) withObject:@10];
}

@end
