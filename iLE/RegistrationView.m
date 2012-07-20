//
//  RegistrationView.m
//  iLE
//
//  Created by Innoppl tech on 6/20/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "RegistrationView.h"


@implementation RegistrationView
UIButton *create_btn;
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
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
   // [self View_position];
}
- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{    countryArray = [[NSMutableArray alloc]initWithObjects:@"Afghanistan",
                 @"Albania",
                 @"Algeria",
                 @"American Samoa",
                 @"Andorra",
                 @"Angola",
                 @"Anguilla",
                 @"Antarctica",
                 @"Antigua",
                 @"Argentina",
                 @"Armenia",
                 @"Aruba",
                 @"Ascension",
                 @"Australia",
                 @"Australian External Territories",
                 @"Austria",
                 @"Azerbaijan",
                 @"Bahamas",
                 @"Bahrain",
                 @"Bangladesh",
                 @"Barbados",
                 @"Barbuda",
                 @"Belarus",
                 @"Belgium",
                 @"Belize",
                 @"Benin",
                 @"Bermuda",
                 @"Bhutan",
                 @"Bolivia",
                 @"Bosnia & Herzegovina",
                 @"Botswana",
                 @"Brazil",
                 @"British Virgin Islands",
                 @"Brunei Darussalam",
                 @"Bulgaria",
                 @"Burkina Faso",
                 @"Burundi",
                 @"Cambodia",
                 @"Cameroon",
                 @"Canada",
                 @"Cape Verde Islands",
                 @"Cayman Islands",
                 @"Central African Republic",
                 @"Chad",
                 @"Chatham Island (New Zealand)",
                 @"Chile",
                 @"China (PRC)",
                 @"Christmas Island",
                 @"Cocos-Keeling Islands",
                 @"Colombia",
                 @"Comoros",
                 @"Congo",
                 @"Congo, Dem. Rep. of  (former Zaire)",
                 @"Cook Islands",
                 @"Costa Rica",
                 @"Côte d'Ivoire (Ivory Coast)",
                 @"Croatia",
                 @"Cuba",
                 @"Cuba (Guantanamo Bay)",
                 @"Curaçao",
                 @"Cyprus",
                 @"Czech Republic",
                 @"Denmark",
                 @"Diego Garcia",
                 @"Djibouti",
                 @"Dominica",
                 @"Dominican Republic",
                 @"East Timor",
                 @"Easter Island",
                 @"Ecuador",
                 @"Egypt",
                 @"El Salvador",
                 @"Ellipso (Mobile Satellite service)",
                 @"EMSAT (Mobile Satellite service)",
                 @"Equatorial Guinea",
                 @"Eritrea",
                 @"Estonia",
                 @"Ethiopia",
                 @"Falkland Islands (Malvinas)",
                 @"Faroe Islands",
                 @"Fiji Islands",
                 @"Finland",
                 @"France",
                 @"French Antilles",
                 @"French Guiana",
                 @"French Polynesia",
                 @"Gabonese Republic",
                 @"Gambia",
                 @"Georgia",
                 @"Germany",
                 @"Ghana",
                 @"Gibraltar",
                 @"Global Mobile Satellite System (GMSS)",
                 @"Globalstar (Mobile Satellite Service)",
                 @"Greece",
                 @"Greenland",
                 @"Grenada",
                 @"Guadeloupe",
                 @"Guam",
                 @"Guantanamo Bay",
                 @"Guatemala",
                 @"Guinea-Bissau",
                 @"Guinea",
                 @"Guyana",
                 @"Haiti",
                 @"Honduras",
                 @"Hong Kong",
                 @"Hungary",
                 @"ICO Global (Mobile Satellite Service)",
                 @"Iceland",
                 @"India",
                 @"Indonesia",
                 @"Inmarsat (Atlantic Ocean - East)",
                 @"Inmarsat (Atlantic Ocean - West)",
                 @"Inmarsat (Indian Ocean)",
                 @"Inmarsat (Pacific Ocean)",
                 @"Inmarsat SNAC"
                 @"International Freephone Service",
                 @"International Shared Cost Service (ISCS)",
                 @"Iran",
                 @"Iraq",
                 @"Ireland",
                 @"Iridium (Mobile Satellite service)",
                 @"Israel",
                 @"Italy",
                 @"Jamaica",
                 @"Japan",
                 @"Jordan",
                 @"Kazakhstan",
                 @"Kenya",
                 @"Kiribati",
                 @"Korea (North)",
                 @"Korea (South)",
                 @"Kuwait",
                 @"Kyrgyz Republic",
                 @"Laos",
                 @"Latvia",
                 @"Lebanon",
                 @"Lesotho",
                 @"Liberia",
                 @"Libya",
                 @"Liechtenstein",
                 @"Lithuania",
                 @"Luxembourg",
                 @"Macao",
                 @"Macedonia (Former Yugoslav Rep of.)"
                 @"Madagascar",
                 @"Malawi",
                 @"Malaysia",
                 @"Maldives",
                 @"Mali Republic",
                 @"Malta",
                 @"Marshall Islands",
                 @"Martinique",
                 @"Mauritania",
                 @"Mauritius",
                 @"Mayotte Island",
                 @"Mexico",
                 @"Micronesia, (Federal States of)",
                 @"Midway Island",
                 @"Moldova",
                 @"Monaco",
                 @"Mongolia",
                 @"Montenegro",
                 @"Montserrat",
                 @"Morocco",
                 @"Mozambique",
                 @"Myanmar",
                 @"Namibia",
                 @"Nauru",
                 @"Nepal",
                 @"Netherlands",
                 @"Netherlands Antilles",
                 @"Nevis",
                 @"New Caledonia",
                 @"New Zealand",
                 @"Nicaragua",
                 @"Niger",
                 @"Nigeria",
                 @"Niue",
                 @"Norfolk Island",
                 @"Northern Marianas Islands",
                 @"Norway",
                 @"Oman",
                 @"Pakistan",
                 @"Palau",
                 @"Palestinian Settlements",
                 @"Panama",
                 @"Papua New Guinea",
                 @"Paraguay",
                 @"Peru",
                 @"Philippines",
                 @"Poland",
                 @"Portugal",
                 @"Puerto Rico",
                 @"Qatar",
                 @"Réunion Island",
                 @"Romania",
                 @"Russia",
                 @"Rwandese Republic",
                 @"St. Helena"
                 @"St. Kitts/Nevis",
                 @"St. Lucia",
                 @"St. Pierre & Miquelon",
                 @"St. Vincent & Grenadines",
                 @"Samoa",
                 @"San Marino",
                 @"São Tomé and Principe",
                 @"Saudi Arabia",
                 @"Senegal",
                 @"Serbia",
                 @"Seychelles Republic",
                 @"Sierra Leone",
                 @"Singapore",
                 @"Slovak Republic",
                 @"Slovenia",
                 @"Solomon Islands",
                 @"Somali Democratic Republic",
                 @"South Africa",
                 @"Spain",
                 @"Sri Lanka",
                 @"Sudan",
                 @"Suriname",
                 @"Swaziland",
                 @"Sweden",
                 @"Switzerland",
                 @"Syria",
                 @"Taiwan",
                 @"Tajikistan",
                 @"Tanzania",
                 @"Thailand",
                 @"Thuraya (Mobile Satellite service)",
                 @"Timor Leste",
                 @"Togolese Republic",
                 @"Tokelau",
                 @"Tonga Islands",
                 @"Trinidad & Tobago",
                 @"Tunisia",
                 @"Turkey",
                 @"Turkmenistan",
                 @"Turks and Caicos Islands",
                 @"Tuvalu",
                 @"Uganda",
                 @"Ukraine",
                 @"United Arab Emirates",
                 @"United Kingdom",
                 @"United States of America",
                 @"US Virgin Islands",
                 @"Universal Personal Telecommunications (UPT)",
                 @"Uruguay",
                 @"Uzbekistan",
                 @"Vanuatu",
                 @"Vatican City",
                 @"Venezuela",
                 @"Vietnam",
                 @"Wake Island",
                 @"Wallis and Futuna Islands",
                 @"Yemen",
                 @"Zambia",
                 @"Zanzibar",
                 @"Zimbabwe", nil];

    
    emailRegEx =@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        scrolViw=[[UIScrollView alloc]initWithFrame:CGRectMake(0,0,768,1024)];

    }else{
        scrolViw=[[UIScrollView alloc]initWithFrame:CGRectMake(0,0,320,460)];

    }
   // scrolViw=[[UIScrollView alloc]initWithFrame:CGRectMake(0,0,self.view.bounds.size.width,1024)];
    scrolViw.showsVerticalScrollIndicator=YES;
    scrolViw.userInteractionEnabled=YES;
    scrolViw.pagingEnabled=YES;
    scrolViw.multipleTouchEnabled=YES;
   // [scrolViw setBackgroundColor:[UIColor orangeColor]];
    scrolViw.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    scrolViw.bounces =YES;
    scrolViw.clipsToBounds=YES;
    scrolViw.scrollEnabled = YES;
    [self.view addSubview:scrolViw];

    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        imageview_bg=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"iLE-ipad-createaccount.png"]];
        imageview_bg.userInteractionEnabled=YES;
        [scrolViw addSubview:imageview_bg];
    }else{
        imageview_bg=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"iphone_register1.png"]];
        imageview_bg.userInteractionEnabled=YES;
        [scrolViw addSubview:imageview_bg];

    }
    [imageview_bg addSubview: [self tagvalue:1]];
    [imageview_bg addSubview: [self tagvalue:2]];
    [imageview_bg addSubview: [self tagvalue:3]];
    [imageview_bg addSubview: [self tagvalue:4]];
    [imageview_bg addSubview: [self tagvalue:5]];
    [imageview_bg addSubview: [self tagvalue:6]];
    [imageview_bg addSubview: [self tagvalue:7]];
    UITextField *txt1=(UITextField*)[scrolViw viewWithTag:1];
    UITextField *txt2=(UITextField*)[scrolViw viewWithTag:2];
    UITextField *txt3=(UITextField*)[scrolViw viewWithTag:3];
    UITextField *txt4=(UITextField*)[scrolViw viewWithTag:4];
    UITextField *txt5=(UITextField*)[scrolViw viewWithTag:5];
    UITextField *txt6=(UITextField*)[scrolViw viewWithTag:6];
    UITextField *txt7=(UITextField*)[scrolViw viewWithTag:7];
    txt4.keyboardType=UIKeyboardTypeNumbersAndPunctuation;
    txt5.keyboardType=UIKeyboardTypeEmailAddress;
    txt5.autocapitalizationType=UITextAutocapitalizationTypeNone;
    txt6.keyboardType=UIKeyboardTypeDefault;
    txt6.autocapitalizationType=UITextAutocapitalizationTypeNone;
    txt7.autocapitalizationType=UITextAutocapitalizationTypeNone;
    create_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [create_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [create_btn setTag:10];
    [imageview_bg addSubview:create_btn];
    [create_btn addTarget:self action:@selector(CallWebservice) forControlEvents:UIControlEventTouchUpInside];

    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        
    [txt4 addTarget:self action:@selector(Datebtnpressed:) forControlEvents:UIControlEventEditingDidBegin];
        
    }else{
        txt1.font=[UIFont systemFontOfSize:12];
        txt2.font=[UIFont systemFontOfSize:12];
        txt3.font=[UIFont systemFontOfSize:12];
        txt4.font=[UIFont systemFontOfSize:12];
        txt5.font=[UIFont systemFontOfSize:12];
        txt6.font=[UIFont systemFontOfSize:12];
        txt7.font=[UIFont systemFontOfSize:12];

   
        txt1.frame=CGRectMake(200, 84,92,27);
        txt2.frame=CGRectMake(200, 130,92,27);
        txt3.frame=CGRectMake(200, 177,92,27);
        txt4.frame=CGRectMake(200, 212,92,27);
        txt5.frame=CGRectMake(200, 257,92,27);
        txt6.frame=CGRectMake(200, 301,92,27);
        txt7.frame=CGRectMake(200, 351,92,27);
        create_btn.frame=CGRectMake(105, 365,175,30);
    [txt4 addTarget:self action:@selector(ip_Datebtnpressed:) forControlEvents:UIControlEventEditingDidBegin];


    }
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)ip_Datebtnpressed:(id)sender{
    
    myPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 44, 0, 0)];
    
    myPickerView.delegate = self;
    myPickerView.showsSelectionIndicator = YES;
    myPickerView.dataSource=self;
	aac = [[UIActionSheet alloc] initWithTitle:@"Picker View"
									  delegate:self
							 cancelButtonTitle:nil
						destructiveButtonTitle:nil
							 otherButtonTitles:nil];
    
	pickerDateToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
	pickerDateToolbar.barStyle = UIBarStyleBlackOpaque;
	[pickerDateToolbar sizeToFit];
	
	NSMutableArray *barItems = [[NSMutableArray alloc] init];
	
	
	UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
	[barItems addObject:flexSpace];
	
	UIBarButtonItem *okBtn = [[UIBarButtonItem alloc]initWithTitle:@"OK" style:UIBarButtonItemStyleBordered target:self action:@selector(DoneCliked)];
	[barItems addObject:okBtn];
	
	[pickerDateToolbar setItems:barItems animated:YES];
	
	[aac addSubview:pickerDateToolbar];
	[aac addSubview:myPickerView];
	[aac showInView:self.view];
    if (UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation))
    {
        [aac setBounds:CGRectMake(0,0,460, 320)];
        
    }else{
        [aac setBounds:CGRectMake(0,0,320, 464)];
	}
	[pickerDateToolbar release];
	[barItems release];
	[flexSpace release];
	[okBtn release];
    
}
-(void)DoneCliked{
    
	[aac dismissWithClickedButtonIndex:0 animated:YES];
    [aac release];
    UITextField *txt5=(UITextField*)[scrolViw viewWithTag:5];
    [txt5 becomeFirstResponder];
    
}

-(void)Datebtnpressed:(id)sender{
    
    UITextField *txt4=(UITextField*)[scrolViw viewWithTag:4];
    [txt4 resignFirstResponder];
    myPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0,0,350,216)];
    myPickerView.delegate = self;
    myPickerView.showsSelectionIndicator = YES;
    myPickerView.dataSource=self;

    
    UIViewController* popoverContent = [[UIViewController alloc] init];
    
	UIView* popoverView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 350, 330)];
	popoverView.backgroundColor = [UIColor clearColor];
    
		[popoverView addSubview:myPickerView]; 
    popoverContent.contentSizeForViewInPopover = CGSizeMake(myPickerView.frame.size.width, myPickerView.frame.size.height);
        
    popoverContent.view = popoverView;
	//create a popover controller
	popoverController = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
	popoverController.delegate = self;
    [popoverController presentPopoverFromRect:[sender frame] inView:imageview_bg permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES]   ; 
    
    //release the popover content
	[popoverView release];
	[popoverContent release];
    

}
- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController{
    
    
}
/*
-(void)pickerselection:(id)sender
{
    
    NSString *str2 = [self formatdate:datepicker.date];
    NSLog(@"string %@",str2);
    UITextField *txt3=(UITextField*)[scrolViw viewWithTag:3];
    [txt3 setText:str2];

}
*/
-(NSString *) formatdate:(NSDate *)date
{
	NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
	[dateFormat setDateFormat:@"dd/MM/YYYY"];
	NSString *datestring = [dateFormat stringFromDate:date];  
    [dateFormat release];
	return datestring;
    
}
-(void)CallWebservice{
    UITextField *txt1=(UITextField*)[scrolViw viewWithTag:1];
    UITextField *txt2=(UITextField*)[scrolViw viewWithTag:2];
    UITextField *txt3=(UITextField*)[scrolViw viewWithTag:3];
    UITextField *txt4=(UITextField*)[scrolViw viewWithTag:4];
    UITextField *txt5=(UITextField*)[scrolViw viewWithTag:5];
    UITextField *txt6=(UITextField*)[scrolViw viewWithTag:6];
    UITextField *txt7=(UITextField*)[scrolViw viewWithTag:7];

   /* NSPredicate *regExpred =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
	BOOL myStringCheck = [regExpred evaluateWithObject:txt5.text];
    
    
    
    if ([txt1.text length]==0) {
        [self callAlert:@"Please Enter First Name"];
        return;
    }
    else if ([txt2.text length]==0) {
        [self callAlert:@"Please Enter Full Name"];
        return;
        
    }
    else if(!myStringCheck){
        [self callAlert:@"Email address should be in yourname@domainname.com  format"];   
        return;
    }
    
    else if ([txt6.text length]==0) {
        [self callAlert:@"Password should have atleast 1 characters"]; 
        return;
    }
    else if([txt4.text length]==0){
        [self callAlert:@"Please Enter Zipcode"]; 
        return;
    }*/


    QuestionView *qview=[[QuestionView alloc]initWithNibName:@"QuestionView" bundle:nil];
    [self.navigationController pushViewController:qview animated:YES];
    
    
}
-(void)callAlert: (NSString*)message{
    
    
    UIAlertView *Alert = [[UIAlertView alloc]initWithTitle:@"Message" message:message delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil ];
    [Alert show];
    [Alert release];
    
    
}

#pragma Mark Picker Delegate

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    NSUInteger numRows = [countryArray count];
    
    return numRows;
}

// tell the picker how many components it will have
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
            NSString *gen=[NSString stringWithFormat:@"%@",[countryArray objectAtIndex:[pickerView selectedRowInComponent:0]]];
        NSLog(@"%@",gen);
    UITextField *txt4=(UITextField*)[scrolViw viewWithTag:4];

    [txt4 setText:gen];
    
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [countryArray objectAtIndex:row];
    
}


#pragma Mark Textfields Delegates
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return YES;
}
// return NO to disallow editing.
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.5];
    
    if (textField.tag==3) {
    scrolViw.contentOffset=CGPointMake(scrolViw.contentOffset.x,40);
    }else
    if (textField.tag==4) {
       // scrolViw.contentOffset=CGPointMake(scrolViw.contentOffset.x,50);
    }else if(textField.tag==5){
        scrolViw.contentOffset=CGPointMake(scrolViw.contentOffset.x,100);
    }else if(textField.tag==6){
        scrolViw.contentOffset=CGPointMake(scrolViw.contentOffset.x,170);
        
    }else if(textField.tag==7){
        scrolViw.contentOffset=CGPointMake(scrolViw.contentOffset.x,230);
    }
    [UIView commitAnimations];
    
}// became first responder
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    return YES;
}
// return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    UITextField *txt1=(UITextField*)[scrolViw viewWithTag:1];
    UITextField *txt2=(UITextField*)[scrolViw viewWithTag:2];
    UITextField *txt3=(UITextField*)[scrolViw viewWithTag:3];

    UITextField *txt4=(UITextField*)[scrolViw viewWithTag:4];
    UITextField *txt5=(UITextField*)[scrolViw viewWithTag:5];
    UITextField *txt6=(UITextField*)[scrolViw viewWithTag:6];
    UITextField *txt7=(UITextField*)[scrolViw viewWithTag:7];

    if (textField.tag==1) {
        [txt1 resignFirstResponder];
        [txt2 becomeFirstResponder];
    }else if(textField.tag==2){
        [txt2 resignFirstResponder];
        [txt3 becomeFirstResponder];
        
    }else if(textField.tag==3){
        [txt3 resignFirstResponder];
        scrolViw.contentOffset=CGPointMake(scrolViw.contentOffset.x,0);

       // [txt4 becomeFirstResponder];
    
    }
    else if(textField.tag==4){
        [txt4 resignFirstResponder];
       // [popoverController dismissPopoverAnimated:YES];
       // [txt5 becomeFirstResponder];
    }else if(textField.tag==5){
        [txt5 resignFirstResponder];
        [txt6 becomeFirstResponder];
    }else if(textField.tag==6){
        [txt6 resignFirstResponder];
        [txt7 becomeFirstResponder];
    }else if(textField.tag==7){
        [txt7 resignFirstResponder];
        scrolViw.contentOffset=CGPointMake(scrolViw.contentOffset.x,0);

    }
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

-(UITextField*)tagvalue:(NSUInteger)tag{
    
    UITextField *txtf=[[UITextField alloc]init];
    txtf.delegate = self;
    [txtf setTag:tag];
   // [txtf setBorderStyle:UITextBorderStyleRoundedRect];
    [txtf setBackgroundColor:[UIColor clearColor]];
    txtf.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    txtf.textColor=[UIColor blackColor];
    txtf.textAlignment = UITextAlignmentCenter;
    txtf.autocapitalizationType=UITextAutocapitalizationTypeSentences;
    txtf.returnKeyType=UIReturnKeyNext;
    txtf.autocorrectionType=UITextAutocorrectionTypeNo;
    return [txtf autorelease];
}
-(UILabel*)lblframe:(CGRect)rect text:(NSString*)text{
    
    UILabel *lbl=[[UILabel alloc]initWithFrame:rect];
    [lbl setText:text];
    [lbl setTextColor:[UIColor whiteColor]];
    [lbl setBackgroundColor:[UIColor clearColor]];
    [lbl setFont:[UIFont boldSystemFontOfSize:18]];
    lbl.lineBreakMode=UILineBreakModeWordWrap;
    lbl.numberOfLines=2;
    return [lbl autorelease];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
-(void)View_position{
    UITextField *txt1=(UITextField*)[scrolViw viewWithTag:1];
    UITextField *txt2=(UITextField*)[scrolViw viewWithTag:2];
    UITextField *txt3=(UITextField*)[scrolViw viewWithTag:3];
    UITextField *txt4=(UITextField*)[scrolViw viewWithTag:4];
    UITextField *txt5=(UITextField*)[scrolViw viewWithTag:5];
    UITextField *txt6=(UITextField*)[scrolViw viewWithTag:6];
    UITextField *txt7=(UITextField*)[scrolViw viewWithTag:7];
    if (UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation)){
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
           
            scrolViw.frame=CGRectMake(0,0,1024,768);
            imageview_bg.image=[UIImage imageNamed:@"create1.png"];
            imageview_bg.frame=scrolViw.frame;
            txt1.frame=CGRectMake(640, 139,225,40);
            txt2.frame=CGRectMake(640, 206,225,40);
            // txt3.frame=CGRectMake(640, 305,250,40);
            txt4.frame=CGRectMake(640, 278,225,40);
            txt5.frame=CGRectMake(640, 346,225,40);
            txt6.frame=CGRectMake(640, 411,225,40);
            txt7.frame=CGRectMake(640, 481,225,40);
            create_btn.frame=CGRectMake(420, 592,225,40);
        }else{
            scrolViw.frame=CGRectMake(0,0,480,380);
            
            imageview_bg.image=[UIImage imageNamed:@"register_ipn.png"];
            imageview_bg.frame=scrolViw.frame;
            scrolViw.contentSize=CGSizeMake(480,440);
            
            txt1.font=[UIFont systemFontOfSize:12];
            txt2.font=[UIFont systemFontOfSize:12];
            //txt3.font=[UIFont systemFontOfSize:12];
            txt4.font=[UIFont systemFontOfSize:12];
            txt5.font=[UIFont systemFontOfSize:12];
            txt6.font=[UIFont systemFontOfSize:12];
            txt7.font=[UIFont systemFontOfSize:12];
            
            
            txt1.frame=CGRectMake(300, 81,120,27);
            txt2.frame=CGRectMake(300, 121,120,27);
            // txt3.frame=CGRectMake(200, 177,92,27);
            txt4.frame=CGRectMake(300, 155,120,27);
            txt5.frame=CGRectMake(300, 187,120,27);
            txt6.frame=CGRectMake(300, 227,120,27);
            txt7.frame=CGRectMake(300, 258,120,27);
            create_btn.frame=CGRectMake(168, 311,125,30);

        }

        
    }else{
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            scrolViw.frame=CGRectMake(0,0,768,1024);
            imageview_bg.image=[UIImage imageNamed:@"iLE-ipad-createaccount1.png"];
            imageview_bg.frame=scrolViw.frame;
            txt1.frame=CGRectMake(458, 237,190,43);
            txt2.frame=CGRectMake(458, 324,190,40);
            // txt3.frame=CGRectMake(465, 390,170,40);
            txt4.frame=CGRectMake(458, 408,190,40);
            txt5.frame=CGRectMake(458, 500,190,40);
            txt6.frame=CGRectMake(458, 595,190,40);
            txt7.frame=CGRectMake(458, 680,190,40);
            create_btn.frame=CGRectMake(300, 810,165,43);            
        }else{
            scrolViw.frame=CGRectMake(0,0,320,480);
            scrolViw.scrollEnabled=NO;
            imageview_bg.image=[UIImage imageNamed:@"iphone_register1.png"];
            imageview_bg.frame=scrolViw.frame;
            txt1.font=[UIFont systemFontOfSize:12];
            txt2.font=[UIFont systemFontOfSize:12];
            //txt3.font=[UIFont systemFontOfSize:12];
            txt4.font=[UIFont systemFontOfSize:12];
            txt5.font=[UIFont systemFontOfSize:12];
            txt6.font=[UIFont systemFontOfSize:12];
            txt7.font=[UIFont systemFontOfSize:12];
            
            
            txt1.frame=CGRectMake(200, 84,92,27);
            txt2.frame=CGRectMake(200, 130,92,27);
            // txt3.frame=CGRectMake(200, 177,92,27);
            txt4.frame=CGRectMake(200, 177,92,27);
            txt5.frame=CGRectMake(200, 212,92,27);
            txt6.frame=CGRectMake(200, 257,92,27);
            txt7.frame=CGRectMake(200, 301,92,27);
            create_btn.frame=CGRectMake(105, 365,175,30);
        }

        
    }

    
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if (UIInterfaceOrientationIsLandscape(interfaceOrientation)) {
        UITextField *txt1=(UITextField*)[scrolViw viewWithTag:1];
        UITextField *txt2=(UITextField*)[scrolViw viewWithTag:2];
        UITextField *txt3=(UITextField*)[scrolViw viewWithTag:3];
        UITextField *txt4=(UITextField*)[scrolViw viewWithTag:4];
        UITextField *txt5=(UITextField*)[scrolViw viewWithTag:5];
        UITextField *txt6=(UITextField*)[scrolViw viewWithTag:6];
        UITextField *txt7=(UITextField*)[scrolViw viewWithTag:7];
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            
            scrolViw.frame=CGRectMake(0,0,1024,768);
            imageview_bg.image=Ipad_Landscape2;
            imageview_bg.frame=scrolViw.frame;
            txt1.frame=CGRectMake(590, 170,200,40);
            txt2.frame=CGRectMake(590, 245,200,40);
            txt3.frame=CGRectMake(590, 312,200,40);
            txt4.frame=CGRectMake(590, 374,200,40);
            txt5.frame=CGRectMake(590, 437,200,40);
            txt6.frame=CGRectMake(590, 510,200,40);
            txt7.frame=CGRectMake(590, 578,200,40);
            create_btn.frame=CGRectMake(435, 685,200,40);
        }else{
            scrolViw.frame=CGRectMake(0,0,480,380);
            scrolViw.scrollEnabled=YES;

            imageview_bg.image=Iphone_Landscape2;
            imageview_bg.frame=scrolViw.frame;
            scrolViw.contentSize=CGSizeMake(480,440);
           
            txt1.font=[UIFont systemFontOfSize:12];
            txt2.font=[UIFont systemFontOfSize:12];
            txt3.font=[UIFont systemFontOfSize:12];
            txt4.font=[UIFont systemFontOfSize:12];
            txt5.font=[UIFont systemFontOfSize:12];
            txt6.font=[UIFont systemFontOfSize:12];
            txt7.font=[UIFont systemFontOfSize:12];
            
            
            txt1.frame=CGRectMake(290, 78,92,27);
            txt2.frame=CGRectMake(290, 106,92,27);
             txt3.frame=CGRectMake(290, 142,92,27);
            txt4.frame=CGRectMake(290, 170,92,27);
            txt5.frame=CGRectMake(290, 213,92,27);
            txt6.frame=CGRectMake(290, 247,92,27);
            txt7.frame=CGRectMake(290, 280,92,27);
            create_btn.frame=CGRectMake(172, 314,125,30);
        }
        
    }else if(UIInterfaceOrientationIsPortrait(interfaceOrientation)){
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            UITextField *txt1=(UITextField*)[scrolViw viewWithTag:1];
            UITextField *txt2=(UITextField*)[scrolViw viewWithTag:2];
            UITextField *txt3=(UITextField*)[scrolViw viewWithTag:3];
            UITextField *txt4=(UITextField*)[scrolViw viewWithTag:4];
            UITextField *txt5=(UITextField*)[scrolViw viewWithTag:5];
            UITextField *txt6=(UITextField*)[scrolViw viewWithTag:6];
            UITextField *txt7=(UITextField*)[scrolViw viewWithTag:7];
            scrolViw.frame=CGRectMake(0,0,768,1024);
            imageview_bg.image=Ipad_Portrait2;
            imageview_bg.frame=scrolViw.frame;
            txt1.frame=CGRectMake(480, 210,190,43);
            txt2.frame=CGRectMake(480, 286,190,40);
            txt3.frame=CGRectMake(480, 358,190,40);
            txt4.frame=CGRectMake(480, 448,190,40);
            txt5.frame=CGRectMake(480, 528,190,40);
            txt6.frame=CGRectMake(480, 614,190,40);
            txt7.frame=CGRectMake(480, 688,190,40);
            create_btn.frame=CGRectMake(300, 808,165,43);

        }else{
            scrolViw.frame=CGRectMake(0,0,320,480);
            scrolViw.scrollEnabled=NO;
            imageview_bg.image=Iphone_Portrait2;
            imageview_bg.frame=scrolViw.frame;
            UITextField *txt1=(UITextField*)[scrolViw viewWithTag:1];
            UITextField *txt2=(UITextField*)[scrolViw viewWithTag:2];
            UITextField *txt3=(UITextField*)[scrolViw viewWithTag:3];

            UITextField *txt4=(UITextField*)[scrolViw viewWithTag:4];
            UITextField *txt5=(UITextField*)[scrolViw viewWithTag:5];
            UITextField *txt6=(UITextField*)[scrolViw viewWithTag:6];
            UITextField *txt7=(UITextField*)[scrolViw viewWithTag:7];
            txt1.font=[UIFont systemFontOfSize:12];
            txt2.font=[UIFont systemFontOfSize:12];
            txt4.font=[UIFont systemFontOfSize:12];
            txt5.font=[UIFont systemFontOfSize:12];
            txt6.font=[UIFont systemFontOfSize:12];
            txt7.font=[UIFont systemFontOfSize:12];
            
            
            txt1.frame=CGRectMake(198, 94,92,27);
            txt2.frame=CGRectMake(198, 136,92,27);
             txt3.frame=CGRectMake(198, 184,92,27);
            txt4.frame=CGRectMake(198, 222,92,27);
            txt5.frame=CGRectMake(198, 267,92,27);
            txt6.frame=CGRectMake(198, 311,92,27);
            txt7.frame=CGRectMake(198, 352,92,27);
            create_btn.frame=CGRectMake(100, 410,135,30);
        }
    }

	return YES;
}

@end
