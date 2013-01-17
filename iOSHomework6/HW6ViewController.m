//
//  HW6ViewController.m
//  iOSHomework6
//
//  Created by Arjun Shivanand Kannan on 10/15/12.
//  Copyright (c) 2012 Arjun Shivanand Kannan. All rights reserved.
//

#import "HW6ViewController.h"
#import "HW6TableViewController1.h"

@interface HW6ViewController (){
    UINavigationController *navController;
    HW6TableViewController1 *firstTableViewController;

}

@end

@implementation HW6ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    firstTableViewController = [[HW6TableViewController1 alloc] init];
    
    navController = [[UINavigationController alloc]initWithRootViewController:firstTableViewController];
    
    navController.view.frame = self.view.bounds;
    [self.view addSubview:navController.view];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
