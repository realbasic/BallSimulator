//
//  HelloWorldLayer.h
//  spring
//
//  Created by 洋一郎 西村 on 12/04/18.
//  Copyright __MyCompanyName__ 2012年. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "Weight.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer
{
    NSMutableArray * objectArray;
    double gx;
    double gy;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
