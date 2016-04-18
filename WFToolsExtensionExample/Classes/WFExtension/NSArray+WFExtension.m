//
//  NSArray+WFExtension.m
//  WFToolsExtensionExample
//
//  Created by Jason on 16/4/18.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "NSArray+WFExtension.h"
#import "NSObject+WFExtension.h"

@implementation NSArray (WFExtension)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        id obj2 = NSClassFromString(@"__NSArrayI");
        [obj2 swizzleMethod:@selector(objectAtIndex:) withMethod:@selector(safeObjectAtIndex:)];
    });
}

- (id)safeObjectAtIndex:(NSInteger)index
{
    if(index<[self count]){
        return [self safeObjectAtIndex:index];
    }else{
        NSLog(@"数组读取越界!");
    }
    return nil;
}

@end
