//
//  GHVAPIClientSpec.m
//  GitHubViewer
//
//  Created by Brian Ivan Gesiak on 2/26/14.
//  Copyright (c) 2014 modocache. All rights reserved.
//


#import <Kiwi/Kiwi.h>
#import <LSNocilla.h>
#import "GHVAPIClient.h"

SPEC_BEGIN(GHVAPIClientSpec)

afterEach(^{
    [[LSNocilla sharedInstance] clearStubs];
});

describe(@"GHVAPIClient", ^{
    __block GHVAPIClient *client = nil;
    beforeEach(^{
        client = [GHVAPIClient new];
    });

    context(@"when the request returns a successful response", ^{
        beforeEach(^{
            stubRequest(@"GET",
                        @"https://api.github.com/"
                        @"users/(.*?)/repos".regex)
            .andReturn(200)
            .withHeaders(@{@"Content-Type": @"application/json"})
            .withBody(@"[\"repo-1\"]");
        });

        it(@"gets repositories", ^{
            __block NSArray *allRepos = nil;
            [client allRepositoriesForUsername:@"modocache"
                                       success:^(NSArray *repos) {
                                           allRepos = repos;
                                       } failure:nil];

            [[expectFutureValue(allRepos) shouldEventually]
                haveCountOf:1];
        });
    });

    context(@"when the request fails", ^{
        beforeEach(^{
            stubRequest(@"GET",
                        @"https://api.github.com/"
                        @"users/(.*?)/repos".regex)
            .andFailWithError([NSError errorWithDomain:NSURLErrorDomain
                                                  code:29
                                              userInfo:@{NSLocalizedDescriptionKey: @"Uh-oh!"}]);
        });

        it(@"calls the failure block", ^{
            __block NSError *error = nil;
            [client allRepositoriesForUsername:@"modocache"
                                       success:nil
                                       failure:^(NSError *requestError) {
                                           error = requestError;
                                       }];
            [[expectFutureValue(error.localizedDescription) shouldEventually]
                equal:@"Uh-oh!"];
        });
    });
});

SPEC_END
