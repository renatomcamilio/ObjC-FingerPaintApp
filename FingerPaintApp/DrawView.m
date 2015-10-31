//
//  DrawView.m
//  FingerPaintApp
//
//  Created by Renato Camilio on 1/23/15.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import "DrawView.h"


@interface DrawView ()


@end

@implementation DrawView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        self.paths = [[NSMutableArray alloc] init];
        self.strokeColors = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect {
    for (int index = 0; index < self.paths.count; index++) {
        UIBezierPath *path = [self.paths objectAtIndex:index];
        UIColor *strokeColor = [self.strokeColors objectAtIndex:index];
        
        path.lineWidth = 3.0;
        path.lineJoinStyle = kCGLineJoinRound;
        
        [strokeColor setStroke];
        [path stroke];
    }
}


@end
