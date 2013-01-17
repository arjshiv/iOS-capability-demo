//
//  HW6TableViewController1.m
//  iOSHomework6
//
//  Created by Arjun Shivanand Kannan on 10/15/12.
//  Copyright (c) 2012 Arjun Shivanand Kannan. All rights reserved.
//

#import "HW6TableViewController1.h"
#import "HW6WebViewController.h"
#import "HW6SliderViewController.h"
#import "HW6AnimationViewController.h"

@interface HW6TableViewController1 ()

@end

@implementation HW6TableViewController1

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Cool stuff you can do with iOS";

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    switch (indexPath.row){
        case 0:
            cell.textLabel.text = @"Browse the internet (Yay!)";
            cell.detailTextLabel.text = @"A robust, functional browser in WebView";
            break;
        case 1:
            cell.textLabel.text = @"Randomness with a slider";
            cell.detailTextLabel.text = @"Using a slider and NSUserDefaults";
            break;
        case 2:
            cell.textLabel.text = @"Flip stamps";
            cell.detailTextLabel.text = @"Flip animation from class, t with the flipping between two images fixed";
            break;
        default:
            break;
            
    }

    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    switch (indexPath.row) {
        case 0:
            [self.navigationController pushViewController:[[HW6WebViewController alloc] init] animated:YES];
            break;
            
        case 1:
            [self.navigationController pushViewController:[[HW6SliderViewController alloc] init] animated:YES];
            break;
        case 2:
            [self.navigationController pushViewController:[[HW6AnimationViewController alloc] init] animated:YES];
            break;
            
        default:
            break;
    }
    
    
}

@end
