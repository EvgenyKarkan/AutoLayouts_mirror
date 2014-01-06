//
//  SUWelcomeView.m
//  AutoLayoutsViaCode&Constraints
//
//  Created by Evgeniy Karkan on 1/6/14.
//  Copyright (c) 2014 EvgenyKarkan. All rights reserved.
//

#import "SUWelcomeViewC.h"

@interface SUWelcomeViewC ()

@property (nonatomic, strong) UIScrollView *scrollViewC;
@property (nonatomic, strong) UIPageControl *pageControlC;
@property (nonatomic, strong) UIButton *buttonC;
@property (nonatomic, assign) BOOL pageControlBeingUsedC;
@property (nonatomic, copy) NSArray *pagesC;

@end


@implementation SUWelcomeViewC

- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        
		self.scrollViewC = [[UIScrollView alloc] init];
		self.scrollViewC.backgroundColor = [[UIColor cyanColor] colorWithAlphaComponent:0.6f];
		self.scrollViewC.translatesAutoresizingMaskIntoConstraints = NO;
		[self addSubview:self.scrollViewC];
		[self layoutScrollView];
        
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
	}
	return self;
}

#pragma mark - Layout subviews via constraints

- (void)layoutScrollView
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.scrollViewC
                                                                  attribute:NSLayoutAttributeLeading
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self
                                                                  attribute:NSLayoutAttributeLeading
                                                                 multiplier:1.0f
                                                                   constant:0.f];
    [self addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:self.scrollViewC
                                              attribute:NSLayoutAttributeTop
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self
                                              attribute:NSLayoutAttributeTop
                                             multiplier:1.0f
                                               constant:40.f];
    
    [self addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:self.scrollViewC
                                              attribute:NSLayoutAttributeTrailing
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self
                                              attribute:NSLayoutAttributeTrailing
                                             multiplier:1.0f
                                               constant:0.0f];
    [self addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:self.scrollViewC
                                              attribute:NSLayoutAttributeBottom
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self
                                              attribute:NSLayoutAttributeBottom
                                             multiplier:1.0f
                                               constant:-40.f];
    
    [self addConstraint:constraint];
}

- (void)layoutSkipButton
{
	NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.buttonC
	                                                              attribute:NSLayoutAttributeTrailing
	                                                              relatedBy:NSLayoutRelationEqual
	                                                                 toItem:self
	                                                              attribute:NSLayoutAttributeTrailing
	                                                             multiplier:1.0f
	                                                               constant:-5.f];
    
	[self addConstraint:constraint];
    
	constraint = [NSLayoutConstraint constraintWithItem:self.buttonC
	                                          attribute:NSLayoutAttributeTop
	                                          relatedBy:NSLayoutRelationEqual
	                                             toItem:self
	                                          attribute:NSLayoutAttributeTop
	                                         multiplier:1.0f
	                                           constant:10.f];
    
	[self addConstraint:constraint];
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
