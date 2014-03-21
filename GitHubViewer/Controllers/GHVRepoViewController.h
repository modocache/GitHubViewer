//
//  GHVRepoViewController.h
//  GitHubViewer
//
//  Created by Brian Ivan Gesiak on 3/22/14.
//  Copyright (c) 2014 modocache. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GHVRepo;

@interface GHVRepoViewController : UIViewController

@property (nonatomic, strong, readonly) GHVRepo *repository;

- (instancetype)initWithRepository:(GHVRepo *)repository;

@end
