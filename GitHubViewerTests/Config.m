//
//  Config.m
//  GitHubViewer
//
//  Created by Brian Ivan Gesiak on 3/11/14.
//  Copyright 2014 modocache. All rights reserved.
//


#import <Kiwi/Kiwi.h>
#import <Nocilla/Nocilla.h>

CONFIG_START

beforeAll(^{
    NSLog(@"This should prevent network tests from hitting GitHub, but they still go through, "
          @"which means this code isn't being executed...");
    [[LSNocilla sharedInstance] start];
});

afterAll(^{
    NSLog(@"The log statements aren't being printed out, either...");
    [[LSNocilla sharedInstance] stop];
});

CONFIG_END

