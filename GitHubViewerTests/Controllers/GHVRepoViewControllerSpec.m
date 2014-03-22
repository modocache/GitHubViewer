//
//  GHVRepoViewControllerSpec.m
//  GitHubViewer
//
//  Created by Brian Ivan Gesiak on 2/26/14.
//  Copyright (c) 2014 modocache. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "GHVRepoViewController.h"
#import "GHVRepo.h"

SPEC_BEGIN(GHVRepoViewControllerSpec)

describe(@"GHVRepoViewController", ^{
    __block GHVRepoViewController *controller = nil;
    beforeEach(^{
        GHVRepo *repository = [[GHVRepo alloc] initWithJSONDictionary:@{@"name": @"git"}];
        controller = [[GHVRepoViewController alloc] initWithRepository:repository];
    });

    describe(@"-viewDidLoad", ^{
        it(@"sets the title to the repository name", ^{
            [controller view];
            [[controller.title should] equal:controller.repository.name];
        });
    });
});

SPEC_END
