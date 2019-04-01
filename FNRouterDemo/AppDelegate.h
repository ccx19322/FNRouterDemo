//
//  AppDelegate.h
//  FNRouterDemo
//
//  Created by iOSgo on 2019/4/1.
//  Copyright © 2019 iOSgo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

