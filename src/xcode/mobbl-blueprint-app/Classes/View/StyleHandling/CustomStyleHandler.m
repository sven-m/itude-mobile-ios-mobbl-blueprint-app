//
//  CustomStyleHandler.m
//  itude-mobile-ios-app
//
//  Created by Frank van Eenbergen on 7/20/11.
//  Copyright 2011 Itude Mobile. All rights reserved.
//

#import "CustomStyleHandler.h"
#import "CustomStyleConstants.h"
#import "CustomColor.h"

#import "MBFieldTypes.h"
#import "MBPanel.h"

@implementation CustomStyleHandler

- (void) applyStyle:(UIView *)contentView page:(MBPage *)page viewState:(MBViewState)viewState {
    
    // Set a simple background Image
	NSString *backgroundImageName = [CustomStyleConstants getFilenameForItem:@"Background"];
	UIImageView *bgImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:backgroundImageName]];
	bgImage.opaque = YES;
	[contentView addSubview:bgImage];
	[contentView sendSubviewToBack:bgImage];
	
    
	[bgImage release];
}





- (void) styleNavigationBar:(UINavigationBar *)bar {
	bar.tintColor = [CustomStyleConstants getColor:CUSTOMNAVIGATIONBARCOLOR];
}

- (void)styleToolbar:(UIToolbar *)toolbar {
    toolbar.tintColor = [CustomStyleConstants getColor:CUSTOMTOOLBARCOLOR];
}


// Override to customize insets for a component (panel/tableview)
- (void) applyInsetsForComponent:(MBComponent *) component{
	[super applyInsetsForComponent:component];
    
//	if ([component isKindOfClass:[MBPanel class]]) {
//		if ([[(MBPanel *) component type] isEqualToString:@"MATRIX"]||
//			[[(MBPanel *) component type] isEqualToString:@"LIST"]) {
//			component.leftInset = 0;
//			component.rightInset = 0;
//			component.bottomInset = 0;
//			component.topInset = 0;
//		}
//	}
}

@end
