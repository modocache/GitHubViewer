//
//  GHVReposViewController.m
//  GitHubViewer
//
//  Created by Brian Ivan Gesiak on 2/26/14.
//  Copyright (c) 2014 modocache. All rights reserved.
//

#import "GHVReposViewController.h"
#import "GHVAPIClient.h"
#import "GHVRepo.h"
#import "GHVRepoViewController.h"
#import "UIAlertView+GHVError.h"
#import <SVProgressHUD/SVProgressHUD.h>

static NSString * const kGHVRepoCellIdentifier = @"GHVRepoCellIdentifier";

@interface GHVReposViewController ()
@property (nonatomic, strong) NSArray *repositories;
@end

@implementation GHVReposViewController

#pragma mark - Object Lifecycle

- (id)initWithAPIClient:(GHVAPIClient *)apiClient username:(NSString *)username {
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        _apiClient = apiClient;
        _username = username;
    }
    return self;
}

#pragma mark - UIViewController Overrides

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = NSLocalizedString(@"Repositories", nil);
    [self getRepositories];
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

#pragma mark - UITableViewDelegate Protocol Methods

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    GHVRepo *repository = self.repositories[indexPath.row];
    GHVRepoViewController *controller =
        [[GHVRepoViewController alloc] initWithRepository:repository];
    [self.navigationController pushViewController:controller
                                         animated:YES];
}

#pragma mark - Internal Methods

- (void)getRepositories {
    [self startNetworkIndicators];
    [self.apiClient
        allRepositoriesForUsername:self.username
                           success:^(NSArray *repositories) {
                               [self stopNetworkIndicators];
                               self.repositories = repositories;
                               [self.tableView reloadData];
                           } failure:^(NSError *error) {
                               [self stopNetworkIndicators];
                               [UIAlertView showAlertForError:error];
                           }];
}

- (void)startNetworkIndicators {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [SVProgressHUD show];
}

- (void)stopNetworkIndicators {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [SVProgressHUD dismiss];
}

@end
