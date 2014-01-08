//
//  SUFirstPageViewS.m
//  AutoLayoutsViaStoryboard
//
//  Created by Evgeniy Karkan on 1/8/14.
//  Copyright (c) 2014 EvgenyKarkan. All rights reserved.
//

#import "SUFirstPageViewS.h"

@implementation SUFirstPageViewS;

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.2f];
    }
    return self;
}

@end
