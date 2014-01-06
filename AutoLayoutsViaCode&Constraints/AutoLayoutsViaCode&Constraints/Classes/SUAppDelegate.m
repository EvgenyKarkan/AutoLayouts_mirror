//
//  SUAppDelegate.m
//  AutoLayoutsViaCode&Constraints
//
//  Created by Evgeniy Karkan on 1/6/14.
//  Copyright (c) 2014 EvgenyKarkan. All rights reserved.
//

#import "SUAppDelegate.h"
#import "SUWelcomeViewControllerC.h"


@implementation SUAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
	SUWelcomeViewControllerC *welcomeViewController = [[SUWelcomeViewControllerC alloc] init];
    
	self.window.rootViewController = welcomeViewController;
	self.window.backgroundColor = [UIColor whiteColor];
	[self.window makeKeyAndVisible];
    
	return YES;
}

@end

