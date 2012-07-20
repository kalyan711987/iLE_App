//
//  LifeEstimatedView.m
//  iLE
//
//  Created by Innoppl tech on 6/20/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "LifeEstimatedView.h"


@implementation LifeEstimatedView
UIButton *help_btn;
UIButton *logout;
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
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden=YES;
    [self lifeview_position];
    [super viewWillAppear:animated];
}
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
    Last_Scrol=[[UIScrollView alloc]initWithFrame:CGRectMake(0,0,self.view.bounds.size.width,self.view.bounds.size.height)];
    Last_Scrol.showsVerticalScrollIndicator=YES;
    Last_Scrol.userInteractionEnabled=YES;
    Last_Scrol.pagingEnabled=YES;
    Last_Scrol.multipleTouchEnabled=YES;
    // [Login_Scrol setBackgroundColor:[UIColor orangeColor]];
    Last_Scrol.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    Last_Scrol.bounces =YES;
    Last_Scrol.clipsToBounds=YES;
    Last_Scrol.scrollEnabled = YES;
    // Login_Scrol.contentSize=CGSizeMake(self.view.bounds.size.width,460);
    [self.view addSubview:Last_Scrol];
   help_btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [help_btn setImage:[UIImage imageNamed:@"help-button.png"] forState:UIControlStateNormal];
    [help_btn addTarget:self action:@selector(LoadWebview) forControlEvents:UIControlEventTouchUpInside];
   logout =[UIButton buttonWithType:UIButtonTypeCustom];
    [logout addTarget:self action:@selector(Logout) forControlEvents:UIControlEventTouchUpInside];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        image_bg=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"iLE-last.png"]];
        image_bg.userInteractionEnabled=YES;
        [Last_Scrol addSubview:image_bg];
        
    }else{
        image_bg=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"iphone_last_screen.png"]];
        image_bg.userInteractionEnabled=YES;
        [Last_Scrol addSubview:image_bg];
    }
    [image_bg addSubview:[self lbltag:1 text:@"Your Life Expectancy is 67 years, you will be 87 years old."]];
    [image_bg addSubview:[self lbltag:2 text:@"If you quit smoking you would live until you were 89."]];
    [image_bg addSubview:[self lbltag:3 text:@"If you reduced your alcholoic intake you would live till you were 91."]];
    [image_bg addSubview:[self lbltag:4 text:@"If you lost the weight you could live until you were 92."]];
    [image_bg addSubview:[self lbltag:5 text:@"By improving all above points you could live till you were 94."]];
    UILabel *lbl1=(UILabel*)[image_bg viewWithTag:1];
    UILabel *lbl2=(UILabel*)[image_bg viewWithTag:2];
    UILabel *lbl3=(UILabel*)[image_bg viewWithTag:3];
    UILabel *lbl4=(UILabel*)[image_bg viewWithTag:4];
    UILabel *lbl5=(UILabel*)[image_bg viewWithTag:5];

    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
//        image_bg=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"iLE-last.png"]];
//        image_bg.userInteractionEnabled=YES;
//        [Last_Scrol addSubview:image_bg];
        [image_bg addSubview:logout];

        [image_bg addSubview:help_btn];
        help_btn.frame=CGRectMake(300, 750, 200, 40);
        logout.frame=CGRectMake(655, 5, 40, 40);
        lbl1.frame=CGRectMake(100,200,600,50);
        lbl2.frame=CGRectMake(100,300,600,50);
        lbl3.frame=CGRectMake(100,400,600,50);
        lbl4.frame=CGRectMake(100,500,600,50);
        lbl5.frame=CGRectMake(100,600,600,50);
 
    }else{
//        image_bg=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"iphone_last_screen.png"]];
//        image_bg.userInteractionEnabled=YES;
//        [Last_Scrol addSubview:image_bg];
        [image_bg addSubview:logout];
        [image_bg addSubview:help_btn];
        help_btn.frame=CGRectMake(120, 400, 110, 30);
        logout.frame=CGRectMake(269,2, 22, 22);
        lbl1.frame=CGRectMake(25,100,280,50);
        lbl2.frame=CGRectMake(25,160,280,50);
        lbl3.frame=CGRectMake(25,220,280,50);
        lbl4.frame=CGRectMake(25,280,280,50);
        lbl5.frame=CGRectMake(25,340,280,50);

     
    }
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)Logout{
    
    [self.navigationController popToRootViewControllerAnimated:YES];  
}
-(void)LoadWebview{
    
    WebController *web=[[WebController alloc]initWithNibName:@"WebController" bundle:nil];
    [self.navigationController pushViewController:web animated:YES];
    [web release];
}
-(UILabel*)lbltag:(NSInteger)tag text:(NSString*)text{
    
    UILabel *lbl=[[UILabel alloc]init];
    [lbl setText:text];
    [lbl setTag:tag];
    [lbl setTextColor:[UIColor whiteColor]];
    [lbl setBackgroundColor:[UIColor clearColor]];
    lbl.lineBreakMode=UILineBreakModeWordWrap;
    lbl.numberOfLines=3;
    return [lbl autorelease];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
-(void)lifeview_position{
    UILabel *lbl1=(UILabel*)[image_bg viewWithTag:1];
    UILabel *lbl2=(UILabel*)[image_bg viewWithTag:2];
    UILabel *lbl3=(UILabel*)[image_bg viewWithTag:3];
    UILabel *lbl4=(UILabel*)[image_bg viewWithTag:4];
    UILabel *lbl5=(UILabel*)[image_bg viewWithTag:5];
    if (UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation)){
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            Last_Scrol.frame=CGRectMake(0, 0, 1024,768);
            
            image_bg.image=Ipad_Landscape4;
            image_bg.frame=CGRectMake(0,0,1024,768);
            help_btn.frame=CGRectMake(440, 650, 200, 40);
            logout.frame=CGRectMake(926, 9, 42, 42);   
            
            lbl1.frame=CGRectMake(100,200,600,50);
            lbl2.frame=CGRectMake(100,300,600,50);
            lbl3.frame=CGRectMake(100,400,600,50);
            lbl4.frame=CGRectMake(100,500,600,50);
            lbl5.frame=CGRectMake(100,600,600,50);
            
        }else{
            
            Last_Scrol.frame=CGRectMake(0, 0, 480,320);
            image_bg.image=Iphone_Landscape4;
            image_bg.frame=CGRectMake(0,0,480,480);
            Last_Scrol.contentSize=CGSizeMake(480,480);
            help_btn.frame=CGRectMake(160, 400, 110, 30);
            logout.frame=CGRectMake(425,7, 22, 22);
            
            lbl1.frame=CGRectMake(40,100,410,50);
            lbl2.frame=CGRectMake(40,160,410,50);
            lbl3.frame=CGRectMake(40,220,410,50);
            lbl4.frame=CGRectMake(40,280,410,50);
            lbl5.frame=CGRectMake(40,340,410,50);
            
        }

        
    }else if(UIInterfaceOrientationIsPortrait([UIDevice currentDevice].orientation)){
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {            
            Last_Scrol.frame=CGRectMake(0, 0, 768,1024);
            
            image_bg.image=Ipad_Portrait4;
            image_bg.frame=CGRectMake(0,0,768,1024);
            help_btn.frame=CGRectMake(300, 750, 200, 40);
            logout.frame=CGRectMake(687, 15, 40, 40);
            lbl1.frame=CGRectMake(100,200,600,50);
            lbl2.frame=CGRectMake(100,300,600,50);
            lbl3.frame=CGRectMake(100,400,600,50);
            lbl4.frame=CGRectMake(100,500,600,50);
            lbl5.frame=CGRectMake(100,600,600,50);
        }else{
            Last_Scrol.frame=CGRectMake(0, 0, 320,480);
            
            image_bg.image=Iphone_Portrait4;
            image_bg.frame=CGRectMake(0,0,320,480);
            help_btn.frame=CGRectMake(120, 400, 110, 30);
            logout.frame=CGRectMake(279,2, 22, 22);
            lbl1.font=[UIFont systemFontOfSize:16];
            lbl2.font=[UIFont systemFontOfSize:16];
            lbl3.font=[UIFont systemFontOfSize:16];
            lbl4.font=[UIFont systemFontOfSize:16];
            lbl5.font=[UIFont systemFontOfSize:16];
            
            lbl1.frame=CGRectMake(40,100,260,50);
            lbl2.frame=CGRectMake(40,160,260,50);
            lbl3.frame=CGRectMake(40,220,260,50);
            lbl4.frame=CGRectMake(40,280,260,50);
            lbl5.frame=CGRectMake(40,340,260,50);
        }
    }
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    UILabel *lbl1=(UILabel*)[image_bg viewWithTag:1];
    UILabel *lbl2=(UILabel*)[image_bg viewWithTag:2];
    UILabel *lbl3=(UILabel*)[image_bg viewWithTag:3];
    UILabel *lbl4=(UILabel*)[image_bg viewWithTag:4];
    UILabel *lbl5=(UILabel*)[image_bg viewWithTag:5];
    if (UIDeviceOrientationIsLandscape(interfaceOrientation)){
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            Last_Scrol.frame=CGRectMake(0, 0, 1024,768);
            
            image_bg.image=Ipad_Landscape4;
            image_bg.frame=CGRectMake(0,0,1024,768);
            help_btn.frame=CGRectMake(440, 650, 200, 40);
            logout.frame=CGRectMake(923, 9, 42, 42);   
            
            lbl1.frame=CGRectMake(100,200,600,50);
            lbl2.frame=CGRectMake(100,300,600,50);
            lbl3.frame=CGRectMake(100,400,600,50);
            lbl4.frame=CGRectMake(100,500,600,50);
            lbl5.frame=CGRectMake(100,600,600,50);
            
        }else{
            
            Last_Scrol.frame=CGRectMake(0, 0, 480,320);
            image_bg.image=Iphone_Landscape4;
            image_bg.frame=CGRectMake(0,0,480,480);
            Last_Scrol.contentSize=CGSizeMake(480,480);
            help_btn.frame=CGRectMake(160, 400, 110, 30);
            logout.frame=CGRectMake(425,7, 22, 22);
            
            lbl1.frame=CGRectMake(40,100,410,50);
            lbl2.frame=CGRectMake(40,160,410,50);
            lbl3.frame=CGRectMake(40,220,410,50);
            lbl4.frame=CGRectMake(40,280,410,50);
            lbl5.frame=CGRectMake(40,340,410,50);
            
        }
        
        
    }else{
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {            
            Last_Scrol.frame=CGRectMake(0, 0, 768,1024);
            
            image_bg.image=Ipad_Portrait4;
            image_bg.frame=CGRectMake(0,0,768,1024);
            help_btn.frame=CGRectMake(300, 750, 200, 40);
            logout.frame=CGRectMake(687, 15, 40, 40);
            lbl1.frame=CGRectMake(100,200,600,50);
            lbl2.frame=CGRectMake(100,300,600,50);
            lbl3.frame=CGRectMake(100,400,600,50);
            lbl4.frame=CGRectMake(100,500,600,50);
            lbl5.frame=CGRectMake(100,600,600,50);
        }else{
            Last_Scrol.frame=CGRectMake(0, 0, 320,480);
            
            image_bg.image=Iphone_Portrait4;
            image_bg.frame=CGRectMake(0,0,320,480);
            help_btn.frame=CGRectMake(120, 400, 110, 30);
            logout.frame=CGRectMake(279,2, 22, 22);
            lbl1.font=[UIFont systemFontOfSize:16];
            lbl2.font=[UIFont systemFontOfSize:16];
            lbl3.font=[UIFont systemFontOfSize:16];
            lbl4.font=[UIFont systemFontOfSize:16];
            lbl5.font=[UIFont systemFontOfSize:16];
            
            lbl1.frame=CGRectMake(40,100,260,50);
            lbl2.frame=CGRectMake(40,160,260,50);
            lbl3.frame=CGRectMake(40,220,260,50);
            lbl4.frame=CGRectMake(40,280,260,50);
            lbl5.frame=CGRectMake(40,340,260,50);
        }
    }
	return YES;
}

@end
