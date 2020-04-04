//
// --------------------------------------------------------------------------
// ScrollOverride.h
// Created for Mac Mouse Fix (https://github.com/noah-nuebling/mac-mouse-fix)
// Created by Noah Nuebling in 2020
// Licensed under MIT
// --------------------------------------------------------------------------
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface ScrollOverridePanel : NSWindowController <NSTableViewDataSource, NSTableViewDelegate>
- (void)display;
- (void)bringToFront;
@end

NS_ASSUME_NONNULL_END