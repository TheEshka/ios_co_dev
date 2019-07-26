//
//  AppDelegate.m
//  MainProject
//
//  Created by Gagik on 02/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "AppDelegate.h"
#import "ESKContainerViewController.h"
#import "ESKContainerCollectionViewController.h"

#import "ESKProfileViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    ESKProfileViewController *prof = [[ESKProfileViewController alloc] init];
//    self.window.rootViewController = prof;
    
    ESKContainerViewController *container = [ESKContainerViewController new];
    
    ESKProfileViewController *vc1 = [[ESKProfileViewController alloc] init];

    UIViewController *vc2 = [UIViewController new];
    vc2.view.backgroundColor = [UIColor blueColor];
    UILabel *lb2 = [[UILabel alloc] initWithFrame:CGRectMake(200, 200, 100, 100)];
    [lb2 setText:@"2222222222"];
    [vc2.view addSubview:lb2];

    UIViewController *vc3 = [UIViewController new];
    vc3.view.backgroundColor = [UIColor brownColor];
    UILabel *lb3 = [[UILabel alloc] initWithFrame:CGRectMake(200, 200, 100, 100)];
    [lb3 setText:@"333333333"];
    [vc3.view addSubview:lb3];

    UIViewController *vc4 = [UIViewController new];
    vc4.view.backgroundColor = [UIColor purpleColor];
    UILabel *lb4 = [[UILabel alloc] initWithFrame:CGRectMake(200, 200, 100, 100)];
    [lb4 setText:@"4444444444"];
    [vc4.view addSubview:lb4];

    [container addContentViewController:vc1 forTitle:@"Profile"];
    [container addContentViewController:vc2 forTitle:@"Wall"];
    [container addContentViewController:vc3 forTitle:@"Settings"];
    [container addContentViewController:vc4 forTitle:@"Popka"];

    self.window.rootViewController = container;
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
