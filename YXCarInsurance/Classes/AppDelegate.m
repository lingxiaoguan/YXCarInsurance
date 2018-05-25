//
//  AppDelegate.m
//  YXCarInsurance
//
//  Created by Lingxg on 2018/5/23.
//  Copyright © 2018年 Lingxg. All rights reserved.
//

#import "AppDelegate.h"
#import "YXTabBarViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];

    self.window.rootViewController =[[YXTabBarViewController alloc]init];
    [self configAppearance];
    
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
}


- (void)applicationWillTerminate:(UIApplication *)application {
}

- (void)configAppearance {
}


@end
