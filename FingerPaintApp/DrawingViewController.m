//
//  ViewController.m
//  FingerPaintApp
//
//  Created by Renato Camilio on 1/23/15.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import "DrawingViewController.h"
#import "DrawView.h"


@interface DrawingViewController()

@property (nonatomic, weak) IBOutlet DrawView *drawView;
@property (nonatomic, strong) UIBezierPath *currentDrawingPath;
@property (nonatomic, strong) UIColor *currentDrawingColor;

@end

@implementation DrawingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.currentDrawingColor = [UIColor blueColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    
    self.currentDrawingPath = [UIBezierPath bezierPathWithRect:CGRectZero];
    [self.currentDrawingPath moveToPoint:[touch locationInView:self.drawView]];

    [self.drawView.strokeColors addObject:self.currentDrawingColor];
    [self.drawView.paths addObject:self.currentDrawingPath];
    
    [self.drawView setNeedsDisplay];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self touchesEnded:touches withEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.drawView];
    [self.currentDrawingPath addLineToPoint:location];
    
    [self.drawView setNeedsDisplay];
}

- (IBAction)pickYellowColor:(id)sender {
    self.currentDrawingColor = [UIColor yellowColor];
}

- (IBAction)pickBlueColor:(id)sender {
    self.currentDrawingColor = [UIColor blueColor];
}

- (IBAction)pickRedColor:(id)sender {
    self.currentDrawingColor = [UIColor redColor];
}


@end
