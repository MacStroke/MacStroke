//
//  CanvasView.h
//  MouseGesture
//
//  Created by keakon on 11-11-14.
//  Copyright (c) 2011年 keakon.net. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CanvasView : NSView {
    NSColor *color;
    NSPoint lastLocation;
    NSUInteger radius;
    NSMutableArray *points; // NSPoint array
//    NSString *directionToDraw;
    NSInteger actionRuleIndex;
}

- (void)clear;

- (void)resizeTo:(NSRect)frame;

- (void)setEnable:(BOOL)shouldEnable;

//- (void)writeDirection:(NSString *)directionStr;

- (void)writeActionRuleIndex:(NSInteger )Index;

@end
