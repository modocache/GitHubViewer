//
//  GHVRepoStore.m
//  GitHubViewer
//
//  Created by Brian Ivan Gesiak on 3/22/14.
//  Copyright (c) 2014 modocache. All rights reserved.
//

#import "GHVRepoStore.h"
#import "GHVAPIClient.h"
#import "GHVRepo.h"

static NSString * const kGHVRepoCellIdentifier = @"GHVRepoCellIdentifier";

@interface GHVRepoStore ()
@property (nonatomic, strong) NSArray *repositories;
@end

@implementation GHVRepoStore

#pragma mark - Object Lifecycle

- (instancetype)initWithAPIClient:(GHVAPIClient *)apiClient
                         username:(NSString *)username {
    self = [super init];
    if (self) {
        _apiClient = apiClient;
        _username = username;
        _repositories = @[];
    }
    return self;
}

#pragma mark - UITableViewDataSource Protocol Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return [self.repositories count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:kGHVRepoCellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:kGHVRepoCellIdentifier];
    }

    GHVRepo *repository = self.repositories[indexPath.row];
    cell.textLabel.text = repository.name;
    cell.detailTextLabel.text = repository.repositoryDescription;
    return cell;
}

#pragma mark - Public Interface

- (void)reloadRepositories:(GHVRepoStoreSuccessBlock)success
                   failure:(GHVRepoStoreFailureBlock)failure {
    [self.apiClient allRepositoriesForUsername:self.username
                                       success:^(NSArray *repositories) {
                                           self.repositories = repositories;
                                           if (success) {
                                               success();
                                           }
                                       } failure:^(NSError *error) {
                                           if (failure) {
                                               failure(error);
                                           }
                                       }];
}

@end
