//
//  SUWelcomeView.m
//  AutoLayoutsViaCode
//
//  Created by Evgeniy Karkan on 1/3/14.
//  Copyright (c) 2014 EvgenyKarkan. All rights reserved.
//

#import "SUWelcomeView.h"
#import "SUFirstPageView.h"
#import "SUSecondPageView.h"
#import "SUThirdPageView.h"
#import "SUFourthPageView.h"

@interface SUWelcomeView () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, assign) BOOL pageControlBeingUsed;
@property (nonatomic, strong) SUFirstPageView *firstView;
@property (nonatomic, strong) SUSecondPageView *secondView;
@property (nonatomic, strong) SUThirdPageView *thirdView;
@property (nonatomic, strong) SUFourthPageView *fourthView;
@property (nonatomic, copy) NSArray *pages;

@end


@implementation SUWelcomeView;

- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
    
	if (self) {
		self.backgroundColor = [UIColor lightGrayColor];
		[self createSubViews];
	}
    
	return self;
}

- (void)createSubViews
{
	self.scrollView  = [[UIScrollView alloc] init];
	self.scrollView.backgroundColor = [[UIColor cyanColor] colorWithAlphaComponent:0.6f];
	self.scrollView.delegate = self;
	self.scrollView.showsHorizontalScrollIndicator = NO;
	self.scrollView.pagingEnabled = YES;
	[self addSubview:self.scrollView];
    
	self.firstView   = [[SUFirstPageView alloc] init];
	[self.scrollView addSubview:self.firstView];
    
	self.secondView  = [[SUSecondPageView alloc] init];
	[self.scrollView addSubview:self.secondView];
    
	self.thirdView   = [[SUThirdPageView alloc] init];
	[self.scrollView addSubview:self.thirdView];
    
	self.fourthView  = [[SUFourthPageView alloc] init];
	[self.scrollView addSubview:self.fourthView];
    
	self.pageControl = [[UIPageControl alloc] init];
    self.pages = @[self.firstView, self.secondView, self.thirdView, self.fourthView];
	self.pageControl.numberOfPages = [self.pages count];
	self.pageControl.currentPage = 0;
	[self.pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventTouchUpInside];
	[self addSubview:self.pageControl];
    
	self.button = [[UIButton alloc] init];
	[self.button setTitle:@"Skip" forState:UIControlStateNormal];
	[self.button addTarget:self action:@selector(goNext) forControlEvents:UIControlEventTouchUpInside];
	[self addSubview:self.button];
    
    //Listening to UIDevice notification
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(deviceOrientationDidChange:)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil];
}

#pragma mark - Layout subviews stuff

- (void)layoutSubviews
{
	[super layoutSubviews];
    
	self.scrollView.frame = CGRectMake(0.0f, self.frame.origin.y + 40.0f, self.bounds.size.width, self.bounds.size.height - 90.0f);
	self.scrollView.contentSize = CGSizeMake(self.bounds.size.width * [self.pages count], self.scrollView.bounds.size.height);
	self.scrollView.contentOffset = CGPointMake(self.bounds.size.width * self.pageControl.currentPage, 0);
    
	self.pageControl.frame = CGRectMake(self.bounds.origin.x, self.bounds.size.height - 45.0f, self.bounds.size.width, 40.0f);
    
	for (NSUInteger i = 0; i < [self.pages count]; i++) {
		[[[self.scrollView subviews] objectAtIndex:i] setFrame:CGRectMake(40.0f + (i * self.bounds.size.width), 40.0f,
		                                                                  self.bounds.size.width - 80.0f, self.bounds.size.height - 170.0f)];
	}
    
	self.button.frame = CGRectMake(self.bounds.size.width - 50.0f, 15.0f, 50.0f, 20.0f);
}

#pragma mark - ScrollView's delegate stuff

- (void)scrollViewDidScroll:(UIScrollView *)sender
{
	if (!self.pageControlBeingUsed) {
		NSInteger page = round(self.scrollView.contentOffset.x / self.scrollView.bounds.size.width);
		self.pageControl.currentPage = page;
	}
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
	self.pageControlBeingUsed = NO;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
	self.pageControlBeingUsed = NO;
}

#pragma mark - Action on pageControl pressed

- (void)changePage:(id)sender
{
	if (sender) {
		[self.scrollView setContentOffset:CGPointMake(self.bounds.size.width * self.pageControl.currentPage, 0)
		                         animated:YES];
		self.pageControlBeingUsed = YES;
	}
}

#pragma mark - Delegate stuff

- (void)goNext
{
	if (self.delegate) {
		[self.delegate dismissWelcomeScreen];
	}
}

#pragma mark - Orientation change notification listeting

- (void)deviceOrientationDidChange:(NSNotification *)notification
{
	[self performSelector:@selector(handleOrientationChange:)
	           withObject:@([[UIDevice currentDevice] orientation])
	           afterDelay:0];
}

- (void)handleOrientationChange:(id)orientationType
{
	NSLog(@"Orientation is --> %@ now!", orientationType);
}

@end
