//
//  MyScene.m
//  SnoGlobe
//
//  Created by Timothy Murray on 2016-04-12.
//  Copyright © 2016 Timothy Murray. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyScene.h"


@implementation MyScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        self.backgroundColor = nil;
    }
    return self;
}

- (SKEmitterNode *) makeRain
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    SKEmitterNode *emitter =  [NSKeyedUnarchiver unarchiveObjectWithFile:[[NSBundle mainBundle] pathForResource:@"rain" ofType:@"sks"]];
    emitter.position = CGPointMake(150,screenRect.size.height - 300);
    emitter.name = @"rain";
    emitter.targetNode = self.scene;
    emitter.numParticlesToEmit = 1000;
    emitter.zPosition=2.0;
    return emitter;
}

- (SKEmitterNode *) createCloud
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    SKEmitterNode *emitter =  [NSKeyedUnarchiver unarchiveObjectWithFile:[[NSBundle mainBundle] pathForResource:@"cloud" ofType:@"sks"]];
    emitter.position = CGPointMake(150,screenRect.size.height - 250);
    emitter.name = @"cloud";
    emitter.targetNode = self.scene;
    emitter.numParticlesToEmit = 1000;
    emitter.zPosition=2.0;
    return emitter;
}

- (SKEmitterNode *) makeSnow
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    SKEmitterNode *emitter =  [NSKeyedUnarchiver unarchiveObjectWithFile:[[NSBundle mainBundle] pathForResource:@"snow" ofType:@"sks"]];
    emitter.position = CGPointMake(150,screenRect.size.height - 300);
    emitter.name = @"snow";
    emitter.targetNode = self.scene;
    emitter.numParticlesToEmit = 1000;
    emitter.zPosition=2.0;
    return emitter;
}

- (SKEmitterNode *) makeFog
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    SKEmitterNode *emitter =  [NSKeyedUnarchiver unarchiveObjectWithFile:[[NSBundle mainBundle] pathForResource:@"fog" ofType:@"sks"]];
    emitter.position = CGPointMake(150,screenRect.size.height - 500);
    emitter.name = @"fog";
    emitter.targetNode = self.scene;
    emitter.numParticlesToEmit = 1000;
    emitter.zPosition=2.0;
    return emitter;
}

- (SKEmitterNode *) makeSun
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    SKEmitterNode *emitter =  [NSKeyedUnarchiver unarchiveObjectWithFile:[[NSBundle mainBundle] pathForResource:@"sun" ofType:@"sks"]];
    emitter.position = CGPointMake(250,screenRect.size.height - 300);
    emitter.name = @"sun";
    emitter.targetNode = self.scene;
    emitter.numParticlesToEmit = 10000;
    emitter.zPosition=2.0;
    return emitter;
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
