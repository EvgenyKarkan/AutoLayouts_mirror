//
//  SUThirdPageViewS.m
//  AutoLayoutsViaStoryboard
//
//  Created by Evgeniy Karkan on 1/8/14.
//  Copyright (c) 2014 EvgenyKarkan. All rights reserved.
//

#import "SUThirdPageViewS.h"

@implementation SUThirdPageViewS;

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.8f];
    }
    return self;
}

@end
