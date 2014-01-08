//
//  SUSecondPageViewSC.m
//  AutoLayoutsViaStoryboard&Constraints
//
//  Created by Evgeniy Karkan on 1/8/14.
//  Copyright (c) 2014 EvgenyKarkan. All rights reserved.
//

#import "SUSecondPageViewSC.h"


@implementation SUSecondPageViewSC

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.backgroundColor = [[UIColor orangeColor] colorWithAlphaComponent:0.4f];
    }
    return self;
}

@end
