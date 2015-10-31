//
//  DrawView.h
//  FingerPaintApp
//
//  Created by Renato Camilio on 1/23/15.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DrawView : UIView

@property (nonatomic, strong) NSMutableArray *paths;
@property (nonatomic, strong) NSMutableArray *strokeColors;

@end