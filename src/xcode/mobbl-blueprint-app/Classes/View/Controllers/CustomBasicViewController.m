//
//  CustomBasicViewController.m
//  itude-mobile-ios-app
//
//  Created by Frank van Eenbergen on 7/20/11.
//  Copyright 2011 Itude Mobile. All rights reserved.
//

#import "CustomBasicViewController.h"
#import "MBPage.h"
#import "MBViewBuilderFactory.h"
#import "MBStyleHandler.h"

@implementation CustomBasicViewController

-(void) applyStyle {	
	[[[MBViewBuilderFactory sharedInstance] styleHandler] applyStyle:self.view page:self.page viewState: self.page.currentViewState];
}

-(NSString*) title {
	return self.page.title;
}

@end
