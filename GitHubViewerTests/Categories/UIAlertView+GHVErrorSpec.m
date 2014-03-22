//
//  UIAlertView+GHVErrorSpec.m
//  GitHubViewer
//
//  Created by Brian Ivan Gesiak on 3/22/14.
//  Copyright (c) 2014 modocache. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "UIAlertView+GHVError.h"

SPEC_BEGIN(UIAlertView_GHVErrorSpec)

describe(@"UIAlertView+GHVError", ^{
    describe(@"+showForError:", ^{
        it(@"shows a UIAlertView", ^{
            UIAlertView *alertViewMock = [UIAlertView mock];
            [UIAlertView stub:@selector(alloc) andReturn:alertViewMock];
            [[alertViewMock should] receive:@selector(initWithTitle:message:delegate:cancelButtonTitle:otherButtonTitles:)];
            [UIAlertView showAlertForError:nil];
        });
    });
});

SPEC_END

