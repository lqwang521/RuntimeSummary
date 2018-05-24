//
//  NSObject+Archive.m
//  RuntimeSummary
//
//  Created by 朔 洪 on 16/4/24.
//  Copyright © 2016年 Tuccuay. All rights reserved.
//

#import "NSObject+Archive.h"

#import <objc/runtime.h>

@implementation NSObject (Archive)

- (NSArray *)ignoredProperty {
    return @[];
}

- (void)htmi_initWithCoder:(NSCoder *)aDecoder {
    Class selfClass = self.class;
    while (selfClass &&selfClass != [NSObject class]) {
        
        unsigned int outCount = 0;
        Ivar *ivars = class_copyIvarList(selfClass, &outCount);
        for (int i = 0; i < outCount; i++) {
            Ivar ivar = ivars[i];
            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
            
            if ([self respondsToSelector:@selector(ignoredProperty)]) {
                if ([[self ignoredProperty] containsObject:key]) continue;
            }
            
            id value = [aDecoder decodeObjectForKey:key];
            [self setValue:value forKey:key];
        }
        free(ivars);
        selfClass = [selfClass superclass];
    }
    
}

- (void)htmi_encodeWithCoder:(NSCoder *)aCoder {
    Class selfClass = self.class;
    while (selfClass &&selfClass != [NSObject class]) {
        
        unsigned int outCount = 0;
        Ivar *ivars = class_copyIvarList([self class], &outCount);
        for (int i = 0; i < outCount; i++) {
            Ivar ivar = ivars[i];
            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
            
            if ([self respondsToSelector:@selector(ignoredProperty)]) {
                if ([[self ignoredProperty] containsObject:key]) continue;
            }
            
            id value = [self valueForKeyPath:key];
            [aCoder encodeObject:value forKey:key];
        }
        free(ivars);
        selfClass = [selfClass superclass];
    }
}

@end
