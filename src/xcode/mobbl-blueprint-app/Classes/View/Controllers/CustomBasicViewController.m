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
