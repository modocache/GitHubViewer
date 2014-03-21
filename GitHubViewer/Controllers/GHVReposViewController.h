//
//  GHVReposViewController.h
//  GitHubViewer
//
//  Created by Brian Ivan Gesiak on 2/26/14.
//  Copyright (c) 2014 modocache. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GHVAPIClient;

@interface GHVReposViewController : UITableViewController

@property (nonatomic, strong, readonly) GHVAPIClient *apiClient;
@property (nonatomic, copy, readonly) NSString *username;
@property (nonatomic, strong, readonly) NSArray *repositories;

- (id)initWithAPIClient:(GHVAPIClient *)apiClient
               username:(NSString *)username;

@end
