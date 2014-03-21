//
//  GHVRepositoriesViewControllerSpec.m
//  GitHubViewer
//
//  Created by Brian Ivan Gesiak on 2/26/14.
//  Copyright (c) 2014 modocache. All rights reserved.
//


#import <Kiwi/Kiwi.h>
#import "GHVReposViewController.h"
#import "GHVAPIClient.h"

SPEC_BEGIN(GHVReposViewControllerSpec)

describe(@"GHVReposViewController", ^{
    __block GHVAPIClient *client = nil;
    __block NSString *username = nil;
    __block GHVReposViewController *controller = nil;
    beforeEach(^{
        client = [GHVAPIClient mock];
        username = @"allending";
        controller = [[GHVReposViewController alloc] initWithAPIClient:client
                                                              username:username];
    });

    describe(@"-viewDidLoad", ^{
        it(@"loads the repositories", ^{
            [[client should] receive:@selector(allRepositoriesForUsername:success:failure:)
                       withArguments:username, [KWAny any], [KWAny any]];
            [controller view];
        });
    });
});

SPEC_END

