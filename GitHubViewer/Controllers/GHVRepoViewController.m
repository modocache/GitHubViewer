//
//  GHVRepoViewController.m
//  GitHubViewer
//
//  Created by Brian Ivan Gesiak on 3/22/14.
//  Copyright (c) 2014 modocache. All rights reserved.
//

#import "GHVRepoViewController.h"
#import "GHVRepo.h"

@implementation GHVRepoViewController

#pragma mark - Object Lifecycle

- (instancetype)initWithRepository:(GHVRepo *)repository {
    self = [super init];
    if (self) {
        _repository = repository;
    }
    return self;
}

#pragma mark - UIViewController Overrides

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.repository.name;
}

@end
