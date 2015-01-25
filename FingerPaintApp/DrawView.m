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
@property (nonatomic, strong) UIBezierPath *path;

@end

@implementation DrawView

- (void)drawRect:(CGRect)rect {
    [self.strokeColor setStroke];
    
    [self.path stroke];
}

- (void)didDraw:(id)sender {
    UIPanGestureRecognizer *drawGesture = (UIPanGestureRecognizer *)sender;
    CGPoint location = [drawGesture locationInView:self];
    
    if (drawGesture.state == UIGestureRecognizerStateBegan ||
        drawGesture.state == UIGestureRecognizerStateChanged) {
        [self.path addLineToPoint:location];
    }
    
    self.strokeColor = (location.y > self.bounds.size.height / 2) ? [UIColor purpleColor] : [UIColor redColor];

    [self setNeedsDisplay];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    [self.path moveToPoint:[touch locationInView:self]];
}

- (void)awakeFromNib {
    [super awakeFromNib];

    if (self) {
        self.path = [UIBezierPath bezierPathWithRect:CGRectZero];
        self.path.lineWidth = 3.0;
        self.path.lineJoinStyle = kCGLineJoinRound;
        
        self.strokeColor = [UIColor redColor];
        
        UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(didDraw:)];
        [self addGestureRecognizer:panRecognizer];
    }
}

@end
