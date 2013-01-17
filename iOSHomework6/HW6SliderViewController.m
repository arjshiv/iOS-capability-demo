//
//  HW6SliderViewController.m
//  iOSHomeworkFinal
//
//  Created by Arjun Shivanand Kannan on 10/15/12.
//  Copyright (c) 2012 Arjun Shivanand Kannan. All rights reserved.
//

#import "HW6SliderViewController.h"

@interface HW6SliderViewController ()

@end

@implementation HW6SliderViewController
@synthesize textView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    textView.backgroundColor = [UIColor clearColor];
    labelText = @"Look how big (or small) this text is !\nThis text size will be stored when you go back and return";
    
    savedSize = [[NSUserDefaults standardUserDefaults] objectForKey:@"textSize"];
    
    if (savedSize.length == 0) {
        textSize = [NSString stringWithFormat:@"%d", 22];
        [[NSUserDefaults standardUserDefaults] setObject:textSize forKey:@"textSize"];
    }
    
    NSLog(savedSize);
    
    
    slider.value = [savedSize intValue];
    
    textView.font = [UIFont systemFontOfSize:[savedSize intValue]];
    textView.text = labelText;
        
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTextView:nil];
    slider = nil;
    [super viewDidUnload];
}
- (IBAction)sliderValueChanged:(id)sender {
    UISlider *localSliderDeclaration = (UISlider *)sender;
    //typecast slider progress
    int progressOfSlider = (int)(localSliderDeclaration.value + 0.5f);
    
    textView.font = [UIFont systemFontOfSize:progressOfSlider];
    textSize = [NSString stringWithFormat:@"%d", progressOfSlider];
    [[NSUserDefaults standardUserDefaults] setObject:textSize forKey:@"textSize"];

    textView.text = labelText;
}

@end
