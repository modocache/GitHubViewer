//
//  UIAlertView+GHVError.h
//  GitHubViewer
//
//  Created by Brian Ivan Gesiak on 3/22/14.
//  Copyright (c) 2014 modocache. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (GHVError)

+ (void)showAlertForError:(NSError *)error;

@end
