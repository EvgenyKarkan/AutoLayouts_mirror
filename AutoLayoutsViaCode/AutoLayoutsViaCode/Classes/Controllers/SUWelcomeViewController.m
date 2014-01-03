//
//  SUWelcomeViewController.m
//  AutoLayoutsViaCode
//
//  Created by Evgeniy Karkan on 1/3/14.
//  Copyright (c) 2014 EvgenyKarkan. All rights reserved.
//

#import "SUWelcomeViewController.h"
#import "SUWelcomeView.h"
#import "SUDestinationViewController.h"

@interface SUWelcomeViewController () <SUDismissWelcomeScreenDelegate>

@property (nonatomic, strong) SUWelcomeView *welcomeView;
@property (nonatomic, strong) SUDestinationViewController *myDestinationViewController;

@end


@implementation SUWelcomeViewController;

#pragma mark - Life cycle

- (void)loadView
{
	SUWelcomeView *view = [[SUWelcomeView alloc] init];
	self.view = view;
	self.welcomeView = view;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.welcomeView.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - EKDismissWelcomeScreenDelegate

- (void)dismissWelcomeScreen
{
    self.myDestinationViewController = [[SUDestinationViewController alloc] init];
	[self presentViewController:self.myDestinationViewController animated:NO completion:nil];
}

@end
