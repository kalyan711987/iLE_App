//
//  WebController.m
//  iLE
//
//  Created by Innoppl tech on 6/22/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "WebController.h"


@implementation WebController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    self.navigationController.navigationBarHidden=NO;
    webviw=[[UIWebView alloc]init];
    NSURL *url=[NSURL URLWithString:@"http://www.avsllc.com"];
    NSURLRequest *req=[NSURLRequest requestWithURL:url];
    [webviw loadRequest:req];
    webviw.scalesPageToFit=YES;
    [self.view addSubview:webviw];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        webviw.frame=CGRectMake(0, 0,768,1024);
    }else{
        webviw.frame=CGRectMake(0, 0,320,480);

    }

    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if (UIInterfaceOrientationIsLandscape(interfaceOrientation)) {
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
            webviw.frame=CGRectMake(0, 0, 1024,768);
            
        }else{
            webviw.frame=CGRectMake(0, 0, 480,320);

        }
        
    }else{
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
            webviw.frame=CGRectMake(0, 0, 768,1024);

            
        }else{
            webviw.frame=CGRectMake(0, 0, 320,480);

        }
    }
	return YES;
}

@end
