//
//  FNSingleton.h
//  FNURLRouterDemo
//
//  Created by chen cx on 2016/8/17.
//  Copyright © 2018年 iOSgo. All rights reserved.
//  单例宏

// .h文件
#define FNSingletonH(name) + (instancetype)shared##name;
// .m文件
#define FNSingletonM(name) \
static id _instance; \
\
+ (instancetype)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
} \
\
+ (instancetype)shared##name \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[self alloc] init]; \
}); \
return _instance; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return _instance; \
}
