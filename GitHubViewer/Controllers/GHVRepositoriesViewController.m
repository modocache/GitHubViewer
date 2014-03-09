//
//  GHVRepositoriesViewController.m
//  GitHubViewer
//
//  Created by Brian Ivan Gesiak on 2/26/14.
//  Copyright (c) 2014 modocache. All rights reserved.
//

#import "GHVRepositoriesViewController.h"
#import "GHVAPIClient.h"

static NSString * const kGHVRepoCellIdentifier = @"GHVRepoCellIdentifier";

@interface GHVRepositoriesViewController ()
@property (nonatomic, strong) GHVAPIClient *apiClient;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, strong) NSArray *repositories;
@end

@implementation GHVRepositoriesViewController

- (id)initWithAPIClient:(GHVAPIClient *)apiClient username:(NSString *)username {
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        _apiClient = apiClient;
        _username = username;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self adjustTableView];
    [self getRepositories];
}

#pragma mark - UITableViewDataSource Protocol Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.repositories count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kGHVRepoCellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:kGHVRepoCellIdentifier];
    }

    NSDictionary *repository = self.repositories[indexPath.row];
    cell.textLabel.text = repository[@"name"];
    cell.detailTextLabel.text = repository[@"description"];

    return cell;
}

#pragma mark - Internal Methods

- (void)adjustTableView {
    CGFloat barHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
    self.tableView.contentInset = UIEdgeInsetsMake(barHeight, 0, 0, 0);
}

- (void)getRepositories {
    [self.apiClient allRepositoriesForUsername:self.username
                                       success:^(NSArray *repositories) {
                                           self.repositories = repositories;
                                           [self.tableView reloadData];
                                       } failure:^(NSError *error) {
                                           [self showAlertForError:error];
                                       }];
}

- (void)showAlertForError:(NSError *)error {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:error.localizedDescription
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
    [alertView show];
}

@end
