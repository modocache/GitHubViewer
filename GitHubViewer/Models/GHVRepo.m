//
//  GHVRepo.m
//  GitHubViewer
//
//  Created by Brian Ivan Gesiak on 3/22/14.
//  Copyright (c) 2014 modocache. All rights reserved.
//

#import "GHVRepo.h"

@implementation GHVRepo

- (instancetype)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    self = [super init];
    if (self) {
        _name = jsonDictionary[@"name"];
        _repositoryDescription = jsonDictionary[@"description"];
    }
    return self;
}

@end
