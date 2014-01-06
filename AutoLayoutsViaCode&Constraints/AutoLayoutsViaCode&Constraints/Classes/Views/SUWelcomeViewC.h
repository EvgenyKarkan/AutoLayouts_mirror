//
//  SUWelcomeView.h
//  AutoLayoutsViaCode&Constraints
//
//  Created by Evgeniy Karkan on 1/6/14.
//  Copyright (c) 2014 EvgenyKarkan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SUDismissWelcomeScreenDelegate <NSObject>

- (void)dismissWelcomeScreen;

@end


@interface SUWelcomeViewC : UIView

@property (nonatomic, weak) id  <SUDismissWelcomeScreenDelegate> delegate;

@end
