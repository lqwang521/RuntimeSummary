//
//  NSObject+Property.m
//  RuntimeSummary
//
//  Created by 朔 洪 on 16/4/21.
//  Copyright © 2016年 Tuccuay. All rights reserved.
//

#import "NSObject+Property.h"

#import <objc/message.h>

@implementation NSObject (Property)

- (void)setName:(NSString *)name {
    // 属性关联给对象
    objc_setAssociatedObject(self, "name", name, OBJC_ASSOCIATION_COPY);
}

- (NSString *)name {
    // 得到属性
    return objc_getAssociatedObject(self, "name");
}

@end
