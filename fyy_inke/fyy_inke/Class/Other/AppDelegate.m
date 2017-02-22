//
//  AppDelegate.m
//  fyy_inke
//
//  Created by 冯亚运 on 17/2/16.
//  Copyright © 2017年 冯亚运. All rights reserved.
//

#import "AppDelegate.h"
#import "FYYTabBarViewController.h"
#import "FYYLocationManger.h"
#import "FYYAdeversizeView.h"
#import "FYYUserHelper.h"
#import "FYYLoginViewController.h"
#import "AppDelegate+UMeng.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self setupUmeng];
    self.window.backgroundColor = [UIColor whiteColor];
    UIViewController *mainVC = [[FYYTabBarViewController alloc] init];
    /*if ([FYYUserHelper isAutoLogin]) {
        mainVC = [[FYYTabBarViewController alloc] init];
    }else {
        mainVC = [[FYYLoginViewController alloc] init];
    }*/
    self.window.rootViewController = mainVC;
    [[FYYLocationManger sharedManger] getGps:^(NSString *lat, NSString *lon) {
        
    }];
    [self.window makeKeyAndVisible];
    //广告的处理视图
    FYYAdeversizeView *adverView = [FYYAdeversizeView loadAdeversizeView];
    [self.window addSubview:adverView];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    BOOL result = [UMSocialSnsService handleOpenURL:url];
    if (result == FALSE) {
        //调用其他SDK，例如支付宝SDK等
    }
    return result;
}


@end
