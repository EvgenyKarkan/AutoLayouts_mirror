//
//  SUDestinationViewControllerS.m
//  AutoLayoutsViaStoryboard
//
//  Created by Evgeniy Karkan on 1/8/14.
//  Copyright (c) 2014 EvgenyKarkan. All rights reserved.
//

#import "SUDestinationViewControllerS.h"


@implementation SUDestinationViewControllerS

#pragma mark - Life cycle;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:0.5f];
    NSLog(@"You are watching destination view controller");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
