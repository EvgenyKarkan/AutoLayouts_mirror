//
//  SUWelcomeViewS.m
//  AutoLayoutsViaStoryboard
//
//  Created by Evgeny Karkan on 07.01.14.
//  Copyright (c) 2014 EvgenyKarkan. All rights reserved.
//

#import "SUWelcomeViewS.h"

@interface SUWelcomeViewS () <UIScrollViewDelegate>

@property (nonatomic, assign) BOOL pageControlBeingUsedS;

@end


@implementation SUWelcomeViewS;

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self configurateScroll];
}

#pragma mark - Actions

- (IBAction)skip:(UIButton *)sender
{
    [self.delegate dismissWelcomeScreen];
}

- (IBAction)pageControlDidPressed:(UIPageControl *)sender
{
    if (sender) {
        [self.scrollViewS setContentOffset:CGPointMake(self.bounds.size.width * self.pageControlS.currentPage, 0)
                                  animated:YES];
        self.pageControlBeingUsedS = YES;
	}
}

#pragma mark - Scrollview delegate

- (void)scrollViewDidScroll:(UIScrollView *)sender
{
	if (!self.pageControlBeingUsedS) {
        self.pageControlS.currentPage = round(self.scrollViewS.contentOffset.x / self.scrollViewS.bounds.size.width);
	}
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
	self.pageControlBeingUsedS = NO;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
	self.pageControlBeingUsedS = NO;
}

#pragma mark - Adjust scrollview

- (void)configurateScroll
{
	self.scrollViewS.backgroundColor = [[UIColor cyanColor] colorWithAlphaComponent:0.6f];
	self.scrollViewS.contentSize = CGSizeMake(self.bounds.size.width * 4, self.scrollViewS.bounds.size.height);
	[self.scrollViewS setContentOffset:CGPointMake(self.bounds.size.width * self.pageControlS.currentPage, 0)
	                          animated:NO];
}

@end
