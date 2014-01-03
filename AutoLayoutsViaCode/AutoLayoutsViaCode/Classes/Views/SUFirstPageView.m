//
//  SUFirstPageView.m
//  AutoLayoutsViaCode
//
//  Created by Evgeniy Karkan on 1/3/14.
//  Copyright (c) 2014 EvgenyKarkan. All rights reserved.
//

#import "SUFirstPageView.h"

@interface SUFirstPageView ()

@property (nonatomic, strong) UILabel *hint;

@end


@implementation SUFirstPageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
	if (self) {
		self.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.2f];
	}
	
	self.hint = [[UILabel alloc] init];
	self.hint.backgroundColor = [UIColor clearColor];
	self.hint.textAlignment = NSTextAlignmentCenter;
	self.hint.text = @"Here is your hints";
	self.hint.textColor = [UIColor whiteColor];
	[self addSubview:self.hint];
    
    return self;
}


@end
