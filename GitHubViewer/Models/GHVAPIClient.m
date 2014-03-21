//
//  GHVAPIClient.m
//  GitHubViewer
//
//  Created by Brian Ivan Gesiak on 2/26/14.
//  Copyright (c) 2014 modocache. All rights reserved.
//

#import "GHVAPIClient.h"
#import "GHVRepo.h"
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
                 NSMutableArray *repositories = [NSMutableArray array];
                 for (NSDictionary *dictionary in responseObject) {
                     [repositories addObject:[[GHVRepo alloc] initWithJSONDictionary:dictionary]];
                 }
                 success([repositories copy]);
             }
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             if (failure) {
                 failure(error);
             }
         }];
}

@end
