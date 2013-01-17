//
//  HW6SliderViewController.h
//  iOSHomeworkFinal
//
//  Created by Arjun Shivanand Kannan on 10/15/12.
//  Copyright (c) 2012 Arjun Shivanand Kannan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HW6SliderViewController : UIViewController{
    NSString *labelText;
    
    NSString *savedSize;
    
    NSString *textSize;
    IBOutlet UISlider *slider;
}

@property (strong, nonatomic) IBOutlet UITextView *textView;


- (IBAction)sliderValueChanged:(id)sender;

@end
