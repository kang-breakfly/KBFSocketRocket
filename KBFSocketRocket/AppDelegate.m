//
//  AppDelegate.m
//  KBFSocketRocket
//
//  Created by Apple on 2020/5/12.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
        self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
           self.window.backgroundColor = [UIColor whiteColor];
           [self.window makeKeyAndVisible];
            [self newTabViewController];
           return YES;
    }
    -(void)newTabViewController{

        //self.tabBarController=;
        self.window.rootViewController =[[ViewController alloc]init];
    }



@end
