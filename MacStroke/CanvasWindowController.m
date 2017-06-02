//
//  CanvasWindowController.m
//  MouseGesture
//
//  Created by keakon on 11-11-18.
//  Copyright (c) 2011年 keakon.net. All rights reserved.
//

#import "CanvasWindowController.h"
#import "CanvasWindow.h"
#import "CanvasView.h"
#import "RulesList.h"

@implementation CanvasWindowController

- (void)reinitWindow {
    NSRect frame = NSScreen.mainScreen.frame;
    //NSLog(@"%@",NSScreen.screens.firstObject.frame);
    //NSPoint mouseLoc;
    //mouseLoc = [NSEvent mouseLocation]; //get current mouse position
    //NSLog(@"Mouse location: %f %f", mouseLoc.x, mouseLoc.y);
    NSWindow *window = [[CanvasWindow alloc] initWithContentRect:frame];
    NSView *view = [[CanvasView alloc] initWithFrame:frame];
    window.contentView = view;
    window.level = CGShieldingWindowLevel();

    window.collectionBehavior = NSWindowCollectionBehaviorCanJoinAllSpaces;
    self.window = window;
    [window orderFront:self];
}

- (id)init {
    self = [super init];
    if (self) {
        [self reinitWindow];

        [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(handleScreenParametersChange:) name:NSApplicationDidChangeScreenParametersNotification object:nil];
    }
    return self;
}

- (BOOL)enable {
    return enable;
}

- (void)setEnable:(BOOL)shouldEnable {
    enable = shouldEnable;
    if (shouldEnable) {
        [self.window orderFront:self];
    } else {
        [self.window orderOut:self];
    }
    [self.window.contentView setEnable:shouldEnable];
}

- (void)handleMouseEvent:(NSEvent *)event {
    switch (event.type) {
        case NSRightMouseDown:
            [self.window.contentView mouseDown:event];
            break;
        case NSRightMouseDragged:
            [self.window.contentView mouseDragged:event];
            break;
        case NSRightMouseUp:
            [self.window.contentView mouseUp:event];
            break;
        default:
            break;
    }
}

- (void)handleScreenParametersChange:(NSNotification *)notification {
    NSRect frame = NSScreen.mainScreen.frame;
    [self.window setFrame:frame display:NO];
    [self.window.contentView resizeTo:frame];
}

//- (void)writeDirection:(NSString *)directionStr; {
//    [self.window.contentView writeDirection:directionStr];
//}

- (void)writeActionRuleIndex:(NSInteger)actionRuleIndex; {
    [self.window.contentView writeActionRuleIndex:actionRuleIndex];
}

@end
