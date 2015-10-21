//
//  AppDelegate.m
//  AISinaWeiBo
//
//  Created by qianfeng on 15/10/19.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AppDelegate.h"
#import "AIMainViewController.h"
@interface AppDelegate ()

@end
/*
 //主页
 //粉丝列表
 我的微博
 关注列表
 */


@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    //新增代码
    AIMainViewController *mainVC = [[AIMainViewController alloc]init];
    self.window.rootViewController = mainVC;
    
    //设置状态栏字体透明度，两个步骤缺一不可
//    1.代码
    [application setStatusBarStyle:(UIStatusBarStyleLightContent)];
    //2info.plist文件中设置
//    View controller-based status bar appearance 为NO
    
    
    //设置背景颜色
    self.window.backgroundColor = [UIColor brownColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
