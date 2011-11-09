//
//  FireInitialOutcomes.m
//  itude-mobile-ios-app
//
//  Created by Ricardo de Wilde on 7/15/11.
//  Copyright 2011 Itude Mobile. All rights reserved.
//

#import "FireInitialOutcomes.h"
#import "MBOutcome.h"
#import "MBDocument.h"
#import "MBDataManagerService.h"
#import "MBApplicationController.h"

@implementation FireInitialOutcomes

-(MBOutcome*) execute:(MBDocument *)document withPath:(NSString *)path {
    
	NSString *firstDialog = nil;
	MBDocument *initialOutcomes = [[MBDataManagerService sharedInstance] loadDocument:@"InitialOutcomes"];
	for(MBElement *element in [initialOutcomes valueForPath:@"/Outcome"]) {
        
		MBOutcome *oc = [[[MBOutcome alloc] init] autorelease];
		oc.outcomeName = [element valueForPath:@"@action"];
		oc.dialogName = [element valueForPath:@"@dialog"];
		oc.noBackgroundProcessing = TRUE;
		oc.transferDocument = FALSE;
		
		if(firstDialog == nil) firstDialog = oc.dialogName;
        
		[self performSelectorOnMainThread:@selector(handleOutcomeOnMainThread:) withObject:oc waitUntilDone:TRUE];
	}
    
	[self performSelectorOnMainThread:@selector(activateDialogWithName:) withObject:firstDialog waitUntilDone:TRUE];
    
	return nil;
}

-(void) handleOutcomeOnMainThread:(MBOutcome*) outcome {
	MBApplicationController *controller = [MBApplicationController currentInstance];
	[controller handleOutcome:outcome];
}

-(void) activateDialogWithName:(NSString*) name {
	MBApplicationController *controller = [MBApplicationController currentInstance];
	[controller activateDialogWithName:name];
}

@end