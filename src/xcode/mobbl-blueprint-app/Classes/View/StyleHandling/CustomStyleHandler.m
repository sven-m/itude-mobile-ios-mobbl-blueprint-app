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

#import "CustomStyleHandler.h"
#import "CustomStyleConstants.h"
#import "CustomColor.h"

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
