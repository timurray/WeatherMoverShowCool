//
//  ViewController.h
//  TestParticles
//
//  Created by Timothy Murray on 2016-04-12.
//  Copyright © 2016 Timothy Murray. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate> {
    CLLocationManager *locationManager;
    NSString *currentLocation;
}

@property IBOutlet SKView *skView;
@property (strong, nonatomic) IBOutlet UIImageView *logoView;

@end

