//
//  ViewController.m
//  FingerPaintApp
//
//  Created by Renato Camilio on 1/23/15.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"

@interface ViewController()

@property (nonatomic, strong) IBOutlet DrawView *drawView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.drawView.path = [UIBezierPath bezierPathWithRect:CGRectZero];
    self.drawView.path.lineWidth = 2.0;
    
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self.drawView action:@selector(didDraw:)];
    [self.drawView addGestureRecognizer:panRecognizer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
