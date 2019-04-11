//
//  UIViewController+KKNavigation.m
//  KKNavigationController
//
//  Created by CaiMing on 2019/4/11.
//  Copyright © 2019 CaiMing. All rights reserved.
//

#import "UIViewController+KKNavigation.h"
#import <objc/runtime.h>


@implementation UIViewController (KKNavigation)

static BOOL _banPopSlide;
static id _pushTransition;
static id _popTransition;

- (void)setBanPopSlide:(BOOL)popSlide {
    NSNumber *t = @(popSlide);
    objc_setAssociatedObject(self, &_banPopSlide, t, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)banPopSlide {
    NSNumber *t = objc_getAssociatedObject(self, &_banPopSlide);
    return [t boolValue];
}

/**
 获取push动画
 
 @return 动画
 */
- (id<UIViewControllerAnimatedTransitioning>)pushTransition{
    
    id<UIViewControllerAnimatedTransitioning> t = objc_getAssociatedObject(self, &_pushTransition);
    return t;
}

/**
 设置push动画
 
 */
- (void)setPushTransition:(id<UIViewControllerAnimatedTransitioning>)transition{
    objc_setAssociatedObject(self, &_pushTransition, transition, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

/**
 获取pop动画
 
 @return 动画
 */
- (id<UIViewControllerAnimatedTransitioning>)popTransition{
    
    return objc_getAssociatedObject(self, &_popTransition);
}

/**
 设置pop动画
 */
- (void)setPopTransition:(id<UIViewControllerAnimatedTransitioning>)transition{
    
    objc_setAssociatedObject(self, &_popTransition, transition, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)viewDidRemove{
    
}

@end
