//
//  HW6WebViewController.h
//  iOSHomeworkFinal
//
//  Created by Arjun Shivanand Kannan on 10/15/12.
//  Copyright (c) 2012 Arjun Shivanand Kannan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HW6WebViewController : UIViewController<UIWebViewDelegate>{
    
    IBOutlet UIWebView *myRedditWebView;
    UIToolbar* mToolbar;
    UIBarButtonItem* mBack;
    UIBarButtonItem* mForward;
    UIBarButtonItem* mRefresh;
    UIBarButtonItem* mStop;
    
    UILabel* mPageTitle;
    UITextField* mAddressField;
}
@property (nonatomic, retain) IBOutlet UIWebView* webView;
@property (nonatomic, retain) IBOutlet UIToolbar* toolbar;
@property (nonatomic, retain) IBOutlet UIBarButtonItem* back;
@property (nonatomic, retain) IBOutlet UIBarButtonItem* forward;
@property (nonatomic, retain) IBOutlet UIBarButtonItem* refresh;
@property (nonatomic, retain) IBOutlet UIBarButtonItem* stop;

@property (nonatomic, retain) UILabel* pageTitle;
@property (nonatomic, retain) UITextField* addressField;

- (void)updateButtons;
- (void)informError:(NSError*)error;

@end
