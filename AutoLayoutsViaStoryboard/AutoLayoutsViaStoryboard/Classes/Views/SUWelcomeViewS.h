//
//  SUWelcomeViewS.h
//  AutoLayoutsViaStoryboard
//
//  Created by Evgeny Karkan on 07.01.14.
//  Copyright (c) 2014 EvgenyKarkan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SUDismissWelcomeScreenDelegateS <NSObject>

- (void)dismissWelcomeScreen;

@end


@interface SUWelcomeViewS : UIView

@property (nonatomic, weak) IBOutlet UIScrollView *scrollViewS;
@property (nonatomic, weak) IBOutlet UIButton *skipButtonS;
@property (nonatomic, weak) IBOutlet UIPageControl *pageControlS;
@property (nonatomic, weak) id <SUDismissWelcomeScreenDelegateS> delegate;

@end
