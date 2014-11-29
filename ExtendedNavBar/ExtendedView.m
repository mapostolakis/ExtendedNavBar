//
//  ExtendedView.m
//  ExtendedNavBar
//
//  Created by Michail-Georgios Apostolakis on 09/11/2014.
//  Copyright (c) 2014 Michail-Georgios Apostolakis. All rights reserved.
//

#import "ExtendedView.h"

@implementation ExtendedView

- (void)willMoveToWindow:(UIWindow *)newWindow
{
    // Use the layer shadow to draw a one pixel hairline under this view.
    [self.layer setShadowOffset:CGSizeMake(0, 1.0f/UIScreen.mainScreen.scale)];
    [self.layer setShadowRadius:0];
    [self.layer setShadowColor:[UIColor blackColor].CGColor];
    [self.layer setShadowOpacity:0.25f];
}

@end
