//
//  SUWelcomeViewController.m
//  AutoLayoutsViaCode&Constraints
//
//  Created by Evgeniy Karkan on 1/6/14.
//  Copyright (c) 2014 EvgenyKarkan. All rights reserved.
//

#import "SUWelcomeViewControllerC.h"
#import "SUWelcomeViewC.h"

@interface SUWelcomeViewControllerC ()

@property (nonatomic, strong) SUWelcomeViewC *welcomeView;

@end


@implementation SUWelcomeViewControllerC;

#pragma mark - Life cycle

- (void)loadView
{
	SUWelcomeViewC *view = [[SUWelcomeViewC alloc] init];
	self.view = view;
	self.welcomeView = view;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
