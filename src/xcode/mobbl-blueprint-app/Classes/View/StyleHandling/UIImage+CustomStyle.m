//
//  UIImage+CustomStyle.m
//  mobbl-blueprint-app
//
//  Created by Emiel Bon on 18-09-14.
//  Copyright (c) 2014 Itude Mobile B.V., The Netherlands. All rights reserved.
//

#import "UIImage+CustomStyle.h"

@implementation UIImage (CustomStyle)

+ (UIImage *) imageNamed:(NSString *)name forStyleScheme:(NSString *)styleScheme
{
    NSAssert(styleScheme, @"Error: Style scheme parameter is nil");
    // Build and return the filename (e.g. styleScheme-item)
    return [UIImage imageNamed:[NSString stringWithFormat: @"%@-%@.png", name, styleScheme]];
}

@end
