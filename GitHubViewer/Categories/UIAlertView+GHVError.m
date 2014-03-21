//
//  UIAlertView+GHVError.m
//  GitHubViewer
//
//  Created by Brian Ivan Gesiak on 3/22/14.
//  Copyright (c) 2014 modocache. All rights reserved.
//

#import "UIAlertView+GHVError.h"

@implementation UIAlertView (GHVError)

+ (void)showAlertForError:(NSError *)error {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:error.localizedDescription
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
    [alertView show];
}

@end
