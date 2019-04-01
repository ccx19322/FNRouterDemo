//
//  FNApplication.m
//  ForNoBuy
//
//  Created by chen cx on 2016/8/17.
//  Copyright © 2018年 iOSgo. All rights reserved.
//

#import "FNApplication.h"
#import "FNRouter.h"
#import "FNWebViewController.h"

@implementation FNApplication

+ (void)openURL:(NSString *)urlString {
    UIViewController *viewController = [UIViewController initFromString:urlString fromConfig:[FNRouter sharedFNRouter].configDict];
    // 在plist 中有配置控制器
    if (viewController) {
        if ([[FNRouter sharedFNRouter] currentNavigationViewController]) {
            [FNRouter pushURLString:urlString animated:YES];
        } else {
            [FNRouter presentURLString:urlString animated:YES completion:nil];
        }
    }
    else {
        NSURL *url = [NSURL URLWithString:urlString];
        if (!url.host) {
            // 跳转外部App
            [[UIApplication sharedApplication] openURL:url];
        }
    }
    
}

@end
