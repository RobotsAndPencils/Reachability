//
//  TMAppDelegate.m
//  MacOSReachabilityTestARC
//
//  Created by Tony Million on 21/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "TMAppDelegate.h"

#import "TMReachability.h"

@implementation TMAppDelegate

@synthesize window = _window;

@synthesize blockLabel = _blockLabel, notificationLabel = _notificationLabel;

-(void)reachabilityChanged:(NSNotification*)note
{
    TMReachability * reach = [note object];
    
    if([reach isReachable])
    {
        _notificationLabel.stringValue = @"Notification Says Reachable";
    }
    else
    {
        _notificationLabel.stringValue = @"Notification Says Unreachable";
    }
}


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(reachabilityChanged:) 
                                                 name:kTMReachabilityChangedNotification
                                               object:nil];

    
    TMReachability * reach = [TMReachability reachabilityWithHostname:@"www.google.com"];
    
    reach.reachableBlock = ^(TMReachability * reachability)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            _blockLabel.stringValue = @"Block Says Reachable";
        });
    };
    
    reach.unreachableBlock = ^(TMReachability * reachability)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            _blockLabel.stringValue = @"Block Says Unreachable";
        });
    };
    
    [reach startNotifier];
}

@end
