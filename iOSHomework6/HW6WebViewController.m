//
//  HW6WebViewController.m
//  iOSHomeworkFinal
//
//  Created by Arjun Shivanand Kannan on 10/15/12.
//  Copyright (c) 2012 Arjun Shivanand Kannan. All rights reserved.
//

#import "HW6WebViewController.h"

static const CGFloat kNavBarHeight = 52.0f;
static const CGFloat kLabelHeight = 14.0f;
static const CGFloat kMargin = 10.0f;
static const CGFloat kSpacer = 2.0f;
static const CGFloat kLabelFontSize = 12.0f;
static const CGFloat kAddressHeight = 26.0f;

@interface HW6WebViewController ()

@end

@implementation HW6WebViewController
@synthesize toolbar = mToolbar;
@synthesize back = mBack;
@synthesize forward = mForward;
@synthesize refresh = mRefresh;
@synthesize stop = mStop;
@synthesize webView = myRedditWebView;
@synthesize pageTitle = mPageTitle;
@synthesize addressField = mAddressField;

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //Set up a navigation bar
    CGRect navBarFrame = self.view.bounds;
    navBarFrame.size.height = kNavBarHeight;
    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:navBarFrame];
    navBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    //Set up a title label
    CGRect labelFrame = CGRectMake(kMargin, kSpacer,
                                   navBar.bounds.size.width - 2*kMargin, kLabelHeight);
    UILabel *label = [[UILabel alloc] initWithFrame:labelFrame];
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:12];
    label.textAlignment = UITextAlignmentCenter;
    [navBar addSubview:label];
    self.pageTitle = label;
    
    //Set up an address
    CGRect addressFrame = CGRectMake(kMargin, kSpacer*2.0 + kLabelHeight,
                                     labelFrame.size.width, kAddressHeight);
    UITextField *address = [[UITextField alloc] initWithFrame:addressFrame];
    address.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    address.borderStyle = UITextBorderStyleRoundedRect;
    address.font = [UIFont systemFontOfSize:17];
    [navBar addSubview:address];
    self.addressField = address;
    
    //Add the Nav bar to the view controller
    [self.view addSubview:navBar];
    
    //Make the address bar work by adding return
    address.font = [UIFont systemFontOfSize:17];
    
    //Add URL Keyboard and remove autocapitalization
    address.keyboardType = UIKeyboardTypeURL;
    address.autocapitalizationType =
    UITextAutocapitalizationTypeNone;
    
    //Add a clear button
    address.clearButtonMode =
    UITextFieldViewModeWhileEditing;
    
    
    [address addTarget:self
                action:@selector(loadAddress:event:)
      forControlEvents:UIControlEventEditingDidEndOnExit];
    [navBar addSubview:address];

    //Set up calling the URL
    self.webView.delegate = self;
    self.webView.scalesPageToFit = YES;
    NSString *urlString = @"http://i.reddit.com";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    [self updateButtons];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Add button functionality
- (void)updateButtons
{
    self.forward.enabled = self.webView.canGoForward;
    self.back.enabled = self.webView.canGoBack;
    self.stop.enabled = self.webView.loading;
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    //Make it update the address bar when the address is changed
    [self updateAddress:request];
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [self updateButtons];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [self updateButtons];
    
    //Make it update address even when back and forward buttons are used
    [self updateTitle:webView];
    NSURLRequest* request = [webView request];
    [self updateAddress:request];
    
}

//Set up error handling
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [self updateButtons];
    [self informError:error];
}

- (void)informError:(NSError *)error
{
    NSString* localizedDescription = [error localizedDescription];
    UIAlertView* alertView = [[UIAlertView alloc]
                              initWithTitle:@"Error"
                              message:localizedDescription delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
    [alertView show];
}

- (void)loadAddress:(id)sender event:(UIEvent *)event
{
    NSString* urlString = self.addressField.text;
    NSURL* url = [NSURL URLWithString:urlString];
    //Make it work without adding http://
    if(!url.scheme)
    {
        NSString* modifiedURLString = [NSString stringWithFormat:@"http://%@", urlString];
        url = [NSURL URLWithString:modifiedURLString];
    }
    
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

- (void)updateTitle:(UIWebView*)aWebView
{
    NSString* pageTitle = [aWebView stringByEvaluatingJavaScriptFromString:@"document.title"];
    self.pageTitle.text = pageTitle;
}

//Update the address bar
- (void)updateAddress:(NSURLRequest*)request
{
    NSURL* url = [request mainDocumentURL];
    NSString* absoluteString = [url absoluteString];
    self.addressField.text = absoluteString;
}




- (void)viewDidUnload {
    myRedditWebView = nil;
    self.toolbar = nil;
    self.back = nil;
    self.forward = nil;
    self.refresh = nil;
    self.stop = nil;
    [super viewDidUnload];
}
@end
