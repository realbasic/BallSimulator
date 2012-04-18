//
//  Weight.h
//  spring
//
//  Created by 洋一郎 西村 on 12/04/18.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Weight : CCSprite {
    double vx;
    double vy;
}

-(id)initWithPosition:(CGPoint) position;
@property (nonatomic) double vx;
@property (nonatomic) double vy;

@end
