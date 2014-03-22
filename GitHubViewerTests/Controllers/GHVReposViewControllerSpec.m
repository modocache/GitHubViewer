//
//  GHVReposViewControllerSpec.m
//  GitHubViewer
//
//  Created by Brian Ivan Gesiak on 2/26/14.
//  Copyright (c) 2014 modocache. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "GHVReposViewController.h"
#import "GHVRepoStore.h"

SPEC_BEGIN(GHVReposViewControllerSpec)

describe(@"GHVReposViewController", ^{
    __block GHVRepoStore *repoStore = nil;
    __block GHVReposViewController *controller = nil;
    beforeEach(^{
        repoStore = [GHVRepoStore mock];
        controller = [[GHVReposViewController alloc] initWithRepoStore:repoStore];
    });

    describe(@"-viewDidLoad", ^{
        it(@"reloads the repositories", ^{
            [[repoStore should] receive:@selector(reloadRepositories:failure:)];
            [controller view];
        });
    });
});

SPEC_END
