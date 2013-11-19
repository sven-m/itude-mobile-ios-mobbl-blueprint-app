/*
 * (C) Copyright Itude Mobile B.V., The Netherlands.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

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
