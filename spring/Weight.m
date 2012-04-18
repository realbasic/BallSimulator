//
//  Weight.m
//  spring
//
//  Created by 洋一郎 西村 on 12/04/18.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "Weight.h"


@implementation Weight

@synthesize vx;
@synthesize vy;

-(id)initWithPosition:(CGPoint) position{
    [self initWithFile:@"ball2.png"];
    self.position = position;
    self.scale = 0.4;
    return self;
}

@end
