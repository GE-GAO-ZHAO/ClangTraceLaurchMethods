//
//  GGZAppDelegate.m
//  ClangTraceLaurchMethods
//
//  Created by 葛高召 on 08/22/2021.
//  Copyright (c) 2021 葛高召. All rights reserved.
//

#import "GGZAppDelegate.h"
#import <ClangTraceLaurchMethods/GGZGeneralOrderFileTool.h>
#import <AFNetworking/AFNetworkReachabilityManager.h>
@interface GGZAppDelegate()
@property (nonatomic, copy) void(^testCallBlock)(void);

@end

@implementation GGZAppDelegate
void testCallCMethod(void);

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    self.testCallBlock = ^(void){
        NSLog(@"testCallBlock");
    };
    for (NSInteger i = 0; i < 100; i++) {
        [self callSomeMethods];
    }
    
    [self start];
    return YES;
}

#pragma mark - Private Method
- (void)callSomeMethods {
    NSInteger i = 0;
    while (i < 5) {
        // call third lib method
        [[AFNetworkReachabilityManager sharedManager] startMonitoring];
        // call block
        self.testCallBlock();
        // call c method
        testCallCMethod();
        i++;
    }
}


- (void)start {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [GGZGeneralOrderFileTool generateOrderFile];
    });
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end


void testCallCMethod(void) {
    NSLog(@"testCallCMethod");
}
