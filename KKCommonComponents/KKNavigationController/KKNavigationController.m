//
//  KKNavigationController.m
//  KKNavigationController
//
//  Created by CaiMing on 2019/4/11.
//  Copyright © 2019 CaiMing. All rights reserved.
//

#import "KKNavigationController.h"

@interface KKNavigationController ()<UINavigationControllerDelegate>

@property(nonatomic,assign)NSTimeInterval lastPushTimeInterval;
@property(nonatomic,strong)NSArray<UIViewController*> *kkViewControllers;

@end

@implementation KKNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.interactivePopGestureRecognizer.delegate = nil;
    }
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSTimeInterval timeInterval = [[NSDate date]timeIntervalSince1970];
    if (timeInterval-_lastPushTimeInterval<0.3)
    {
        NSLog(@"pushViewController间隔时间太短");
        return;
    }
    _lastPushTimeInterval = timeInterval;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    [super pushViewController:viewController animated:animated];
    
}
- (UIViewController *)popViewControllerAnimated:(BOOL)animated{
    
    return [super popViewControllerAnimated:animated];
}

- (NSArray<UIViewController *> *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated{
    NSArray *viewControllers = [super popToViewController:viewController animated:animated];
    return viewControllers;
}

- (NSArray<UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated{
    return [super popToRootViewControllerAnimated:animated];
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    if ([navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        
        if (viewController == navigationController.viewControllers[0])
        {
            navigationController.interactivePopGestureRecognizer.enabled = NO;
        }else {
            navigationController.interactivePopGestureRecognizer.enabled = !viewController.banPopSlide;
        }
    }
    if (self.kkViewControllers.count>navigationController.viewControllers.count) {
        for (NSInteger i = self.viewControllers.count; i<self.kkViewControllers.count; i++) {
            [self.kkViewControllers[i] viewDidRemove];
        }
    }
    self.kkViewControllers = navigationController.viewControllers.copy;
}

- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC
{
    
    if (operation == UINavigationControllerOperationPush )
    {
        return toVC.pushTransition;
        
    }else if (operation == UINavigationControllerOperationPop)
    {
        return toVC.popTransition;
    }
    
    return nil;
}


@end
