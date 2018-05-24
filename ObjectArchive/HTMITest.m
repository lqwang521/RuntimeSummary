//
//  Cat.m
//  RuntimeSummary
//
//  Created by 朔 洪 on 16/4/24.
//  Copyright © 2016年 Tuccuay. All rights reserved.
//

#import "HTMITest.h"

#import "NSObject+Archive.h"

@implementation HTMITest

- (NSArray *)ignoredNames {
    return @[];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        [self htmi_initWithCoder:aDecoder];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [self htmi_encodeWithCoder:aCoder];
}

@end
