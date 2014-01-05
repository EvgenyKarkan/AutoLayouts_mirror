//
//  SUAppDelegate.m
//  AutoLayoutsViaCode
//
//  Created by Evgeniy Karkan on 1/3/14.
//  Copyright (c) 2014 EvgenyKarkan. All rights reserved.
//

#import "SUAppDelegate.h"
#import "SUWelcomeViewController.h"


@implementation SUAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
	SUWelcomeViewController *welcomeViewController = [[SUWelcomeViewController alloc] init];
    
	self.window.rootViewController = welcomeViewController;
	self.window.backgroundColor = [UIColor whiteColor];
	[self.window makeKeyAndVisible];
    
	return YES;
}

@end
