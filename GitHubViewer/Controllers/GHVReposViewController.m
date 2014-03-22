//
//  GHVReposViewController.m
//  GitHubViewer
//
//  Created by Brian Ivan Gesiak on 2/26/14.
//  Copyright (c) 2014 modocache. All rights reserved.
//

#import "GHVReposViewController.h"
#import "GHVRepo.h"
#import "GHVRepoStore.h"
#import "GHVRepoViewController.h"
#import "UIAlertView+GHVError.h"
#import <SVProgressHUD/SVProgressHUD.h>

@interface GHVReposViewController ()
@property (nonatomic, strong) NSArray *repositories;
@end

@implementation GHVReposViewController

#pragma mark - Object Lifecycle

- (id)initWithRepoStore:(GHVRepoStore *)repoStore {
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        _repoStore = repoStore;
    }
    return self;
}

#pragma mark - UIViewController Overrides

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = NSLocalizedString(@"Repositories", nil);
    self.tableView.dataSource = self.repoStore;
    [self startNetworkIndicators];
    [self.repoStore reloadRepositories:^{
        [self stopNetworkIndicators];
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        [self stopNetworkIndicators];
        [UIAlertView showAlertForError:error];
    }];
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

- (void)startNetworkIndicators {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [SVProgressHUD show];
}

- (void)stopNetworkIndicators {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [SVProgressHUD dismiss];
}

@end
