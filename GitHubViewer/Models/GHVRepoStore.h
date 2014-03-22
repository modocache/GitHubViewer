//
//  GHVRepoStore.h
//  GitHubViewer
//
//  Created by Brian Ivan Gesiak on 3/22/14.
//  Copyright (c) 2014 modocache. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^GHVRepoStoreSuccessBlock)(void);
typedef void (^GHVRepoStoreFailureBlock)(NSError *error);

@class GHVAPIClient;

@interface GHVRepoStore : NSObject <UITableViewDataSource>

@property (nonatomic, strong, readonly) GHVAPIClient *apiClient;
@property (nonatomic, strong, readonly) NSString *username;
@property (nonatomic, strong, readonly) NSArray *repositories;

- (instancetype)initWithAPIClient:(GHVAPIClient *)apiClient
                         username:(NSString *)username;
- (void)reloadRepositories:(GHVRepoStoreSuccessBlock)success
                   failure:(GHVRepoStoreFailureBlock)failure;

@end
