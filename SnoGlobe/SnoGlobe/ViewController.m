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

NSInteger rowToUse;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    weatherarray = [[NSArray alloc]initWithObjects:@"sun", @"sunWclouds", @"clouds", @"showers", @"sunshowers", @"rain", @"snow",@"flurries",@"fog",nil];
    
    _pickerViewContainer.frame = CGRectMake(0, 750, 600, 261);
    
    //weatherImage.center = CGPointMake(123.0f, 200.0f);
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake)
    {
        [self showWeather];
    } 
}

-(IBAction)showWeather
{
    
    UIImage *rain = [UIImage imageNamed:@"rain2.jpeg"];
    
    UIImage *sun = [UIImage imageNamed:@"sunny.jpeg"];
    
    UIImage *sunwclouds = [UIImage imageNamed:@"sun2clouds6.jpeg"];
    
    UIImage *clouds = [UIImage imageNamed:@"clouds2.jpg"];
    
    UIImage *showers = [UIImage imageNamed:@"showers2.jpeg"];
    
    UIImage *snow = [UIImage imageNamed:@"snow.png"];
    
    UIImage *flurries = [UIImage imageNamed:@"flurry4.jpeg"];
    
    UIImage *fog = [UIImage imageNamed:@"fog.png"];
    
    UIImage *sunshowers = [UIImage imageNamed:@"sunshowers2.jpeg"];
    
    if([[weatherarray objectAtIndex:rowToUse] isEqual:@"rain"])
    {
        //[weatherImage setImage:rain];
        [weatherImage setImage:rain];
        
        NSArray *rainyImageArray = [[NSArray alloc] initWithObjects:[UIImage imageNamed:@"rain.jpeg"], [UIImage imageNamed:@"rain2.jpeg"], nil];
        
        weatherImage.animationImages = rainyImageArray;
        weatherImage.animationDuration = 4.0;
        [weatherImage startAnimating];
    }
    else if([[weatherarray objectAtIndex:rowToUse] isEqual:@"sun"])
    {
        [weatherImage setImage:sun];
        
        NSArray *sunnyImageArray = [[NSArray alloc] initWithObjects:[UIImage imageNamed:@"sunny.jpeg"], [UIImage imageNamed:@"sunny2.jpeg"], nil];
        
        weatherImage.animationImages = sunnyImageArray;
        weatherImage.animationDuration = 4.0;
        [weatherImage startAnimating];
    }
    else if([[weatherarray objectAtIndex:rowToUse] isEqual:@"sunWclouds"])
    {
        [weatherImage setImage:sunwclouds];
        
        NSArray *sunnycloudsImageArray = [[NSArray alloc] initWithObjects:[UIImage imageNamed:@"sunnyclouds.jpeg"], [UIImage imageNamed:@"sunny2clouds2.jpeg"],[UIImage imageNamed:@"sunny2clouds3.jpeg"],[UIImage imageNamed:@"sunny2clouds4.jpeg"],[UIImage imageNamed:@"sunny2clouds5.jpeg"],[UIImage imageNamed:@"sunny2clouds6.jpeg"], nil];
        
        weatherImage.animationImages = sunnycloudsImageArray;
        weatherImage.animationDuration = 4.0;
        [weatherImage startAnimating];
        
    }
    else if([[weatherarray objectAtIndex:rowToUse] isEqual:@"clouds"])
    {
        [weatherImage setImage:clouds];
        
        //NSArray *cloudyImageArray = [[NSArray alloc] initWithObjects:[UIImage imageNamed:@"clouds.jpg"], [UIImage imageNamed:@"clouds2.jpg"], nil];
        
        //weatherImage.animationImages = cloudyImageArray;
        //weatherImage.animationDuration = 4.0;
        //[weatherImage startAnimating];
        //NSInteger x = 123.0f;
        //NSInteger y = 200.0f;
        
        //[UIView animateWithDuration:2.0 animations:^{while(x != 500.0f){weatherImage.center = CGPointMake(x + 50.0f, y);}}];
        
        [UIImageView animateWithDuration:2.0f animations:^{
            weatherImage.frame = CGRectMake(100.0f, 100.0f, weatherImage.frame.size.width, weatherImage.frame.size.height);
        }];
    }
    else if([[weatherarray objectAtIndex:rowToUse] isEqual:@"showers"])
    {
        [weatherImage setImage:showers];
        
        NSArray *showerImageArray = [[NSArray alloc] initWithObjects:[UIImage imageNamed:@"showers.jpeg"], [UIImage imageNamed:@"showers2.jpeg"], nil];
        
        weatherImage.animationImages = showerImageArray;
        weatherImage.animationDuration = 4.0;
        [weatherImage startAnimating];
    }
    else if([[weatherarray objectAtIndex:rowToUse] isEqual:@"sunshowers"])
    {
        [weatherImage setImage:sunshowers];
        
        NSArray *sunshowerImageArray = [[NSArray alloc] initWithObjects:[UIImage imageNamed:@"sun.jpeg"], [UIImage imageNamed:@"sunshowers2.jpeg"], nil];
        
        weatherImage.animationImages = sunshowerImageArray;
        weatherImage.animationDuration = 4.0;
        [weatherImage startAnimating];
    }
    else if([[weatherarray objectAtIndex:rowToUse] isEqual:@"snow"])
    {
        // still to come for animate
        [weatherImage setImage:snow];
    }
    else if([[weatherarray objectAtIndex:rowToUse] isEqual:@"flurries"])
    {
        [weatherImage setImage:flurries];
        
        NSArray *flurryImageArray = [[NSArray alloc] initWithObjects:[UIImage imageNamed:@"flurry.jpeg"], [UIImage imageNamed:@"flurry2.jpeg"],[UIImage imageNamed:@"flurry3.jpeg"],[UIImage imageNamed:@"flurry4.jpeg"], nil];
        
        weatherImage.animationImages = flurryImageArray;
        weatherImage.animationDuration = 4.0;
        [weatherImage startAnimating];
    }
    else if([[weatherarray objectAtIndex:rowToUse] isEqual:@"fog"])
    {
        // still to come for animate
        [weatherImage setImage:fog];
    }
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
    rowToUse = row;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showButton:(id)sender {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    _pickerViewContainer.frame = CGRectMake(0, 450, 600, 261);
    [UIView commitAnimations];
}

- (IBAction)hideButton:(id)sender {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    _pickerViewContainer.frame = CGRectMake(0, 750, 600, 261);
    [UIView commitAnimations];
}
@end
