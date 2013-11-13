//
//  CustomSplashScreen.h
//  Binck
//
//  Created by Frank van Eenbergen on 8/8/11.
//  Copyright 2010 Itude Mobile BV. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CustomSplashScreen : UIView {
	UIImageView *_splashScreenImageView;
	UIActivityIndicatorView *_activityIndicator; 
}

@property (nonatomic, retain) UIImageView *splashScreenImageView;
@property (nonatomic, retain) UIActivityIndicatorView *activityIndicator;

- (void) show;
- (void) hide;

@end
