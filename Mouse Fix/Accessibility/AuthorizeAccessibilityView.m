//
// --------------------------------------------------------------------------
// AuthorizeAccessibilityView.m
// Created for: Mac Mouse Fix (https://github.com/noah-nuebling/mac-mouse-fix)
// Created by: Noah Nuebling in 2019
// Licensed under MIT
// --------------------------------------------------------------------------
//

#import "../PrefPaneDelegate.h"
#import "AuthorizeAccessibilityView.h"
#import "../MessagePort/MessagePort_PrefPane.h"
#import "../HelperServices/HelperServices.h"

@interface AuthorizeAccessibilityView ()

@end

@implementation AuthorizeAccessibilityView

AuthorizeAccessibilityView *_accViewController;

+ (void)load {
//    [self performSelector:@selector(addAccViewToWindow) withObject:NULL afterDelay:0.5];
//    [self performSelector:@selector(removeAccViewFromWindow) withObject:NULL afterDelay:3];
    
    
//    NSArray *windows = NSApplication.sharedApplication.windows;
//    NSWindow *prefWindow;
//    for (NSWindow *w in windows) {
//        if ([w.className isEqualToString:@"NSPrefWindow"]) {
//            prefWindow = w;
//        }
//    }
//
//    NSView *accView;
//    for (NSView *v in prefWindow.contentView.subviews) {
//        if ([v.identifier isEqualToString:@"accView"]) {
//            accView = v;
//        }
//    }
//
//    _accViewController = [[AuthorizeAccessibilityView alloc] initWithNibName:@"AuthorizeAccessibilityView" bundle:[NSBundle bundleForClass:[self class]]];
//    accView = _accViewController.view;
//    [prefWindow.contentView addSubview:accView];
//
//    accView.hidden = YES;
//
//    NSLog(@"subviews: %@", prefWindow.contentView.subviews);
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)AuthorizeButton:(NSButton *)sender {
    
    NSLog(@"AuthorizeButton clicked");
    
    CGSize size = CGSizeMake(16, 16);
    NSRect centeredRect = NSMakeRect((self.view.frame.size.width / 2.0) - (size.width/2.0), (self.view.frame.size.height / 2.0) - (size.height/2.0), size.width, size.height);
    NSProgressIndicator* indicator = [[NSProgressIndicator alloc] initWithFrame:centeredRect];
    [indicator setStyle:NSProgressIndicatorSpinningStyle];
    
    self.view.subviews = @[];
    [self.view addSubview:indicator];
    
    [indicator display];
    [indicator startAnimation:NULL];
    
    NSString* urlString = @"x-apple.systempreferences:com.apple.preference.security?Privacy_Accessibility";
    [NSWorkspace.sharedWorkspace openURL:[NSURL URLWithString:urlString]];
}

+ (void)add {
    
    NSLog(@"adding AuthorizeAccessibilityView");
    
    NSView *mainView = PrefPaneDelegate.mainView;
    
    NSView *baseView;
    for (NSView *v in mainView.subviews) {
        if ([v.identifier isEqualToString:@"baseView"]) {
            baseView = v;
        }
    }
    NSView *accView;
    for (NSView *v in mainView.subviews) {
        if ([v.identifier isEqualToString:@"accView"]) {
            accView = v;
        }
    }
    if (accView == NULL) {
        _accViewController = [[AuthorizeAccessibilityView alloc] initWithNibName:@"AuthorizeAccessibilityView" bundle:[NSBundle bundleForClass:[self class]]];
        accView = _accViewController.view;
        [mainView addSubview:accView];
        accView.alphaValue = 0;
        accView.hidden = YES;
    }
    baseView.animator.alphaValue = 0;
    baseView.hidden = YES;
    accView.animator.alphaValue = 1;
    accView.hidden = NO;
}

+ (void)remove {
    
    NSLog(@"removing AuthorizeAccessibilityView");
    
    NSView *mainView = PrefPaneDelegate.mainView;
    
    NSView *baseView;
    for (NSView *v in mainView.subviews) {
        if ([v.identifier isEqualToString:@"baseView"]) {
            baseView = v;
        }
    }
    NSView *accView;
    for (NSView *v in mainView.subviews) {
        if ([v.identifier isEqualToString:@"accView"]) {
            accView = v;
        }
    }
    if (accView) {
        [accView removeFromSuperview];
    }

    baseView.animator.alphaValue = 1;
    baseView.hidden = NO;
    accView.animator.alphaValue = 0;
    accView.hidden = YES;
    
}

@end
