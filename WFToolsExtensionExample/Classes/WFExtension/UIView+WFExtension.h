//
//  UIView+WFExtension.h
//  UIView
//
//  Created by 开发者 on 13/6/22.
//  Copyright (c) 2013年 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (WFExtension)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGSize  size;
@property (nonatomic, assign) CGPoint origin;
- (UIViewController*)viewController;

#pragma mark ------<查找特定类型的subview>
/**
 *  查找特定类型的subview
 *
 *  @param className 查找的类名
 *
 *  @return 查找结果
 *  @note   广度优先遍历
 */
- (UIView *)findSubviewWithClassNameBFS:(NSString *)className;

#pragma mark ------<查找特定类型的subview - 深度度优先遍历>
/**
 *  查找特定类型的subview
 *
 *  @param className 查找的类名
 *
 *  @return 查找结果
 *  @note   深度度优先遍历
 */
- (UIView *)findSubviewWithClassNameDFS:(NSString *)className;

#pragma mark ------<查找特定类型的Subviews>
/**
 *  查找特定类型的Subviews
 *
 *  @param className 查找的类名
 *
 *  @return 查找结果
 *  @note   深度度优先遍历
 */
- (NSArray *)findSubviewsWithClassNameDFS:(NSString *)className;

@end
