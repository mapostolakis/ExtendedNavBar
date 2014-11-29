## Extending the Navigation Bar on iOS7+

On iOS 7 we get new ways for customizing the `UINavigationBar`. Apple has shared [a sample project](https://developer.apple.com/library/ios/samplecode/navbar/Introduction/Intro.html) showing how you can change the appearance of the navigation bar by setting a custom back button, right view, title, background color and how to make a cool effect that makes the bar seem extended allowing us to attach other views, such as a label.

[This sample project](https://github.com/mapostolakis/ExtendedNavBar) shows how you can embed a segmented control inside the navigation bar (as seen on the App Store app). Contrary to Apple's project, this one doesn't use AutoLayout and the view loads from a nib.

![sample_app](http://static.squarespace.com/static/525ab19be4b0107b33091d5b/t/547a4883e4b09b5c2136cc3f/1417300129107/extended_navbar_sample_app.png?format=1500w)

### Implementation

It is important to embed the view you would like to *extend* the nav bar, by placing it inside a generic view (ExtendedView), which can be used for drawing a one pixel hairline.

![view_hierarchy](http://static.squarespace.com/static/525ab19be4b0107b33091d5b/t/547a4839e4b053a861c4bbb6/1417300026482/extended_nav_bar_view_hierarchy.png?format=1500w)

Finally the navigation bar doesn't actually get extended, rather it gives this impression by replacing the hairline with a transparent image.

#### Extended View

	- (void)willMoveToWindow:(UIWindow *)newWindow
	{
	    // Use the layer shadow to draw a one pixel hairline under this view.
	    [self.layer setShadowOffset:CGSizeMake(0, 1.0f/UIScreen.mainScreen.scale)];
	    [self.layer setShadowRadius:0];
	    [self.layer setShadowColor:[UIColor blackColor].CGColor];
	    [self.layer setShadowOpacity:0.25f];
	}

#### Navigation Bar Setup

	[self.navigationController.navigationBar setTranslucent:NO];
	[self.navigationController.navigationBar setShadowImage:[UIImage imageNamed:@"TransparentPixel"]];
	[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Pixel"] forBarMetrics:UIBarMetricsDefault];