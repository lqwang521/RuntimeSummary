// RuntimeSummary - 一个集合了常用 Objective-C Runtime 用法的 Playground
// https://github.com/Tuccuay/RuntimeSummary

// ForwardMessage / 消息转发

#import "ViewController.h"
#import "HTMITest.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)instanceMethodCalling {
    [[HTMITest new] test];
}

- (IBAction)classMethodCalling {
    [HTMITest test];
}

@end
