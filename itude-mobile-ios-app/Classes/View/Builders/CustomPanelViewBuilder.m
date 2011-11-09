//
//  CustomPanelViewBuilder.m
//  itude-mobile-ios-app
//
//  Created by Ricardo de Wilde on 7/28/11.
//  Copyright 2011 Itude Mobile. All rights reserved.
//

#import "CustomPanelViewBuilder.h"
//#import "CustomTableViewController.h"
#import "MBPanelViewBuilder.h"
#import "MBStyleHandler.h"
#import "MBPanelViewBuilder.h"
#import "MBPanel.h"
#import "MBFieldTypes.h"

@implementation CustomPanelViewBuilder


//-(MBTableViewController *) createTableViewController:(MBPanel *) panel {
//	return [[[CustomTableViewController alloc] initWithStyle:UITableViewStyleGrouped] autorelease];
//}


- (UIView *)buildListPanel:(MBPanel *)panel withMaxBounds:(CGRect)bounds {
    return [super buildListPanel:panel withMaxBounds:bounds];
    
}

@end
