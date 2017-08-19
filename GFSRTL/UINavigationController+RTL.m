//
//  UINavigationController+RTL.m
//  MasonryRTLTest
//
//  Created by 管复生 on 2017/8/19.
//  Copyright © 2017年 DevGuan. All rights reserved.
//

#import "UINavigationController+RTL.h"
#import <objc/runtime.h>
#import "RTLManager.h"
@interface UINavigationController ()<UIGestureRecognizerDelegate,UINavigationBarDelegate,UINavigationControllerDelegate>

@end
/**
 Nav 推栈动画
 */
@interface RTLPushAnimation : NSObject <UIViewControllerAnimatedTransitioning>

@end

/**
 Nav 出栈动画
 */
@interface RTLPopAnimation : NSObject <UIViewControllerAnimatedTransitioning>

@end

@implementation UINavigationController (RTL)
+ (void)load
{
    method_exchangeImplementations(class_getInstanceMethod(self, @selector(viewWillAppear:)), class_getInstanceMethod(self, @selector(RTL_ViewWillAppear:)));
}
- (void)RTL_ViewWillAppear:(BOOL)animate
{
    self.view.backgroundColor = [UIColor whiteColor];
//    // Do any additional setup after loading the view.
    self.interactivePopGestureRecognizer.delegate = self;
    self.delegate = self;
    self.interactivePopGestureRecognizer.enabled = ![[RTLManager appearance]RTL];
    [self RTL_ViewWillAppear:animate];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return self.childViewControllers.count > 1;
    
}
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if (operation  == UINavigationControllerOperationPush) {
        return [RTLPushAnimation new];
    }else{
        return [RTLPopAnimation new];
    }
}
@end
@implementation RTLPushAnimation


- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *container = transitionContext.containerView;
    UIView *tmpV = [fromVC.view snapshotViewAfterScreenUpdates:YES];
    [container addSubview:toVC.view];
    toVC.view.transform = CGAffineTransformMakeTranslation(-toVC.view.bounds.size.width, 0);
    [container addSubview:tmpV];
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        tmpV.transform = CGAffineTransformMakeTranslation(toVC.view.bounds.size.width, 0);
        toVC.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [tmpV removeFromSuperview];
        [transitionContext completeTransition:YES];
    }];
    
    
}
@end

@implementation RTLPopAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *container = transitionContext.containerView;
    
    UIView *tmpV = [fromVC.view snapshotViewAfterScreenUpdates:YES];
    [container addSubview:toVC.view];
    toVC.view.transform = CGAffineTransformMakeTranslation(toVC.view.bounds.size.width, 0);
    [container addSubview:tmpV];
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        tmpV.transform = CGAffineTransformMakeTranslation(-toVC.view.bounds.size.width, 0);
        toVC.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [tmpV removeFromSuperview];
        [transitionContext completeTransition:YES];
    }];
}
@end
