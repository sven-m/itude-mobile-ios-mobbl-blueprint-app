//
//  CustomSplashScreen.m
//  Binck
//
//  Created by Frank van Eenbergen on 8/8/11.
//  Copyright 2010 Itude Mobile BV. All rights reserved.
//

#import "CustomSplashScreen.h"


#define SPLASHSCREENACTIVITYINDICATORSIZE 35

@implementation CustomSplashScreen

@synthesize splashScreenImageView = _splashScreenImageView;
@synthesize activityIndicator = _activityIndicator;

- (void) dealloc
{
	[_splashScreenImageView release];
	[_activityIndicator release];
	[super dealloc];
}

// Show a splashscreen that can be shown to the user so it does not look like the app is dead if the network takes a long time to load everyting.
- (void) show {
	NSString *splashScreenImageName = @"LaunchImage.png";
	CGRect splashScreenImageViewFrame = self.frame;

    
	if (self.splashScreenImageView == nil) {
        self.splashScreenImageView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:splashScreenImageName]] autorelease];
    }
    
	self.splashScreenImageView.frame = splashScreenImageViewFrame;
	[self addSubview:self.splashScreenImageView];
	
    
	// Create the Activity/spinning wheel
    CGRect frame = CGRectMake((self.frame.size.width - SPLASHSCREENACTIVITYINDICATORSIZE) / 2, 
                              (((self.frame.size.height - SPLASHSCREENACTIVITYINDICATORSIZE)/3)*2), 
                              SPLASHSCREENACTIVITYINDICATORSIZE, 
                              SPLASHSCREENACTIVITYINDICATORSIZE);
    if (self.activityIndicator == nil) {
		self.activityIndicator = [[[UIActivityIndicatorView alloc] initWithFrame:frame] autorelease];
		[self.activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
		[self.activityIndicator startAnimating];
	}
    
	[self addSubview:self.activityIndicator];
     
}

- (void) hide {
	if (self.splashScreenImageView != nil){
        //[self.splashScreenImageView removeFromSuperview];
    }
	if (self.activityIndicator != nil) {
        [self.activityIndicator removeFromSuperview];
    }
	//self.splashScreenImageView = nil;
	self.activityIndicator = nil;
    
    //[self removeFromSuperview];
}

@end
