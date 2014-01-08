//
//  SUWelcomeViewSC.m
//  AutoLayoutsViaStoryboard&Constraints
//
//  Created by Evgeniy Karkan on 1/8/14.
//  Copyright (c) 2014 EvgenyKarkan. All rights reserved.
//

#import "SUWelcomeViewSC.h"

@implementation SUWelcomeViewSC

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.backgroundColor = [UIColor lightGrayColor];
    self.scrollViewSC.backgroundColor = [[UIColor cyanColor] colorWithAlphaComponent:0.6f];
}

@end
