//
//  Cat.h
//  RuntimeSummary
//
//  Created by 朔 洪 on 16/4/24.
//  Copyright © 2016年 Tuccuay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTMITest : NSObject

@property (nonatomic, copy) NSString *name;

- (NSArray *)ignoredNames;

- (instancetype)initWithCoder:(NSCoder *)aDecoder;
- (void)encodeWithCoder:(NSCoder *)aCoder;

@end
