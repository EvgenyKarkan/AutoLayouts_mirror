//
//  SUFourthPageViewSC.m
//  AutoLayoutsViaStoryboard&Constraints
//
//  Created by Evgeniy Karkan on 1/8/14.
//  Copyright (c) 2014 EvgenyKarkan. All rights reserved.
//

#import "SUFourthPageViewSC.h"


@implementation SUFourthPageViewSC

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.backgroundColor = [[UIColor magentaColor] colorWithAlphaComponent:0.3f];
    }
    return self;
}
@end
