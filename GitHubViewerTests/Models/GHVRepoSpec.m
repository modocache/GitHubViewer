//
//  GHVRepoSpec.m
//  GitHubViewer
//
//  Created by Brian Ivan Gesiak on 3/22/14.
//  Copyright (c) 2014 modocache. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "GHVRepo.h"

SPEC_BEGIN(GHVRepoSpec)

describe(@"GHVRepo", ^{
    describe(@"-initWithJSONDictionary:", ^{
        __block NSDictionary *jsonDictionary = nil;
        beforeEach(^{
            jsonDictionary = @{
                @"name": @"git",
                @"description": @"the stupid content tracker"
            };
        });

        it(@"sets the name and description properties", ^{
            GHVRepo *repository = [[GHVRepo alloc] initWithJSONDictionary:jsonDictionary];
            [[repository.name should] equal:@"git"];
            [[repository.repositoryDescription should] equal:@"the stupid content tracker"];
        });
    });
});

SPEC_END

