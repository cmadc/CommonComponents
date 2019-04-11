//
//  UIViewController+KKNavigation.h
//  KKNavigationController
//
//  Created by CaiMing on 2019/4/11.
//  Copyright © 2019 CaiMing. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (KKNavigation)

/**
 设置当前页面是否禁止侧滑

 @param popSlide popSlide 默认不禁止
 */
- (void)setBanPopSlide:(BOOL)popSlide;

/**
 获取当前页面是否禁止侧滑

 @return YES 禁止 NO 不禁止
 */
- (BOOL)banPopSlide;

/**
    页面移除时调用
 */
- (void)viewDidRemove;

/**
 获取push动画

 @return 动画
 */
- (id<UIViewControllerAnimatedTransitioning>)pushTransition;

/**
 设置push动画
 
 */
- (void)setPushTransition:(id<UIViewControllerAnimatedTransitioning>)transition;

/**
 获取pop动画
 
 @return 动画
 */
- (id<UIViewControllerAnimatedTransitioning>)popTransition;

/**
 设置pop动画
 */
- (void)setPopTransition:(id<UIViewControllerAnimatedTransitioning>)transition;


@end

NS_ASSUME_NONNULL_END
