//
//  GHVAPIClient.h
//  GitHubViewer
//
//  Created by Brian Ivan Gesiak on 2/26/14.
//  Copyright (c) 2014 modocache. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^GHVAPIRepositoriesBlock)(NSArray *repositories);
typedef void (^GHVAPIFailureBlock)(NSError *error);

@interface GHVAPIClient : NSObject

/**
 Fetches all repositories owned by the user with the given username.

 @param username The username of the user for whom to fetch repositories.
 @param success A block to be executed in case the repositories are successfully downloaded.
 @param failure A block to be executed in case the repositories fail to download.
 */
- (void)allRepositoriesForUsername:(NSString *)username
                           success:(GHVAPIRepositoriesBlock)success
                           failure:(GHVAPIFailureBlock)failure;

@end
