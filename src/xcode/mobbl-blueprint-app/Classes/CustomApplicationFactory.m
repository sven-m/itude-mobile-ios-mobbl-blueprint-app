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

#import "CustomApplicationFactory.h"

// Framework imports
#import "MBPage.h"

// Controllers
//#import "ExampleViewController.h"


// Actions
#import "FireInitialOutcomes.h"
#import "CustomTemporaryAction.h"


@implementation CustomApplicationFactory

-(id<MBResultListener>) createResultListener:(NSString *)listenerClassName {
	return nil;
}

-(id<MBAction>) createAction:(NSString *)actionClassName {
	if ([actionClassName isEqualToString:@"FireInitialOutcomes"]) {
		return [[FireInitialOutcomes new] autorelease];
	}
    
    else if ([actionClassName isEqualToString:@"CustomTemporaryAction"]) {
        return [[CustomTemporaryAction new] autorelease];
    }
    
	return nil;
}

-(MBPage *) createPage:(MBPageDefinition *)definition 
			  document:(MBDocument*) document 
			  rootPath:(NSString*) rootPath 
			 viewState:(MBViewState) viewState 
		 withMaxBounds:(CGRect) bounds {
    

    // Home page (example)
    if([@"PAGE-home" isEqualToString:definition.name]) {
//		ExampleViewController *myViewController = [[[ExampleViewController alloc] init] autorelease];
//		MBPage *page = [[[MBPage alloc] initWithDefinition:definition withViewController:myViewController document:document rootPath:rootPath viewState: viewState]autorelease];
//		return page;
	}
     
    
    return [super createPage:definition document:document rootPath:rootPath viewState: viewState withMaxBounds: bounds];
}


@end
