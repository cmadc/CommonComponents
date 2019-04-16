//
//  KKNavigationController.m
//  KKNavigationController
//
//  Created by CaiMing on 2019/4/11.
//  Copyright © 2019 CaiMing. All rights reserved.
//

#import "KKNavigationController.h"

@interface KKNavigationController ()<UINavigationControllerDelegate, UIGestureRecognizerDelegate>

//@property(nonatomic,assign)NSTimeInterval lastPushTimeInterval;
@property(nonatomic,strong)NSArray<UIViewController*> *kkViewControllers;
@property (nonatomic, strong) UIPanGestureRecognizer *popPanGesture;
@property (nonatomic, strong) id popGestureDelegate;

@end

@implementation KKNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
    self.popGestureDelegate = self.interactivePopGestureRecognizer.delegate;
    SEL action = NSSelectorFromString(@"handleNavigationTransition:");
    self.popPanGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self.popGestureDelegate action:action];
    self.popPanGesture.maximumNumberOfTouches = 1;
    self.interactivePopGestureRecognizer.delegate = self;
    self.interactivePopGestureRecognizer.enabled = YES;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if ( gestureRecognizer == self.interactivePopGestureRecognizer )
    {
        UIViewController *vc = self.viewControllers.lastObject;
        //  禁用某些不支持侧滑返回的页面
        if (self.viewControllers.lastObject.banPopSlide) {
            return NO;
        }
        //  禁用根目录的侧滑手势
        if ( self.viewControllers.count < 2 || self.visibleViewController == [self.viewControllers objectAtIndex:0] )
        {
            return NO;
        }
    }
    return YES;
}


//修复有水平方向滚动的ScrollView时边缘返回手势失效的问题
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return [gestureRecognizer isKindOfClass:UIScreenEdgePanGestureRecognizer.class];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
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
