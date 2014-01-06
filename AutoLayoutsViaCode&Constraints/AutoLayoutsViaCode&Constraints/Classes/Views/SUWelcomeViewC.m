//
//  SUWelcomeView.m
//  AutoLayoutsViaCode&Constraints
//
//  Created by Evgeniy Karkan on 1/6/14.
//  Copyright (c) 2014 EvgenyKarkan. All rights reserved.
//

#import "SUWelcomeViewC.h"
#import "SUFirstPageViewC.h"
#import "SUSecondPageViewC.h"

@interface SUWelcomeViewC () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollViewC;
@property (nonatomic, strong) UIPageControl *pageControlC;
@property (nonatomic, strong) UIButton *buttonC;
@property (nonatomic, assign) BOOL pageControlBeingUsedC;
@property (nonatomic, strong) SUFirstPageViewC *firstViewC;
@property (nonatomic, strong) SUSecondPageViewC *secondViewC;
@property (nonatomic, copy) NSArray *pagesC;

@end


@implementation SUWelcomeViewC

- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        
        self.buttonC = [[UIButton alloc] init];
        [self.buttonC setTitle:@"Skip" forState:UIControlStateNormal];
        [self.buttonC addTarget:self action:@selector(goNext) forControlEvents:UIControlEventTouchUpInside];
        self.buttonC.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:self.buttonC];
        [self layoutSkipButton];
        
        self.pageControlC = [[UIPageControl alloc] init];
        self.pageControlC.numberOfPages = [@(4) integerValue] /*[self.pages count]*/;
        self.pageControlC.currentPage = 0;
        [self.pageControlC addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventTouchUpInside];
        self.pageControlC.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:self.pageControlC];
        [self layoutPageControl];
        
        self.scrollViewC = [[UIScrollView alloc] init];
        self.scrollViewC.delegate = self;
		self.scrollViewC.backgroundColor = [[UIColor cyanColor] colorWithAlphaComponent:0.6f];
		self.scrollViewC.translatesAutoresizingMaskIntoConstraints = NO;
		[self addSubview:self.scrollViewC];
		[self layoutScrollView];
        
        self.firstViewC   = [[SUFirstPageViewC alloc] init];
        self.firstViewC.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:self.firstViewC];
        [self layoutFirstPage];
        
        self.secondViewC   = [[SUSecondPageViewC alloc] init];
        self.secondViewC.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:self.secondViewC];
        //[self layoutSecondPage];
	}
	return self;
}

#pragma mark - Layout subviews via constraints

- (void)layoutScrollView
{
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(0)-[scrollViewC]-(0)-|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:@{ @"scrollViewC":self.scrollViewC }]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(40)-[scrollViewC]-(40)-|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:@{ @"scrollViewC":self.scrollViewC }]];
}

- (void)layoutSkipButton
{
	[self addConstraint:[NSLayoutConstraint constraintWithItem:self.buttonC
	                                                 attribute:NSLayoutAttributeTrailing
	                                                 relatedBy:NSLayoutRelationEqual
	                                                    toItem:self
	                                                 attribute:NSLayoutAttributeTrailing
	                                                multiplier:1.0f
	                                                  constant:-5.f]];
    
	[self addConstraint:[NSLayoutConstraint constraintWithItem:self.buttonC
	                                                 attribute:NSLayoutAttributeTop
	                                                 relatedBy:NSLayoutRelationEqual
	                                                    toItem:self
	                                                 attribute:NSLayoutAttributeTop
	                                                multiplier:1.0f
	                                                  constant:10.f]];
}

- (void)layoutPageControl
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.pageControlC
	                                                              attribute:NSLayoutAttributeLeading
	                                                              relatedBy:NSLayoutRelationEqual
	                                                                 toItem:self
	                                                              attribute:NSLayoutAttributeLeading
	                                                             multiplier:1.0f
	                                                               constant:0.0f];
    
	[self addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:self.pageControlC
                                              attribute:NSLayoutAttributeTrailing
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self
                                              attribute:NSLayoutAttributeTrailing
                                             multiplier:1.0f
                                               constant:-0.0f];
    
	[self addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:self.pageControlC
                                              attribute:NSLayoutAttributeBottom
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self
                                              attribute:NSLayoutAttributeBottom
                                             multiplier:1.0f
                                               constant:-0.f];
    
	[self addConstraint:constraint];
}

- (void)layoutFirstPage
{
	[self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(40)-[firstViewC]-(40)-|"
	                                                             options:0
	                                                             metrics:nil
	                                                               views:@{ @"firstViewC":self.firstViewC }]];
    
	[self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(80)-[firstViewC]-(80)-|"
	                                                             options:0
	                                                             metrics:nil
	                                                               views:@{ @"firstViewC":self.firstViewC }]];
}

- (void)layoutSecondPage
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.secondViewC
                                                                  attribute:NSLayoutAttributeLeft
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.firstViewC
                                                                  attribute:NSLayoutAttributeRight
                                                                 multiplier:1.0f
                                                                   constant:4.f];
    [self addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:self.secondViewC
                                              attribute:NSLayoutAttributeTrailing
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.scrollViewC
                                              attribute:NSLayoutAttributeTrailing
                                             multiplier:1.0f
                                               constant:40.f];
    [self addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:self.secondViewC
                                              attribute:NSLayoutAttributeTop
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.scrollViewC
                                              attribute:NSLayoutAttributeTop
                                             multiplier:1.0f
                                               constant:20.f];
    
    [self addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:self.secondViewC
                                              attribute:NSLayoutAttributeBottom
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.scrollViewC
                                              attribute:NSLayoutAttributeBottom
                                             multiplier:1.0f
                                               constant:-20.f];
    
    [self addConstraint:constraint];

}

#pragma mark - ScrollView's delegate stuff

- (void)scrollViewDidScroll:(UIScrollView *)sender
{
	if (!self.pageControlBeingUsedC) {
		NSInteger page = round(self.scrollViewC.contentOffset.x / self.scrollViewC.bounds.size.width);
		self.pageControlC.currentPage = page;
	}
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
	self.pageControlBeingUsedC = NO;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
	self.pageControlBeingUsedC = NO;
}


#pragma mark - Action on pageControl pressed

- (void)changePage:(id)sender
{
	if (sender) {
		[self.scrollViewC setContentOffset:CGPointMake(self.bounds.size.width * self.pageControlC.currentPage, 0) animated:YES];
		self.pageControlBeingUsedC = YES;
	}
}

#pragma mark - Delegate stuff

- (void)goNext
{
	if (self.delegate) {
		[self.delegate dismissWelcomeScreen];
	}
}

@end
