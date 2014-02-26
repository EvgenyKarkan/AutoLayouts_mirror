//
//  SUWelcomeView.h
//  AutoLayoutsViaCode
//
//  Created by Evgeniy Karkan on 1/3/14.
//  Copyright (c) 2014 EvgenyKarkan. All rights reserved.
//


@protocol SUDismissWelcomeScreenDelegate <NSObject>

- (void)dismissWelcomeScreen;

@end


@interface SUWelcomeView : UIView

@property (nonatomic, weak) id  <SUDismissWelcomeScreenDelegate> delegate;

@end
