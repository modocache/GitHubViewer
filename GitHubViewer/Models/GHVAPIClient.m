//
//  GHVAPIClient.m
//  GitHubViewer
//
//  Created by Brian Ivan Gesiak on 2/26/14.
//  Copyright (c) 2014 modocache. All rights reserved.
//

#import "GHVAPIClient.h"
#import <AFNetworking/AFNetworking.h>

@implementation GHVAPIClient

- (void)allRepositoriesForUsername:(NSString *)username
                           success:(GHVAPIRepositoriesBlock)success
                           failure:(GHVAPIFailureBlock)failure {
    NSString *urlString = @"https://api.github.com/";
    NSURL *baseURL = [NSURL URLWithString:urlString];
    AFHTTPRequestOperationManager *manager =
        [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseURL];

    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager GET:[NSString stringWithFormat:@"users/%@/repos",
                                        username]
      parameters:nil
         success:^(AFHTTPRequestOperation *operation,
                   id responseObject) {
             if (success) {
                 success(responseObject);
             }
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             if (failure) {
                 failure(error);
             }
         }];
}

@end
