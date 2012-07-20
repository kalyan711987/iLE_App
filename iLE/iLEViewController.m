//
//  iLEViewController.m
//  iLE
//
//  Created by Innoppl tech on 6/18/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "iLEViewController.h"

@implementation iLEViewController
UIButton *comput_btn;
UIButton *Reg_btn;
UIButton  *forgotbtn;
- (void)dealloc
{
    [parseArray release];
    [parseValue release];
    [ParseDic release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
  //Setting the frame when comes back from QuestionView or LifeEstimatedView   
    [self SignView_position];
    
    
}
-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
}
#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    
    parseArray=[[NSMutableArray alloc]init];
    parseValue=[[NSMutableArray alloc]init];
    ParseDic=[[NSMutableDictionary alloc]init];
    
   //Removing all items in appdelegate array 
    
    [[iLEAppDelegate setvalue] removeAllObjects];
   // [self.view setBackgroundColor:[UIColor colorWithRed:0.0 green:0.0 blue:8.0 alpha:0.3]];
    
    
    self.navigationController.navigationBarHidden=YES;
    
    Login_Scrol=[[UIScrollView alloc]initWithFrame:CGRectMake(0,0,self.view.bounds.size.width,self.view.bounds.size.height)];    
    Login_Scrol.userInteractionEnabled=YES;
    [self.view addSubview:Login_Scrol];
  //Saparate code for ipad and iphone  
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        logimage_bg=[[UIImageView alloc]initWithImage:Ipad_Portrait1];
        logimage_bg.userInteractionEnabled=YES;
        [Login_Scrol addSubview:logimage_bg];
        
    }else{
        
        logimage_bg=[[UIImageView alloc]initWithImage:Iphone_Portrait1];
        logimage_bg.userInteractionEnabled=YES;
        [Login_Scrol addSubview:logimage_bg];
    }
   
    [logimage_bg addSubview: [self tagvalue:1]];
    [logimage_bg addSubview: [self tagvalue:2]];
    
    Reg_btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [Reg_btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    Reg_btn.titleLabel.font=[UIFont boldSystemFontOfSize:20];
    [Reg_btn setTag:10];
    [logimage_bg addSubview:Reg_btn];
    [Reg_btn addTarget:self action:@selector(CallRegisterView) forControlEvents:UIControlEventTouchUpInside];
  
    comput_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [comput_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    comput_btn.titleLabel.font=[UIFont boldSystemFontOfSize:20];
    [comput_btn setTag:10];
    [logimage_bg addSubview:comput_btn];
    [comput_btn addTarget:self action:@selector(SignInWeb) forControlEvents:UIControlEventTouchUpInside];
    
    forgotbtn =[UIButton buttonWithType:UIButtonTypeCustom];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        [forgotbtn setImage:[UIImage imageNamed:@"Forgot_Password_ipad.png"] forState:UIControlStateNormal];

    }else{
        [forgotbtn setImage:[UIImage imageNamed:@"Forgot_password_iphone.png"] forState:UIControlStateNormal];

    }
    [logimage_bg addSubview:forgotbtn];
    [forgotbtn addTarget:self action:@selector(ForgotbtnCLicked:) forControlEvents:UIControlEventTouchUpInside];
    forgotbtn.frame=CGRectMake(75,300,164,40);
    
    UITextField *email=(UITextField*)[logimage_bg viewWithTag:1];
    UITextField *pass=(UITextField*)[logimage_bg viewWithTag:2];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
   
        email.frame=CGRectMake(378, 346,210,45);
        pass.frame=CGRectMake(378, 465,210,45);
        Reg_btn.frame=CGRectMake(226,600,350,38);
        comput_btn.frame=CGRectMake(276,737,230,39);
        
    }else{
        
        email.frame=CGRectMake(150, 145,127,30);
        pass.frame=CGRectMake(150,192,127,30);
        Reg_btn.frame=CGRectMake(60,241,210,25);
        comput_btn.frame=CGRectMake(100,293,117,30);
    }
 
    email.placeholder=@"Email";
    pass.placeholder=@"Password";
    email.keyboardType=UIKeyboardTypeEmailAddress;
    pass.keyboardType=UIKeyboardTypeDefault;
    [Login_Scrol release];
    [logimage_bg release];
   //Checking for login ? Wheather user is login or not . 
    NSUserDefaults *LoginInfo=[NSUserDefaults standardUserDefaults];
   // NSLog(@"*******)%@  *********%@",[LoginInfo objectForKey:@"Email"],[LoginInfo objectForKey:@"Password"] );

   if ([LoginInfo objectForKey:@"Password"]!=nil) {
        UITextField *email=(UITextField*)[logimage_bg viewWithTag:1];
        UITextField *pass=(UITextField*)[logimage_bg viewWithTag:2];
        email.text=[LoginInfo objectForKey:@"Email"];
        pass.text=[LoginInfo objectForKey:@"Password"];
       // NSLog(@"*******)%@  *********%@",[LoginInfo objectForKey:@"Email"],[LoginInfo objectForKey:@"Password"] );
        [self performSelector:@selector(SignInWeb)];
    }
    
    [super viewDidLoad];

   
}
/*
-(void)ForgotbtnCLicked:(id)sender{
    
    
    UIAlertView *createNewAlert =[[UIAlertView alloc] initWithTitle:@"ADD item" message:@"Put it blank textfield will cover this" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    
    UITextField *txtName = [[UITextField alloc] initWithFrame:CGRectMake(12.0, 45.0, 260.0, 25.0)];
    txtName.text=@" WoW";
    [txtName setBackgroundColor:[UIColor whiteColor]];
    [txtName setKeyboardAppearance:UIKeyboardAppearanceAlert];
    [txtName setAutocorrectionType:UITextAutocorrectionTypeNo];
    
    [txtName setTextAlignment:UITextAlignmentCenter];
    [createNewAlert addSubview:txtName];
    
    
    [createNewAlert show];
}*/
-(void)ForgotbtnCLicked:(id)sender{
    [parseArray removeAllObjects];
    [parseValue removeAllObjects];
    [ParseDic removeAllObjects];

    //Showing loading alert
    HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    [self.navigationController.view addSubview:HUD];
    HUD.delegate = self;
    HUD.labelText = @"Loading";
    [HUD show:YES];

    isForgotpswd=NO;

    NSString *soapMsg = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                         "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                         "<soap:Body>\n"
                         "<PasswordRequest xmlns=\"http://tempuri.org/\">\n"
                         "<email>%@</email>\n"
                         "</PasswordRequest>\n"
                         "</soap:Body>\n"
                         "</soap:Envelope>\n",[[NSUserDefaults standardUserDefaults] objectForKey:@"Email"]];
    
   // NSLog(@"email.....%@",soapMsg);
    NSURL *url = [NSURL URLWithString:ServerRequest];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    [request setDelegate:self];
   // [request setTimeOutSeconds:60.0];
    [request addRequestHeader:@"SOAPAction" value:@"urn:WebserviceControllerwsdl#Login"];
    [request addRequestHeader:@"Content-Type" value:@"text/xml; charset=utf-8"];
    [request appendPostData:[soapMsg dataUsingEncoding:NSUTF8StringEncoding]];
    [request setShouldPresentCredentialsBeforeChallenge:YES];
    [request addBasicAuthenticationHeaderWithUsername:AUT_PASSWORD andPassword:nil];
    [request setRequestMethod:@"POST"];
    [request setDidFinishSelector:@selector(Sucessresponse:)];
    [request setDidFailSelector:@selector(Failresponse:)];
    [request startAsynchronous];

}

#pragma Mark Webservice Implementation
//**** Connecting to the sign in request *********//
-(void)SignInWeb{
    [parseArray removeAllObjects];
    [parseValue removeAllObjects];
    [ParseDic removeAllObjects];

    isForgotpswd=YES;

    HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    [self.navigationController.view addSubview:HUD];
    HUD.delegate = self;
    HUD.labelText = @"Loading";
    [HUD show:YES];
   
    UITextField *email=(UITextField*)[logimage_bg viewWithTag:1];
    UITextField *pass=(UITextField*)[logimage_bg viewWithTag:2];
    
    NSString *soapMsg = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                         "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                         "<soap:Body>\n"
                         "<Login xmlns=\"http://tempuri.org/\">\n"
                         "<email>%@</email>\n"
                         "<password>%@</password>\n"
                         "</Login>\n"
                         "</soap:Body>\n"
                         "</soap:Envelope>\n",email.text,pass.text];

    NSURL *url = [NSURL URLWithString:ServerRequest];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    //[request setTimeOutSeconds:60.0];
    [request setDelegate:self];
    [request addRequestHeader:@"SOAPAction" value:@"urn:WebserviceControllerwsdl#Login"];
    [request addRequestHeader:@"Content-Type" value:@"text/xml; charset=utf-8"];
    [request appendPostData:[soapMsg dataUsingEncoding:NSUTF8StringEncoding]];  
    [request setShouldPresentCredentialsBeforeChallenge:YES];
    [request addBasicAuthenticationHeaderWithUsername:AUT_PASSWORD andPassword:nil];
    [request setRequestMethod:@"POST"];
    [request setDidFinishSelector:@selector(Sucessresponse:)];
    [request setDidFailSelector:@selector(Failresponse:)];
    [request startAsynchronous];
}


-(void)CallRegisterView{
    
    RegistrationView *regis=[[RegistrationView alloc]initWithNibName:@"RegistrationView" bundle:nil];
    [self.navigationController pushViewController:regis animated:YES];
    [regis release];
}

-(void)Sucessresponse:(ASIFormDataRequest*)req{
    
    [parseArray removeAllObjects];
    NSString *responseString=[req responseString];
    NSLog(@"%@",responseString);
    NSString *trim = [responseString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    const char *urtfstring = [trim UTF8String];
    
    NSData *someData = [NSData dataWithBytes:urtfstring length:strlen(urtfstring)];
  
    if ([req responseStatusCode]==200) {
    myxmlparser=[[NSXMLParser alloc] initWithData:someData];
    myxmlparser.delegate=self;  
    [myxmlparser setShouldResolveExternalEntities:YES];	
    [myxmlparser parse];
    }else{
        [HUD hide:YES];
        UIAlertView *responsealert=[[UIAlertView alloc]initWithTitle:@"Error" message:[req responseStatusMessage] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [responsealert show];
        [responsealert release];
    }
}
-(void)Failresponse:(ASIFormDataRequest*)req{
    [HUD hide:YES];
    UIAlertView *responsealert=[[UIAlertView alloc]initWithTitle:@"Error" message:[[req error]localizedDescription] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [responsealert show];
    [responsealert release];
}
#pragma Maek XMLParser Delegate

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict{
    
        
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Message" message:[parseError localizedDescription] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alert show];
    [alert release];
}

- (void)parser:(NSXMLParser *)parser validationErrorOccurred:(NSError *)validationError
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Message" message:[validationError localizedDescription] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alert show];
    [alert release];
}


-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    if(tempstr!=nil && [tempstr retainCount]>0) { 
		[tempstr release];
        tempstr=nil; 
	}
	tempstr=[[NSString alloc] initWithString:string];
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    if([elementName isEqualToString:@"value"]){
        [parseValue addObject:tempstr];
	}else if([elementName isEqualToString:@"key"]){
        [parseArray addObject:tempstr];
    }
    
    
}
-(void)parserDidEndDocument:(NSXMLParser *)parser{
    [HUD hide:YES];
    //NSLog(@"%@",ParseDic);
    for (int i=0; i<[parseArray count]; i++) {
        [ParseDic setObject:[parseValue objectAtIndex:i] forKey:[parseArray objectAtIndex:i]];
    }
    if (isForgotpswd) {
 // Called when sign in button is clicked   
    if ([[ParseDic objectForKey:@"status"] isEqualToString:@"0"] ) {
        
        UIAlertView *alet=[[UIAlertView alloc]initWithTitle:@"Login" message:@"Invalid Email/Password"
        delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alet show];
        [alet release];
        
    }else if([[ParseDic objectForKey:@"status"] isEqualToString:@"1"] && [[ParseDic objectForKey:@"mailverified"] isEqualToString:@"false"]){
        
        UIAlertView *alet=[[UIAlertView alloc]initWithTitle:@"" message:@"Please verify your account!"
                                                   delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alet show];
        [alet release];
    
    }else{
        UITextField *email=(UITextField*)[logimage_bg viewWithTag:1];
        UITextField *pass=(UITextField*)[logimage_bg viewWithTag:2];
        
        NSUserDefaults *logininInfo=[NSUserDefaults standardUserDefaults];
        [logininInfo setObject:email.text forKey:@"Email"];
        [logininInfo setObject:pass.text forKey:@"Password"];
        [logininInfo synchronize];
        email.text=nil;
        pass.text=nil;
 //Saving UserID in class Dictionary    
        [[iLEAppDelegate setvalue]setObject:[ParseDic objectForKey:@"userid"] forKey:@"UserID"];
 //Calling the questionview        
        QuestionView *qviw=[[QuestionView alloc]initWithNibName:@"QuestionView" bundle:nil];
        [self.navigationController pushViewController:qviw animated:YES];
        [qviw release];
      }
   
    }else{
        
 // Called when forgot password button is clicked
        NSString *alertmsg=[NSString stringWithFormat:@"Your password has been sent to your registered email id %@",[[NSUserDefaults standardUserDefaults] objectForKey:@"Email"]];
        UIAlertView *Falert=[[UIAlertView alloc]initWithTitle:@"" message:alertmsg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [Falert show];
        [Falert release];

        
    }
    [myxmlparser release];
    
}

#pragma Mark Textfields Delegates
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.5];
    

    Login_Scrol.contentOffset=CGPointMake(0,textField.frame.origin.y-50);
    [UIView commitAnimations];

}// became first responder

// return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
    
    Login_Scrol.contentOffset=CGPointMake(0,0);
    
    
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string 
{
    UITextField *pass=(UITextField*)[logimage_bg viewWithTag:2];

    
    if (textField==pass) {
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return (newLength > 16) ? NO : YES;
    }

    return YES;
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    UITextField *Fname=(UITextField*)[logimage_bg viewWithTag:1];
    UITextField *pass=(UITextField*)[logimage_bg viewWithTag:2];
    if (textField.tag==1) {
        [Fname resignFirstResponder];
        [pass becomeFirstResponder];
    }else if(textField.tag==2){
        [pass resignFirstResponder];
        
    }

    [textField resignFirstResponder];
    
    return YES;
}
#pragma mark MBProgressHUDDelegate methods

- (void)hudWasHidden:(MBProgressHUD *)hud {
	// Remove HUD from screen when the HUD was hidded
	[HUD removeFromSuperview];
	[HUD release];
	HUD = nil;
}


//**************Custom Text field Class ************//
-(UITextField*)tagvalue:(NSUInteger)tag{
    
    UITextField *txtf=[[UITextField alloc]init];
    txtf.delegate = self;
    [txtf setTag:tag];
    [txtf setBorderStyle:UITextBorderStyleRoundedRect];
    [txtf setBackgroundColor:[UIColor clearColor]];
    txtf.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    txtf.textColor=[UIColor blackColor];
    txtf.textAlignment = UITextAlignmentCenter;
    txtf.autoresizingMask=UIViewAutoresizingFlexibleRightMargin;
    txtf.autocapitalizationType=UITextAutocapitalizationTypeNone;
    txtf.returnKeyType=UIReturnKeyNext;
    txtf.autocorrectionType=UITextAutocorrectionTypeNo;

    return [txtf autorelease];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
#pragma Mark Landscape & Portrait

-(void)SignView_position{
    UITextField *email=(UITextField*)[logimage_bg viewWithTag:1];
    UITextField *pass=(UITextField*)[logimage_bg viewWithTag:2];

    pass.secureTextEntry=YES;

    if (UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation)){
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            logimage_bg.image=nil;
            
            Login_Scrol.frame=CGRectMake(0,0,1024,768);
            logimage_bg.image=Ipad_Landscape1;
            logimage_bg.frame=Login_Scrol.frame;
            email.font=[UIFont systemFontOfSize:18];
            
            email.frame=CGRectMake(320, 219,400,45);
            pass.frame=CGRectMake(320, 292,400,45);
            forgotbtn.frame=CGRectMake(397,560,220,60);

            Reg_btn.frame=CGRectMake(290,355,450,38);
            comput_btn.frame=CGRectMake(390,437,240,50);
            
        }else{
            Login_Scrol.frame=CGRectMake(0,0,480,350);
            Login_Scrol.contentSize=CGSizeMake(480,400);
            
            logimage_bg.image=Iphone_Landscape1;
            logimage_bg.frame=Login_Scrol.frame;
            
            email.frame=CGRectMake(150, 90,172,30);
            pass.frame=CGRectMake(150,136,172,30);
            forgotbtn.frame=CGRectMake(165,273,164,40);

            Reg_btn.frame=CGRectMake(120,195,230,25);
            comput_btn.frame=CGRectMake(180,238,117,30);
        }

        
        
    }else if(UIInterfaceOrientationIsPortrait([UIDevice currentDevice].orientation)){
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            logimage_bg.image=nil;
            Login_Scrol.frame=CGRectMake(0,0,768,1024);
            logimage_bg.image=Ipad_Portrait1;
            logimage_bg.frame=Login_Scrol.frame;
            email.font=[UIFont systemFontOfSize:18];
            email.frame=CGRectMake(204, 260,375,45);
            pass.frame=CGRectMake(204,335,375,45);
            forgotbtn.frame=CGRectMake(275,650,224,60);

            Reg_btn.frame=CGRectMake(226,442,375,38);
            comput_btn.frame=CGRectMake(275,520,218,55);
            
        }else{
            Login_Scrol.frame=CGRectMake(0,0,320,480);
            logimage_bg.image=Iphone_Portrait1;
            logimage_bg.frame=Login_Scrol.frame;
            Login_Scrol.scrollEnabled=NO;
            email.frame=CGRectMake(100, 126,147,30);
            pass.frame=CGRectMake(100,180,147,30);
            forgotbtn.frame=CGRectMake(85,315,164,40);

            Reg_btn.frame=CGRectMake(55,218,230,25);
            comput_btn.frame=CGRectMake(100,256,117,30);
        }
        

    }
        
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    UITextField *email=(UITextField*)[logimage_bg viewWithTag:1];
    UITextField *pass=(UITextField*)[logimage_bg viewWithTag:2];

    pass.secureTextEntry=YES;
    
    if (UIDeviceOrientationIsLandscape(interfaceOrientation)){
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            logimage_bg.image=nil;
            
            Login_Scrol.frame=CGRectMake(0,0,1024,768);
            logimage_bg.image=Ipad_Landscape1;
            logimage_bg.frame=Login_Scrol.frame;
            email.font=[UIFont systemFontOfSize:18];
            
            email.frame=CGRectMake(320, 219,400,45);
            pass.frame=CGRectMake(320, 292,400,45);
            forgotbtn.frame=CGRectMake(397,560,220,60);

            Reg_btn.frame=CGRectMake(290,355,450,38);
            comput_btn.frame=CGRectMake(390,437,240,50);
            
        }else{
            Login_Scrol.frame=CGRectMake(0,0,480,350);
            Login_Scrol.contentSize=CGSizeMake(480,400);
            
            logimage_bg.image=Iphone_Landscape1;
            logimage_bg.frame=Login_Scrol.frame;
            
            email.frame=CGRectMake(155, 90,172,30);
            pass.frame=CGRectMake(155,136,172,30);
            forgotbtn.frame=CGRectMake(165,273,164,40);

            Reg_btn.frame=CGRectMake(120,195,230,25);
            comput_btn.frame=CGRectMake(180,238,117,30);
        }
        
        
        
    }else{
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            logimage_bg.image=nil;
            Login_Scrol.frame=CGRectMake(0,0,768,1024);
            logimage_bg.image=Ipad_Portrait1;
            logimage_bg.frame=Login_Scrol.frame;
            email.font=[UIFont systemFontOfSize:18];
            email.frame=CGRectMake(204, 260,375,45);
            pass.frame=CGRectMake(204,335,375,45);
            forgotbtn.frame=CGRectMake(275,650,224,60);

            Reg_btn.frame=CGRectMake(226,442,375,38);
            comput_btn.frame=CGRectMake(275,520,218,55);
            
        }else{
            Login_Scrol.frame=CGRectMake(0,0,320,480);
            logimage_bg.image=Iphone_Portrait1;
            logimage_bg.frame=Login_Scrol.frame;
            Login_Scrol.scrollEnabled=NO;
            email.frame=CGRectMake(90, 126,147,30);
            pass.frame=CGRectMake(90,180,147,30);
            forgotbtn.frame=CGRectMake(85,315,164,40);

            Reg_btn.frame=CGRectMake(55,218,230,25);
            comput_btn.frame=CGRectMake(100,256,117,30);
        }
        
    }
    return YES;
}

@end
