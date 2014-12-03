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

#import "replace_this_with_the_class_prefixCustomSplashScreen.h"

@interface replace_this_with_the_class_prefixCustomSplashScreen()
@property (nonatomic, retain) UIActivityIndicatorView *activityIndicator;
@end

@implementation replace_this_with_the_class_prefixCustomSplashScreen

- (id)initWithImage:(UIImage *)image
{
    self.activityIndicatorSize = 35.0;
    self = [super initWithImage:image];
    if (self) {
        [self addSubview:self.activityIndicator];
        self.frame = [UIScreen mainScreen].bounds;
    }
    return self;
}

- (UIActivityIndicatorView *)activityIndicator
{
    if (!_activityIndicator) {
        CGRect frame = CGRectMake(
            self.center.x - self.activityIndicatorSize / 2.0,
            self.center.y - self.activityIndicatorSize / 2.0,
            self.activityIndicatorSize,
            self.activityIndicatorSize
        );
		_activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:frame];
		[_activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
		[_activityIndicator startAnimating];
	}
    return _activityIndicator;
}

- (void) dealloc
{
    self.activityIndicator = nil;
	[super dealloc];
}

@end