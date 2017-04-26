//
//  AppDelegate.m
//  island2
//
//  Created by 陈松 on 2016/12/26.
//  Copyright © 2016年 陈松. All rights reserved.
//

#import "AppDelegate.h"
#import "UIKit/UIKit.h"
#import "BookViewController.h"
#import "MovieViewController.h"
#import "MusicViewController.h"
#import "MineViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    //1.创建Window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    //a.初始化一个tabBar控制器
    
    //b.创建子控制器
    BookViewController *c1=[[BookViewController alloc]init];
    c1.title = @"图书";
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:c1];
    
    MovieViewController *c2=[[MovieViewController alloc]init];
    c2.title=@"电影";
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:c2];
    //MovieViewController *c2=[[MovieViewController alloc]init];
    //c2.title=@"电影";
    //UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:c2];

    MusicViewController *c3=[[MusicViewController alloc]init];
    c3.title = @"音乐";
    UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:c3];
    
    MineViewController *c4=[[MineViewController alloc]init];
    c4.title = @"我的";
    UINavigationController *nav4 = [[UINavigationController alloc]initWithRootViewController:c4];
    

    //添加子控制器到ITabBarController中
    UITabBarController *tb=[[UITabBarController alloc]init];
    //设置控制器为Window的根控制器
    self.window.rootViewController=tb;
    NSArray *array=[NSArray arrayWithObjects:nav1,nav2,nav3,nav4,nil];
    tb.viewControllers=array;
    //tb.viewControllers=@[c1,c2,c3,c4,c5];
    //2.设置Window为主窗口并显示出来
    [self.window makeKeyAndVisible];
    
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


@end
