//
//  NSObject+Archive.h
//  RuntimeSummary
//
//  Created by 朔 洪 on 16/4/24.
//  Copyright © 2016年 Tuccuay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Archive)

- (NSArray *)ignoredProperty;

- (void)htmi_encodeWithCoder:(NSCoder *)aCoder;
- (void)htmi_initWithCoder:(NSCoder *)aDecoder;

@end
