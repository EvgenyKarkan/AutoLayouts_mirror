//
//  SUViewController.m
//  AutoLayoutsViaStoryboard
//
//  Created by Evgeniy Karkan on 1/3/14.
//  Copyright (c) 2014 EvgenyKarkan. All rights reserved.
//

#import "SUWelcomeViewControllerS.h"
#import "SUWelcomeViewS.h"
#import "SUDestinationViewControllerS.h"

@interface SUWelcomeViewControllerS () <SUDismissWelcomeScreenDelegateS>

@end

@implementation SUWelcomeViewControllerS;

#pragma mark - Life cycle

- (void)viewDidLoad
{
	[super viewDidLoad];
    ((SUWelcomeViewS *)self.view).delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - SUDismissWelcomeScreenDelegateS

- (void)dismissWelcomeScreen
{
    [self presentViewController:[[SUDestinationViewControllerS alloc] init] animated:NO completion:nil];
}

@end
