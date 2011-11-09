//
//  CustomFieldViewBuilder.m
//  itude-mobile-ios-app
//
//  Created by Ricardo de Wilde on 7/28/11.
//  Copyright 2011 Itude Mobile. All rights reserved.
//

#import "CustomFieldViewBuilder.h"
#import "MBMacros.h"
#import "MBField.h"

@implementation CustomFieldViewBuilder

-(UIView*) buildFieldView:(MBField*) field withMaxBounds:(CGRect) bounds {
	UIView *view = nil;  
	
	if([@"INFO" isEqualToString: field.type]){

    }
	else {
		WLog(@"Failed to build unsupported view type %@", field.type);
    }
	
	field.responder = view;
	
	return view;
}

@end
