//
//  GHVRepo.h
//  GitHubViewer
//
//  Created by Brian Ivan Gesiak on 3/22/14.
//  Copyright (c) 2014 modocache. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GHVRepo : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *repositoryDescription;

- (instancetype)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@end
