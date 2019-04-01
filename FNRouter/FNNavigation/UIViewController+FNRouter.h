//
//  UIViewController+FNURLRouter.h
//  FNURLRouterDemo
//
//  Created by chen cx on 2016/8/17.
//  Copyright © 2018年 iOSgo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface UIViewController (FNRouter)

/** 跳转后控制器能拿到的url */
@property(nonatomic, strong) NSURL *originUrl;

/** url路径 */
@property(nonatomic,copy) NSString *path;

/** 跳转后控制器能拿到的参数 */
@property(nonatomic,strong) NSDictionary *params;

/** 回调block */
@property (nonatomic, strong) void(^valueBlock)(id value);

// 根据参数创建控制器
+ (UIViewController *)initFromString:(NSString *)urlString fromConfig:(NSDictionary *)configDict;
// 根据参数创建控制器
+ (UIViewController *)initFromString:(NSString *)urlString withQuery:(NSDictionary *)query fromConfig:(NSDictionary *)configDict;


NS_ASSUME_NONNULL_END

@end
