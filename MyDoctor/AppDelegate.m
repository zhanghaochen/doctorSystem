//
//  AppDelegate.m
//  MyDoctor
//
//  Created by 张昊辰 on 15/11/23.
//  Copyright (c) 2015年 com.mingxing. All rights reserved.
//

#import "AppDelegate.h"
#import "MDMyViewController.h"
#import "MDServiceViewController.h"
#import "MDHomeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
{
    UINavigationController *homeNav;
    UINavigationController *serviceNav;
    UINavigationController *myNav;
    MDMyViewController * my;
    MDServiceViewController * service;
    MDHomeViewController * home;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    NSString *homeDirectory = NSHomeDirectory();
    NSLog(@"path:%@", homeDirectory);
    
    [self showMainView];
    return YES;
}

#pragma mark - mainView
@synthesize tabBarController = _tabBarController;

-(void)showMainView
{
    
    _tabBarController = [[UITabBarController alloc] init];
    _tabBarController.delegate = self;
    _tabBarController.tabBar.backgroundImage = nil;
    _tabBarController.tabBar.backgroundColor = [UIColor clearColor];
    _tabBarController.tabBar.selectedImageTintColor = [UIColor colorWithRed:20/255.0 green:204/255.0 blue:164/255.0 alpha:1];

    home=[[MDHomeViewController alloc] init];
    homeNav=[[UINavigationController alloc] initWithRootViewController:home];
    UIImage * normalImage = [UIImage imageNamed:@"home"];
    homeNav.tabBarItem=[[UITabBarItem alloc] initWithTitle:@"首页" image:[normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];

    
    service=[[MDServiceViewController alloc] init];
    serviceNav=[[UINavigationController alloc] initWithRootViewController:service];
    normalImage = [UIImage imageNamed:@"service"];
    serviceNav.tabBarItem=[[UITabBarItem alloc] initWithTitle:@"服务记录" image:[normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    my=[[MDMyViewController alloc] init];
    myNav = [[UINavigationController alloc] initWithRootViewController:my];
    normalImage = [UIImage imageNamed:@"my"];
    myNav.tabBarItem=[[UITabBarItem alloc] initWithTitle:@"我的" image:[normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    _tabBarController.viewControllers = [NSArray arrayWithObjects:homeNav,serviceNav,myNav, nil];

    [self.window setRootViewController:_tabBarController];
    [self.window makeKeyAndVisible];
    [self applicationWillEnterForeground:nil];//主动触发一次fromlastseen

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

@end
