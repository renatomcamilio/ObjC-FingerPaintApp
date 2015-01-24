//
//  DrawView.m
//  FingerPaintApp
//
//  Created by Renato Camilio on 1/23/15.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import "DrawView.h"


@interface DrawView ()

@property (nonatomic, strong) UIColor *strokeColor;

@end

@implementation DrawView

- (void)drawRect:(CGRect)rect {
    //set the stoke color
    [self.strokeColor setStroke];
    
    //draw the path
    [self.path stroke];
}

- (void)didDraw:(id)sender {
    UIPanGestureRecognizer *drawGesture = (UIPanGestureRecognizer *)sender;
    CGPoint location = [drawGesture locationInView:self];
    
    if (drawGesture.state == UIGestureRecognizerStateBegan) {
        [self.path moveToPoint:location];
    } else if (drawGesture.state == UIGestureRecognizerStateChanged) {
        [self.path addLineToPoint:location];
    }
    
    self.strokeColor = (location.y > self.bounds.size.height / 2) ? [UIColor purpleColor] : [UIColor redColor];

    [self setNeedsDisplay];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.path = [UIBezierPath bezierPath];
        self.strokeColor = [UIColor purpleColor];
    }
    return self;
}

@end
