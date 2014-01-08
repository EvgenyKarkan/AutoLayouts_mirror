//
//  SUViewController.m
//  AutoLayoutsViaStoryboard
//
//  Created by Evgeniy Karkan on 1/3/14.
//  Copyright (c) 2014 EvgenyKarkan. All rights reserved.
//

#import "SUViewControllerS.h"
#import "SUWelcomeViewS.h"

@interface SUViewControllerS () <UIScrollViewDelegate>

@property (nonatomic, strong) IBOutlet SUWelcomeViewS *welcomeViewS;
@property (nonatomic, assign) BOOL pageControlBeingUsedS;
@end


@implementation SUViewControllerS;

#pragma mark - Life cycle

- (void)viewDidLoad
{
	[super viewDidLoad];
    
    self.welcomeViewS.scrollViewS.contentSize = CGSizeMake(self.welcomeViewS.bounds.size.width * 4, self.welcomeViewS.scrollViewS.bounds.size.height);
//    self.welcomeViewS.scrollViewS.contentOffset = CGPointMake(self.welcomeViewS.bounds.size.width * self.welcomeViewS.pageControlS.currentPage, 0);
	self.welcomeViewS.scrollViewS.delegate = self;
	self.welcomeViewS.pageControlS.currentPage = 0;
    
    [self.welcomeViewS.skipButtonS addTarget:self
                                      action:@selector(skipPressed:)
                            forControlEvents:UIControlEventTouchUpInside];
    
    [self.welcomeViewS.pageControlS addTarget:self
                                       action:@selector(pageControlPressed:)
                             forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Actions

- (IBAction)skipPressed:(UIButton *)sender
{
    NSLog(@"%d %s",__LINE__, __PRETTY_FUNCTION__);
}

- (IBAction)pageControlPressed:(UIPageControl *)sender
{
    if (sender) {
        [self.welcomeViewS.scrollViewS setContentOffset:CGPointMake(self.welcomeViewS.bounds.size.width * self.welcomeViewS.pageControlS.currentPage, 0)
                                               animated:YES];
        self.pageControlBeingUsedS = YES;
	}
}

#pragma mark - Scrollview delegate

- (void)scrollViewDidScroll:(UIScrollView *)sender
{
	if (!self.pageControlBeingUsedS) {
		NSInteger page = round(self.welcomeViewS.scrollViewS.contentOffset.x / self.welcomeViewS.scrollViewS.bounds.size.width);
		self.welcomeViewS.pageControlS.currentPage = page;
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

#pragma mark - Rotation


@end
