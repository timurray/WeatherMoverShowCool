//
//  ViewController.m
//  TestParticles
//
//  Created by Timothy Murray on 2016-04-12.
//  Copyright © 2016 Timothy Murray. All rights reserved.
//

#import "ViewController.h"
#import "MyScene.h"

@interface ViewController ()
@end

@implementation ViewController


NSString *weather = @"rain";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_logoView setImage:[UIImage imageNamed:@"AnimatedLogo/snoglobe.jpg"]];
    //The array to genreate the start up logo in the background
    //sorry for the messy large array, it was alast minute decision
    NSArray *logoArray = [[NSArray alloc] initWithObjects:[UIImage imageNamed:@"AnimatedLogo/SnoglobLogo00.jpg"], [UIImage imageNamed:@"AnimatedLogo/SnoglobLogo01.jpg"],[UIImage imageNamed:@"AnimatedLogo/SnoglobLogo02.jpg"],[UIImage imageNamed:@"AnimatedLogo/SnoglobLogo03.jpg"],[UIImage imageNamed:@"AnimatedLogo/SnoglobLogo04.jpg"],[UIImage imageNamed:@"AnimatedLogo/SnoglobLogo05.jpg"],[UIImage imageNamed:@"AnimatedLogo/SnoglobLogo06.jpg"],[UIImage imageNamed:@"AnimatedLogo/SnoglobLogo07.jpg"],[UIImage imageNamed:@"AnimatedLogo/SnoglobLogo08.jpg"],[UIImage imageNamed:@"AnimatedLogo/SnoglobLogo09.jpg"],[UIImage imageNamed:@"AnimatedLogo/SnoglobLogo10.jpg"],[UIImage imageNamed:@"AnimatedLogo/SnoglobLogo11.jpg"],[UIImage imageNamed:@"AnimatedLogo/SnoglobLogo12.jpg"],[UIImage imageNamed:@"AnimatedLogo/SnoglobLogo13.jpg"],[UIImage imageNamed:@"AnimatedLogo/SnoglobLogo14.jpg"],[UIImage imageNamed:@"AnimatedLogo/SnoglobLogo15.jpg"],[UIImage imageNamed:@"AnimatedLogo/SnoglobLogo16.jpg"],[UIImage imageNamed:@"AnimatedLogo/SnoglobLogo17.jpg"],[UIImage imageNamed:@"AnimatedLogo/SnoglobLogo18.jpg"],[UIImage imageNamed:@"AnimatedLogo/SnoglobLogo19.jpg"],[UIImage imageNamed:@"AnimatedLogo/SnoglobLogo20.jpg"],[UIImage imageNamed:@"AnimatedLogo/SnoglobLogo21.jpg"],[UIImage imageNamed:@"AnimatedLogo/SnoglobLogo22.jpg"],[UIImage imageNamed:@"AnimatedLogo/SnoglobLogo23.jpg"],[UIImage imageNamed:@"AnimatedLogo/SnoglobLogo24.jpg"],[UIImage imageNamed:@"AnimatedLogo/SnoglobLogo25.jpg"],[UIImage imageNamed:@"AnimatedLogo/SnoglobLogo26.jpg"],[UIImage imageNamed:@"AnimatedLogo/SnoglobLogo27.jpg"],[UIImage imageNamed:@"AnimatedLogo/SnoglobLogo28.jpg"],[UIImage imageNamed:@"AnimatedLogo/SnoglobLogo29.jpg"],[UIImage imageNamed:@"AnimatedLogo/SnoglobLogo30.jpg"],[UIImage imageNamed:@"AnimatedLogo/SnoglobLogo31.jpg"],[UIImage imageNamed:@"AnimatedLogo/SnoglobLogo32.jpg"],[UIImage imageNamed:@"AnimatedLogo/SnoglobLogo33.jpg"],[UIImage imageNamed:@"AnimatedLogo/SnoglobLogo34.jpg"],[UIImage imageNamed:@"AnimatedLogo/SnoglobLogo35.jpg"],[UIImage imageNamed:@"AnimatedLogo/SnoglobLogo36.jpg"],[UIImage imageNamed:@"AnimatedLogo/SnoglobLogo37.jpg"],[UIImage imageNamed:@"AnimatedLogo/SnoglobLogo38.jpg"],[UIImage imageNamed:@"AnimatedLogo/SnoglobLogo39.jpg"],[UIImage imageNamed:@"AnimatedLogo/SnoglobLogo40.jpg"],[UIImage imageNamed:@"AnimatedLogo/SnoglobLogo41.jpg"],[UIImage imageNamed:@"AnimatedLogo/SnoglobLogo42.jpg"], nil];
    
    _logoView.animationImages = logoArray;
    _logoView.animationDuration = 3.0;
    [_logoView startAnimating];
    // Do any additional setup after loading the view, typically from a nib.
    // Configure the SKView
    SKView * skView = _skView;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    skView.allowsTransparency = YES;
    
    // Create and configure the scene.
    SKScene * scene = [MyScene sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [skView presentScene:scene];
    
    // Init Location Manager
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers;
    
    if([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0 && [CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
        [locationManager requestWhenInUseAuthorization];
    } else {
    [locationManager startUpdatingLocation];
        }
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(nonnull NSArray<CLLocation *> *)locations {
    CLLocation *location = [locations lastObject];
    NSLog(@"lat%f - lon%f", location.coordinate.longitude, location.coordinate.longitude);
    currentLocation = [NSString stringWithFormat:@"%f %f", location.coordinate.longitude, location.coordinate.longitude];
}

-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    if (status == kCLAuthorizationStatusNotDetermined){
        NSLog(@"Waiting for user to take action");
    }
    else if(status == kCLAuthorizationStatusDenied){
        NSLog(@"User denied location permissions");
    }
    else{ [locationManager startUpdatingLocation];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidAppear:(BOOL)animated
{
    [_skView becomeFirstResponder];
    [super viewWillAppear:animated];
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    // Create and configure the scene.
    SKScene * scene = [MyScene sceneWithSize:_skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [_skView presentScene:scene];
    
    if([weather  isEqual: @"rain"]){
     CGRect screenRect = [[UIScreen mainScreen] bounds];
        
     SKEmitterNode *emitter2 =  [NSKeyedUnarchiver unarchiveObjectWithFile:[[NSBundle mainBundle] pathForResource:@"cloud" ofType:@"sks"]];
    emitter2.position = CGPointMake(40,screenRect.size.height - 75);
    emitter2.name = @"cloud";
    emitter2.targetNode = scene;
    emitter2.numParticlesToEmit = 1000;
    emitter2.zPosition=2.0;
        
        [scene addChild:emitter2];
     SKEmitterNode *emitter =  [NSKeyedUnarchiver unarchiveObjectWithFile:[[NSBundle mainBundle] pathForResource:@"rain" ofType:@"sks"]];
     emitter.position = CGPointMake(150,screenRect.size.height - 100);
     emitter.name = @"rain";
     emitter.targetNode = scene;
     emitter.numParticlesToEmit = 5000;
     emitter.zPosition=2.0;
     
     [scene addChild:emitter];
    }
    else if([weather  isEqual: @"sun"]){
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        SKEmitterNode *emitter =  [NSKeyedUnarchiver unarchiveObjectWithFile:[[NSBundle mainBundle] pathForResource:@"sun" ofType:@"sks"]];
        emitter.position = CGPointMake(150,screenRect.size.height - 100);
        emitter.name = @"sun";
        emitter.targetNode = scene;
        emitter.numParticlesToEmit = 1000;
        emitter.zPosition=2.0;
        
        [scene addChild:emitter];
    }
    else if([weather  isEqual: @"cloudy"]){
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        SKEmitterNode *emitter =  [NSKeyedUnarchiver unarchiveObjectWithFile:[[NSBundle mainBundle] pathForResource:@"cloud" ofType:@"sks"]];
        emitter.position = CGPointMake(100,screenRect.size.height - 250);
        emitter.name = @"cloud";
        emitter.targetNode = scene;
        emitter.numParticlesToEmit = 1000;
        emitter.zPosition=2.0;
        
        [scene addChild:emitter];
    }
    else if([weather  isEqual: @"fog"]){
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        SKEmitterNode *emitter =  [NSKeyedUnarchiver unarchiveObjectWithFile:[[NSBundle mainBundle] pathForResource:@"fog" ofType:@"sks"]];
        emitter.position = CGPointMake(150,screenRect.size.height - 200);
        emitter.name = @"fog";
        emitter.targetNode = scene;
        emitter.numParticlesToEmit = 3000;
        emitter.zPosition=2.0;
        
        [scene addChild:emitter];
    }
    else if([weather  isEqual: @"sunWclouds"]){
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        SKEmitterNode *emitter =  [NSKeyedUnarchiver unarchiveObjectWithFile:[[NSBundle mainBundle] pathForResource:@"sun" ofType:@"sks"]];
        emitter.position = CGPointMake(150,screenRect.size.height - 100);
        emitter.name = @"sun";
        emitter.targetNode = scene;
        emitter.numParticlesToEmit = 5000;
        emitter.zPosition=2.0;
        
        [scene addChild:emitter];
        
        SKEmitterNode *emitter2 =  [NSKeyedUnarchiver unarchiveObjectWithFile:[[NSBundle mainBundle] pathForResource:@"cloud" ofType:@"sks"]];
        emitter2.position = CGPointMake(100,screenRect.size.height - 250);
        emitter2.name = @"cloud";
        emitter2.targetNode = scene;
        emitter2.numParticlesToEmit = 1000;
        emitter2.zPosition=2.0;
        
        [scene addChild:emitter2];
    }
    else if([weather  isEqual: @"snow"]){
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        SKEmitterNode *emitter =  [NSKeyedUnarchiver unarchiveObjectWithFile:[[NSBundle mainBundle] pathForResource:@"snow" ofType:@"sks"]];
        emitter.position = CGPointMake(150,screenRect.size.height - 300);
        emitter.name = @"snow";
        emitter.targetNode = scene;
        emitter.numParticlesToEmit = 1000;
        emitter.zPosition=2.0;
        
        [scene addChild:emitter];
    }
}

@end
