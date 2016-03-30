//
//  ViewController.m
//  SnoGlobe
//
//  Created by Timothy Murray on 2016-03-29.
//  Copyright © 2016 Timothy Murray. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray *weatherarray;
}
@end

@implementation ViewController

@synthesize WeatherOptions, label;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    weatherarray = [[NSArray alloc]initWithObjects:@"sun", @"sunWclouds", @"clouds", @"showers", @"sunshowers", @"rain", @"snow",@"flurries",@"fog",nil];
    
    _pickerViewContainer.frame = CGRectMake(0, 600, 261, 261);
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return weatherarray.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [weatherarray objectAtIndex:row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    label.text = [NSString stringWithFormat:@"%@ %@",[weatherarray objectAtIndex:[WeatherOptions selectedRowInComponent:0]], @"animation plays now"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showButton:(id)sender {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    _pickerViewContainer.frame = CGRectMake(0, 400, 600, 261);
    [UIView commitAnimations];
}

- (IBAction)hideButton:(id)sender {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    _pickerViewContainer.frame = CGRectMake(0, 800, 600, 261);
    [UIView commitAnimations];
}
@end
