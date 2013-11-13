//
//  PilserviceAppDelegate.h
//  itude-mobile-ios-app
//
//  Created by Ricardo de Wilde on 7/8/11.
//  Copyright 2011 Itude Mobile. All rights reserved.
//

#import "MBApplicationController.h"
#import "CustomSplashScreen.h"

@interface CustomAppDelegate : MBApplicationController <UIApplicationDelegate, UIAlertViewDelegate> {
    
	UIWindow *_window;
    CustomSplashScreen *_splashScreen;
    BOOL _handlingNotification;
    
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) CustomSplashScreen *splashScreen;

-(void)initializeApplicationProperties;

@end
