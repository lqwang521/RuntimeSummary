//
//  UIImage+Success.m
//  RuntimeSummary
//
//  Created by 朔 洪 on 16/4/21.
//  Copyright © 2016年 Tuccuay. All rights reserved.
//

#import "UIImage+Success.h"

#import <objc/message.h>

@implementation UIImage (Success)

+ (void)load {
    // 获取到两个方法
    Method imageNamedMethod = class_getClassMethod(self, @selector(imageNamed:));
    Method tuc_imageNamedMethod = class_getClassMethod(self, @selector(htmi_imageNamed:));
    
    // 交换方法
    method_exchangeImplementations(imageNamedMethod, htmi_imageNamedMethod);
}

+ (UIImage *)htmi_imageNamed:(NSString *)name {
    // 因为来到这里的时候方法实际上已经被交换过了
    // 这里要调用 imageNamed: 就需要调换被交换过的 htmi_imageNamed
    UIImage *image = [UIImage tuc_imageNamed:name];
    
    return image;
}

@end
