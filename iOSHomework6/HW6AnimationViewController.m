//
//  HW6AnimationViewController.m
//  iOSHomeworkFinal
//
//  Created by Arjun Shivanand Kannan on 10/15/12.
//  Copyright (c) 2012 Arjun Shivanand Kannan. All rights reserved.
//

#import "HW6AnimationViewController.h"

@interface HW6AnimationViewController (){
    UIImageView *applewoodView;
    UIImageView *backView;
}

@end

@implementation HW6AnimationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIImage *frontImage = [UIImage imageNamed:@"stamp1.jpg"];
    applewoodView = [[UIImageView alloc] initWithImage:frontImage];
    applewoodView.frame = viewControl.bounds;
    
    UIImage *backImage = [UIImage imageNamed:@"stamp2.jpg"];
    backView = [[UIImageView alloc] initWithImage:backImage];
    backView.frame = viewControl.bounds;
    
    [viewControl addSubview:applewoodView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    viewControl = nil;
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


- (IBAction)flipButtonPressed:(id)sender {
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    
    BOOL doesContainApplewood = [viewControl.subviews containsObject:applewoodView];
    
    if (doesContainApplewood) {
        [applewoodView removeFromSuperview];
        [viewControl addSubview:backView];
    }
    
    else{
        [backView removeFromSuperview];
        [viewControl addSubview:applewoodView];
    }
    
    
    
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:viewControl cache:NO];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    [UIView commitAnimations];

}
@end
