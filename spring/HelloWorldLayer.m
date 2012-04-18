//
//  HelloWorldLayer.m
//  spring
//
//  Created by 洋一郎 西村 on 12/04/18.
//  Copyright __MyCompanyName__ 2012年. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"
#define D 26

// HelloWorldLayer implementation
@implementation HelloWorldLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
		objectArray = [[NSMutableArray alloc] init];

        for(int x = 0; x < 5; x++){
            for(int y = 0; y < 5; y++){
                Weight * weight = [[Weight alloc] initWithPosition:ccp( x * 25 + 50, y * 25 + 50 )];
                [self addChild:weight];
                [objectArray addObject:weight];
            }            
        }
        [[UIAccelerometer sharedAccelerometer] setUpdateInterval:0.05];
        [[UIAccelerometer sharedAccelerometer] setDelegate:self];
        
        [self schedule:@selector(nextFrame:)];
	}
	return self;
}

- (void)accelerometer:(UIAccelerometer *)accelerometer 
        didAccelerate:(UIAcceleration *)acceleration
{
    gx = -acceleration.y * 0.02;
    gy = acceleration.x * 0.02;
}

-(void)nextFrame:(ccTime)dt{
    for(int i = 0; i < 10; i++)
    for(Weight * weight in objectArray){
        weight.vy += ((random() % 100 - 50) / 10000.0);
        weight.vx += ((random() % 100 - 50) / 10000.0);
        weight.vx *= 0.999;
        weight.vy *= 0.999;
        weight.vx += gx;
        weight.vy += gy;
        weight.position = CGPointMake(weight.position.x + weight.vx, weight.position.y + weight.vy);
        if(weight.position.x < 10){
            weight.vx = fabs(weight.vx) * 0.7;
            weight.position = ccp(10, weight.position.y);
        }else if(weight.position.x > 470){
            weight.vx = -fabs(weight.vx) * 0.7;
            weight.position = ccp(470, weight.position.y);
        }
        if(weight.position.y < 10){
            weight.vy = fabs(weight.vy) * 0.7;
            weight.position = ccp(weight.position.x, 10);
        }else if(weight.position.y > 310){
            weight.vy = -fabs(weight.vy) * 0.7;
            weight.position = ccp(weight.position.x, 310);
        }
        for(Weight * weight2 in objectArray){
            if(weight == weight2)break;
            double dx = weight2.position.x - weight.position.x;
            double dy = weight2.position.y - weight.position.y;
            double d = sqrt(dx*dx + dy*dy);
            if(d < D){
                double dvx = weight2.vx - weight.vx;
                double dvy = weight2.vy - weight.vy;
                double p = (dvx * dx + dvy * dy) / d * 0.9; 
                if(p<0){
                    double px = p * dx / d;
                    double py = p * dy / d;
                    weight.vx += px;
                    weight.vy += py;
                    weight2.vx -= px;
                    weight2.vy -= py;
                    
                    double mx = -(D - d) * dx / d;
                    double my = -(D - d) * dy / d;
                    weight.position = ccp(weight.position.x + mx, weight.position.y + my);
                    weight2.position = ccp(weight2.position.x - mx, weight2.position.y - my);
                    
                }
                
            }
        }
    }
}
// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
    [[UIAccelerometer sharedAccelerometer] setDelegate:nil];
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
