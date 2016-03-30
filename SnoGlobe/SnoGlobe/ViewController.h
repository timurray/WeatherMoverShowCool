//
//  ViewController.h
//  SnoGlobe
//
//  Created by Timothy Murray on 2016-03-29.
//  Copyright © 2016 Timothy Murray. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) IBOutlet UIPickerView *WeatherOptions;

@property (strong, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) IBOutlet UIView *pickerViewContainer;

- (IBAction)showButton:(id)sender;
- (IBAction)hideButton:(id)sender;

@end

