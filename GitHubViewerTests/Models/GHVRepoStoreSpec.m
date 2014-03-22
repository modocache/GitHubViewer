//
//  GHVRepoStoreSpec.m
//  GitHubViewer
//
//  Created by Brian Ivan Gesiak on 3/23/14.
//  Copyright (c) 2014 modocache. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "GHVRepoStore.h"
#import "GHVAPIClient.h"

SPEC_BEGIN(GHVRepoStoreSpec)

describe(@"GHVRepoStore", ^{
    __block GHVRepoStore *repoStore = nil;
    beforeEach(^{
        GHVAPIClient *apiClientMock = [GHVAPIClient mock];
        repoStore = [[GHVRepoStore alloc] initWithAPIClient:apiClientMock
                                                   username:@"gitster"];
    });

    describe(@"-reloadRepositories:failure:", ^{
        it(@"fetches repositories from the API", ^{
            [[repoStore.apiClient should] receive:@selector(allRepositoriesForUsername:success:failure:)
                                    withArguments:repoStore.username, [KWAny any], [KWAny any]];
            [repoStore reloadRepositories:nil failure:nil];
        });
    });
});

SPEC_END
