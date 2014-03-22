//
//  GHVReposViewController.h
//  GitHubViewer
//
//  Created by Brian Ivan Gesiak on 2/26/14.
//  Copyright (c) 2014 modocache. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GHVRepoStore;

@interface GHVReposViewController : UITableViewController

@property (nonatomic, strong, readonly) GHVRepoStore *repoStore;
@property (nonatomic, strong, readonly) NSArray *repositories;

- (id)initWithRepoStore:(GHVRepoStore *)repoStore;

@end
