//
//  FNRouter.m
//  FNRouterDemo
//
//  Created by chen cx on 2016/8/17.
//  Copyright © 2018年 iOSgo. All rights reserved.
//

#import "FNRouter.h"
#import "FNNavgation.h"

#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif

@interface FNRouter()

@end

@implementation FNRouter
FNSingletonM(FNRouter)

+ (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {

    [FNNavgation pushViewController:viewController animated:animated replace:NO];
}

+ (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated replace:(BOOL)replace {
    [FNNavgation pushViewController:viewController animated:animated replace:replace];
}

+ (void)pushURLString:(NSString *)urlString animated:(BOOL)animated {

    UIViewController *viewController = [UIViewController initFromString:urlString fromConfig:[FNRouter sharedFNRouter].configDict];
    [FNNavgation pushViewController:viewController animated:animated replace:NO];
}

+ (void)pushURLString:(NSString *)urlString query:(NSDictionary *)query animated:(BOOL)animated{
    UIViewController *viewController = [UIViewController initFromString:urlString withQuery:query fromConfig:[FNRouter sharedFNRouter].configDict];
    [FNNavgation pushViewController:viewController animated:animated replace:NO];
}

+ (void)pushURLString:(NSString *)urlString animated:(BOOL)animated replace:(BOOL)replace{
    UIViewController *viewController = [UIViewController initFromString:urlString fromConfig:[FNRouter sharedFNRouter].configDict];
    [FNNavgation pushViewController:viewController animated:YES replace:replace];
}


+ (void)presentViewController:(UIViewController *)viewControllerToPresent animated: (BOOL)flag completion:(void (^ __nullable)(void))completion {
    [FNNavgation presentViewController:viewControllerToPresent animated:flag completion:completion];
}

+ (void)presentViewController:(UIViewController *)viewControllerToPresent animated: (BOOL)flag withNavigationClass:(Class)classType completion:(void (^ __nullable)(void))completion {

    if ([classType isSubclassOfClass:[UINavigationController class]]) {
        UINavigationController *nav =  [[classType alloc]initWithRootViewController:viewControllerToPresent];
        [FNNavgation presentViewController:nav animated:flag completion:completion];
    }
}


+ (void)presentURLString:(NSString *)urlString animated:(BOOL)animated completion:(void (^ __nullable)(void))completion{
    UIViewController *viewController = [UIViewController initFromString:urlString fromConfig:[FNRouter sharedFNRouter].configDict];
    [FNNavgation presentViewController:viewController animated:animated completion:completion];
}


+ (void)presentURLString:(NSString *)urlString query:(NSDictionary *)query animated:(BOOL)animated completion:(void (^ __nullable)(void))completion{
    UIViewController *viewController = [UIViewController initFromString:urlString withQuery:query fromConfig:[FNRouter sharedFNRouter].configDict];
    [FNNavgation presentViewController:viewController animated:animated completion:completion];
}


+ (void)pushURLString:(NSString *)urlString query:(NSDictionary *)query animated:(BOOL)animated replace:(BOOL)replace{
    UIViewController *viewController = [UIViewController initFromString:urlString withQuery:query fromConfig:[FNRouter sharedFNRouter].configDict];
    [FNNavgation pushViewController:viewController animated:animated replace:replace];
}


+ (void)presentURLString:(NSString *)urlString animated:(BOOL)animated withNavigationClass:(Class)classType completion:(void (^ __nullable)(void))completion{
    
    UIViewController *viewController = [UIViewController initFromString:urlString fromConfig:[FNRouter sharedFNRouter].configDict];
    if ([classType isSubclassOfClass:[UINavigationController class]]) {
        UINavigationController *nav =  [[classType alloc]initWithRootViewController:viewController];
        [FNNavgation presentViewController:nav animated:animated completion:completion];
    }
}

+ (void)presentURLString:(NSString *)urlString query:(NSDictionary *)query animated:(BOOL)animated withNavigationClass:(Class)clazz completion:(void (^ __nullable)(void))completion{
    UIViewController *viewController = [UIViewController initFromString:urlString withQuery:query fromConfig:[FNRouter sharedFNRouter].configDict];
    if ([clazz isSubclassOfClass:[UINavigationController class]]) {
        UINavigationController *nav =  [[clazz alloc]initWithRootViewController:viewController];
        [FNNavgation presentViewController:nav animated:animated completion:completion];
    }
}

+ (void)popViewControllerAnimated:(BOOL)animated {
    [FNNavgation popViewControllerWithTimes:1 animated:animated];
}

+ (void)popTwiceViewControllerAnimated:(BOOL)animated {
    [FNNavgation popTwiceViewControllerAnimated:animated];
}
+ (void)popViewControllerWithTimes:(NSUInteger)times animated:(BOOL)animated {
    [FNNavgation popViewControllerWithTimes:times animated:animated];
}
+ (void)popToRootViewControllerAnimated:(BOOL)animated {
    [FNNavgation popToRootViewControllerAnimated:animated];
}


+ (void)dismissViewControllerAnimated: (BOOL)flag completion: (void (^ __nullable)(void))completion {
    [FNNavgation dismissViewControllerWithTimes:1 animated:flag completion:completion];
}
+ (void)dismissTwiceViewControllerAnimated: (BOOL)flag completion: (void (^ __nullable)(void))completion {
    [FNNavgation dismissTwiceViewControllerAnimated:flag completion:completion];
}

+ (void)dismissViewControllerWithTimes:(NSUInteger)times animated: (BOOL)flag completion: (void (^ __nullable)(void))completion {
    [FNNavgation dismissViewControllerWithTimes:times animated:flag completion:completion];
}

+ (void)dismissToRootViewControllerAnimated: (BOOL)flag completion: (void (^ __nullable)(void))completion {
    [FNNavgation dismissToRootViewControllerAnimated:flag completion:completion];
}

- (UIViewController*)currentViewController {
    return [FNNavgation sharedFNNavgation].currentViewController;
}

- (UINavigationController*)currentNavigationViewController {
    return [FNNavgation sharedFNNavgation].currentNavigationViewController;
}

// - - getter
//加载plist文件中的URL配置信息
- (NSDictionary *)configDict {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"FNRouter" ofType:@"plist"];
    NSDictionary *configDict = [NSDictionary dictionaryWithContentsOfFile:path];
    
    return configDict;
}

@end
