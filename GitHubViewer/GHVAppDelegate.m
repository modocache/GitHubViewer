//
//  GHVAppDelegate.m
//  GitHubViewer
//
//  Created by Brian Ivan Gesiak on 2/26/14.
//  Copyright (c) 2014 modocache. All rights reserved.
//

#import "GHVAppDelegate.h"
#import "GHVAPIClient.h"
#import "GHVReposViewController.h"

@implementation GHVAppDelegate

#pragma mark - UIApplicationDelegate Protocol Methods

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];

    GHVAPIClient *apiClient = [GHVAPIClient new];
    GHVReposViewController *viewController =
        [[GHVReposViewController alloc] initWithAPIClient:apiClient
                                                 username:@"modocache"];
    UINavigationController *navigationController =
        [[UINavigationController alloc] initWithRootViewController:viewController];
    self.window.rootViewController = navigationController;

    [self.window makeKeyAndVisible];
    return YES;
}

@end
