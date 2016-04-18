//
//  NSMutableArray+WFExtension.m
//  WFToolsExtensionExample
//
//  Created by Jason on 16/4/18.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "NSMutableArray+WFExtension.h"
#import "NSObject+WFExtension.h"

@implementation NSMutableArray (WFExtension)
+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        id obj = [[self alloc] init];
        [obj swizzleMethod:@selector(addObject:) withMethod:@selector(safeAddObject:)];
        [obj swizzleMethod:@selector(objectAtIndex:) withMethod:@selector(safeObjectAtIndex:)];
        [obj swizzleMethod:@selector(insertObject:atIndex:) withMethod:@selector(safeInsertObject:atIndex:)];
        [obj swizzleMethod:@selector(removeObjectAtIndex:) withMethod:@selector(safeRemoveObjectAtIndex:)];
        [obj swizzleMethod:@selector(replaceObjectAtIndex:withObject:) withMethod:@selector(safeReplaceObjectAtIndex:withObject:)];
    });
}

- (void)safeAddObject:(id)anObject
{
    if (anObject) {
        [self safeAddObject:anObject];
    }else{
        NSLog(@"数组添加的对象为nil！");
    }
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

- (void)safeInsertObject:(id)anObject atIndex:(NSUInteger)index
{
    if (anObject && index <= [self count]) {
        [self safeInsertObject:anObject atIndex:index];
    }else{
        NSLog(@"数组插入对象为nil或者数组越界！");
    }
}

- (void)safeRemoveObjectAtIndex:(NSUInteger)index
{
    if (index < [self count]) {
        [self safeRemoveObjectAtIndex:index];
    }else{
        NSLog(@"数组移除越界!");
    }
}

- (void)safeReplaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    if (anObject && index <= [self count]) {
        [self safeReplaceObjectAtIndex:index withObject:anObject];
    }else{
        NSLog(@"数组替换越界!");
    }
}
@end
