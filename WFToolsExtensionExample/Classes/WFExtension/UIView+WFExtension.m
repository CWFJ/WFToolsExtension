//
//  UIView+WFExtension.m
//  UIView
//
//  Created by 开发者 on 13/6/22.
//  Copyright (c) 2013年 Jason. All rights reserved.
//

#import "UIView+WFExtension.h"

@implementation UIView (WFExtension)

#pragma mark ------< frame相关 >
- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}

#pragma mark ------< center相关 >
- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (UIViewController*)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}
//dfs
#pragma mark ------<查找特定类型的subview - 广度优先遍历>
/**
 *  查找特定类型的subview
 *
 *  @param className 查找的类名
 *
 *  @return 查找结果
 *  @note   广度优先遍历
 */
- (UIView *)findSubviewWithClassNameBFS:(NSString *)className {
    
    if(self.subviews.count == 0) return nil;
    
    __block UIView *resultView = nil;
    /** 查找自身Subview*/
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if([[obj class] isSubclassOfClass:NSClassFromString(className)]) {
            resultView = obj;
            *stop = YES;
        }
    }];
    
    if(!resultView) {
        /** 在自身subview中没有找到，就再下一级的subview中去寻找 */
        [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            resultView = [obj findSubviewWithClassNameBFS:className];
            if(resultView) {
                *stop = YES;
            }
        }];
    }
    
    return resultView;
}

#pragma mark ------<查找特定类型的subview - 深度度优先遍历>
/**
 *  查找特定类型的subview
 *
 *  @param className 查找的类名
 *
 *  @return 查找结果
 *  @note   深度度优先遍历
 */
- (UIView *)findSubviewWithClassNameDFS:(NSString *)className {
    
    if(self.subviews.count == 0) return nil;
    
    __block UIView *resultView = nil;
    /** 查找自身Subview*/
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if([[obj class] isSubclassOfClass:NSClassFromString(className)]) {
            resultView = obj;
            *stop = YES;
        }
        else {
            resultView = [obj findSubviewWithClassNameDFS:className];
            if(resultView) {
                *stop = YES;
            }
        }
    }];
    return resultView;
}

#pragma mark ------<查找特定类型的Subviews>
/**
 *  查找特定类型的Subviews
 *
 *  @param className 查找的类名
 *
 *  @return 查找结果
 *  @note   深度度优先遍历,由于是完全遍历，就不在实现其他遍历方法了
 */
- (NSArray *)findSubviewsWithClassNameDFS:(NSString *)className {
    
    if(self.subviews.count == 0) return [NSMutableArray array];
    
    __block NSMutableArray *resultViews = [NSMutableArray array];
    
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if([[obj class] isSubclassOfClass:NSClassFromString(className)]) {
            [resultViews addObject:obj];
        }
        [resultViews addObjectsFromArray:[obj findSubviewsWithClassNameDFS:className]];
    }];
    
    return [resultViews copy];
}
@end
