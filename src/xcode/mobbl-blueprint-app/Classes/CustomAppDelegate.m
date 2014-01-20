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

#import "CustomAppDelegate.h"

// Custom imports
#import "CustomApplicationFactory.h"
#import "CustomStyleHandler.h"
#import "CustomStyleConstants.h"
#import "CustomSoapServiceDataHandler.h"

#define kAlertViewTakePill 1
#define kAlertViewForgotPill 2

@implementation CustomAppDelegate


@synthesize window = _window;
@synthesize splashScreen = _splashScreen;

-(void) startController {
	
	NSAutoreleasePool *pool = [NSAutoreleasePool new];
	
	// Uncomment this in development/test mode to get the stacktrace on-screen
	//InstallUncaughtExceptionHandler();
    
    // Set custom stylehandling
    [[MBViewBuilderFactory sharedInstance] setStyleHandler:[[CustomStyleHandler new] autorelease]];
	
	// set the Custom datahandlers
    [[MBDataManagerService sharedInstance] registerDataHandler:[[CustomSoapServiceDataHandler new] autorelease] withName:@"CustomSoapServiceDataHandler"];

    
	// Delete any cached documents at startup
	[MBCacheManager expireAllDocuments];
	
    CustomApplicationFactory *pilserviceFactory = [[CustomApplicationFactory alloc] init];
    
    [MBApplicationFactory setSharedInstance:pilserviceFactory];
    
    [self initializeApplicationProperties];
    
	[self performSelectorOnMainThread:@selector(startApplication:) withObject:pilserviceFactory waitUntilDone:YES];
    
	[pool drain];
    
}

- (void)startApplication:(MBApplicationFactory *)_applicationFactory {
    // Start the application
    [super startApplication:_applicationFactory];
    
    // We want to remove the splash-screen image, because it takes up memory and we don't need it anymore
	[self.splashScreen hide];

    // For now...
    //[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

-(void)initializeApplicationProperties {
    MBDocument *_applicationStateDoc = [[MBDataManagerService sharedInstance] loadDocument: @"ApplicationState"];
    if ([[_applicationStateDoc valueForPath:@"/Device[0]/@deviceID"] length] < 1) {
        NSString *identifier = [[UIDevice currentDevice] uniqueIdentifier];

        //remove all notifications
        [[UIApplication sharedApplication] cancelAllLocalNotifications];
        
#if TARGET_IPHONE_SIMULATOR
        identifier = @"iPhone_simulator"; 
        //identifier = @"legegebruiker2"; 
#endif
      
        [_applicationStateDoc setValue:identifier forPath:@"/Device[0]/@deviceID"];

    }
    if ([[_applicationStateDoc valueForPath:@"/Device[0]/@deviceType"] length] < 1) {
        [_applicationStateDoc setValue:@"1" forPath:@"/Device[0]/@deviceType"];
    }
    [[MBDataManagerService sharedInstance] storeDocument:_applicationStateDoc];
}

// support 3.x
-(void) applicationDidFinishLaunching:(UIApplication *)application {
	[self application:application didFinishLaunchingWithOptions:nil];
}

// for 4.x
- (BOOL) application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    // start startup sequence in background 
	[self performSelectorInBackground:@selector(startController) withObject:nil];
	//[self startController];
    
	self.window = [[[UIWindow alloc] initWithFrame: [[UIScreen mainScreen]bounds]] autorelease];
	
    // Add a backgroundImage, so that when the app is waiting for something, there is a proper background to be displayed
	NSString *backgroundImageName = [CustomStyleConstants getFilenameForItem:@"Background"];
	UIImageView *bgImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:backgroundImageName]];
	bgImage.opaque = YES;
	[self.window addSubview:bgImage];
	[self.window sendSubviewToBack:bgImage];
    
    [bgImage release];
    
    // Show something on screen so user doesnt think the app is dead if the network takes a long time.
	self.splashScreen = [[[CustomSplashScreen alloc] initWithFrame:self.window.frame] autorelease];
	[self.window addSubview:self.splashScreen];
	[self.splashScreen show];
    
    // Hide the networkActivitiyIndicator, in case it's still running
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
	[self.window makeKeyAndVisible];
	
	return YES;
}



- (void)dealloc
{
    [_window release];
    [super dealloc];
}

@end
