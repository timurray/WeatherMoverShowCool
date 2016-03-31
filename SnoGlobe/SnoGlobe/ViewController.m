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

@synthesize WeatherOptions, weatherImage;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    weatherarray = [[NSArray alloc]initWithObjects:@"sun", @"sunWclouds", @"clouds", @"showers", @"sunshowers", @"rain", @"snow",@"flurries",@"fog",nil];
    
    _pickerViewContainer.frame = CGRectMake(0, 750, 600, 261);
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
    UIImage *rain = [UIImage imageNamed:@"rain.png"];
    
    UIImage *sun = [UIImage imageNamed:@"sun.jpeg"];
    
    UIImage *sunwclouds = [UIImage imageNamed:@"sunwclouds.jpeg"];
    
    UIImage *clouds = [UIImage imageNamed:@"clouds.gif"];
    
    UIImage *showers = [UIImage imageNamed:@"showers.png"];
    
    UIImage *snow = [UIImage imageNamed:@"snow.png"];
    
    UIImage *flurries = [UIImage imageNamed:@"flurries.jpeg"];
    
    UIImage *fog = [UIImage imageNamed:@"fog.png"];
    
    UIImage *sunshowers = [UIImage imageNamed:@"sunshowers.png"];
    
    if([[weatherarray objectAtIndex:row] isEqual:@"rain"])
    {
        [weatherImage setImage:rain];
    }
    else if([[weatherarray objectAtIndex:row] isEqual:@"sun"])
    {
        [weatherImage setImage:sun];
    }
    else if([[weatherarray objectAtIndex:row] isEqual:@"sunWclouds"])
    {
        [weatherImage setImage:sunwclouds];
    }
    else if([[weatherarray objectAtIndex:row] isEqual:@"clouds"])
    {
        [weatherImage setImage:clouds];
    }
    else if([[weatherarray objectAtIndex:row] isEqual:@"showers"])
    {
        [weatherImage setImage:showers];
    }
    else if([[weatherarray objectAtIndex:row] isEqual:@"sunshowers"])
    {
        [weatherImage setImage:sunshowers];
    }
    else if([[weatherarray objectAtIndex:row] isEqual:@"snow"])
    {
        [weatherImage setImage:snow];
    }
    else if([[weatherarray objectAtIndex:row] isEqual:@"flurries"])
    {
        [weatherImage setImage:flurries];
    }
    else if([[weatherarray objectAtIndex:row] isEqual:@"fog"])
    {
        [weatherImage setImage:fog];
    }
    /*label.text = [NSString stringWithFormat:@"%@ %@",[weatherarray objectAtIndex:[WeatherOptions selectedRowInComponent:0]], @"animation plays now"];*/
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
    _pickerViewContainer.frame = CGRectMake(0, 750, 600, 261);
    [UIView commitAnimations];
}
@end
