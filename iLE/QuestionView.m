//
//  QuestionView.m
//  iLE
//
//  Created by Innoppl tech on 6/20/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "QuestionView.h"


@implementation QuestionView
UIButton *compute_btn;
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

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    scrollviw =[[UIScrollView alloc]init];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        scrollviw.frame=CGRectMake(0,0,self.view.bounds.size.width,1024);
        
    }else{
        scrollviw.frame=CGRectMake(0,0,self.view.bounds.size.width,self.view.bounds.size.height);
        
    }
    scrollviw.showsVerticalScrollIndicator=YES;
    scrollviw.userInteractionEnabled=YES;
    scrollviw.pagingEnabled=YES;
    scrollviw.multipleTouchEnabled=YES;
  //  [scrollviw setBackgroundColor:[UIColor orangeColor]];
    scrollviw.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    scrollviw.bounces =YES;
    scrollviw.clipsToBounds=YES;
    scrollviw.scrollEnabled = YES;
   // scrollviw.contentSize=CGSizeMake(self.view.bounds.size.width,900);
    // [scrollviw setDelegate:self];
    [self.view addSubview:scrollviw];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        image_bg=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"iLE-estimate1.png"]];
        image_bg.userInteractionEnabled=YES;
        [scrollviw addSubview:image_bg];
    }else{
        image_bg=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"iphone_compute LE.png"]];
        image_bg.userInteractionEnabled=YES;
        [scrollviw addSubview:image_bg];
    }
   // [self.view setBackgroundColor:[UIColor orangeColor]];
    [scrollviw addSubview:[self tagvalue:503]];
    [scrollviw addSubview:[self tagvalue:504]];
    [scrollviw addSubview:[self tagvalue:505]];
    UITextField *Weight=(UITextField*)[scrollviw viewWithTag:503];
    UITextField *Height=(UITextField*)[scrollviw viewWithTag:504];
    UITextField *No_Drinks=(UITextField*)[scrollviw viewWithTag:505];
    
    Weight.keyboardType=UIKeyboardTypeNumbersAndPunctuation;
    Height.keyboardType=UIKeyboardTypeNumbersAndPunctuation;
    No_Drinks.keyboardType=UIKeyboardTypeNumbersAndPunctuation;
    
   

    genderbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    genderbtn.tag=101;
    [genderbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [scrollviw addSubview:genderbtn];
    
    smoke_cig_week=[UIButton buttonWithType:UIButtonTypeCustom];
    smoke_cig_week.tag=102;
    [smoke_cig_week setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [scrollviw addSubview:smoke_cig_week];
    smoke_btn2=[UIButton buttonWithType:UIButtonTypeCustom];
    smoke_btn2.tag=103;
    [smoke_btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [scrollviw addSubview:smoke_btn2];
    
    
    diagnose=[UIButton buttonWithType:UIButtonTypeCustom];
    diagnose.tag=104;
    [diagnose setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [scrollviw addSubview:diagnose];
    
    criminal_btn=[UIButton buttonWithType:UIButtonTypeCustom];
    criminal_btn.tag=105;
    [criminal_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [scrollviw addSubview:[self tagvalue:1]];
    UITextField *txt1=(UITextField*)[scrollviw viewWithTag:1];

    datebtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [datebtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [datebtn setTag:1];
    //[scrollviw addSubview:datebtn];
    compute_btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [scrollviw addSubview:compute_btn];
    [compute_btn addTarget:self action:@selector(CallWebservice) forControlEvents:UIControlEventTouchUpInside];
    logout=[UIButton buttonWithType:UIButtonTypeCustom];
    [scrollviw addSubview:logout];
    [logout addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        Weight.frame=CGRectMake(535,382, 170, 40);
        Height.frame=CGRectMake(535,461, 170, 40);
       // No_Drinks.frame=CGRectMake(450,390, 170, 40);
        
        datebtn.frame=CGRectMake(535,220, 170, 40);
        smoke_cig_week.frame=CGRectMake(535, 625, 170, 40);
        smoke_btn2.frame=CGRectMake(535, 548, 170, 40);
        diagnose.frame=CGRectMake(535,800,170, 40);
        criminal_btn.frame=CGRectMake(535,718, 170, 40);
        genderbtn.frame=CGRectMake(535,300, 170, 40);
        compute_btn.frame=CGRectMake(283, 895, 190, 40);
        logout.frame=CGRectMake(665,10, 40,40);
        txt1.frame=CGRectMake(535,213, 170, 40);

        [datebtn addTarget:self action:@selector(popupPicker:) forControlEvents:UIControlEventTouchUpInside];
        [criminal_btn addTarget:self action:@selector(popupPicker:) forControlEvents:UIControlEventTouchUpInside];
        [diagnose addTarget:self action:@selector(popupPicker:) forControlEvents:UIControlEventTouchUpInside];
        [smoke_btn2 addTarget:self action:@selector(popupPicker:) forControlEvents:UIControlEventTouchUpInside];
        [genderbtn addTarget:self action:@selector(popupPicker:) forControlEvents:UIControlEventTouchUpInside];
        [smoke_cig_week addTarget:self action:@selector(popupPicker:) forControlEvents:UIControlEventTouchUpInside];
        
        datepicker=[[UIDatePicker alloc]init];
        datepicker.frame = CGRectMake(0, 0, 350, 350);
        [datepicker addTarget:self action:@selector(pickerselection:) forControlEvents:UIControlEventValueChanged];
        [datepicker setDatePickerMode:UIDatePickerModeDate];
        [txt1 addTarget:self action:@selector(popupPicker:) forControlEvents:UIControlEventEditingDidBegin];

        
    }
    else
    {
        Weight.frame=CGRectMake(210,161, 85, 27);
        Height.frame=CGRectMake(210,199, 85, 27);
        Weight.font=[UIFont systemFontOfSize:12];
        Height.font=[UIFont systemFontOfSize:12];
        txt1.font=[UIFont systemFontOfSize:12];
        smoke_btn2.titleLabel.font=[UIFont systemFontOfSize:12];
        smoke_cig_week.titleLabel.font=[UIFont systemFontOfSize:12];
        genderbtn.titleLabel.font=[UIFont systemFontOfSize:12];
        criminal_btn.titleLabel.font=[UIFont systemFontOfSize:12];
        diagnose.titleLabel.font=[UIFont systemFontOfSize:12];

        txt1.frame=CGRectMake(210,85, 85, 27);
        smoke_btn2.frame=CGRectMake(210, 242, 85, 27);
        smoke_cig_week.frame=CGRectMake(214, 284, 85, 27);
        criminal_btn.frame=CGRectMake(210,330, 85, 27);
        No_Drinks.frame=CGRectMake(170,300, 130, 30);   
        diagnose.frame=CGRectMake(210,374,85, 27);
        genderbtn.frame=CGRectMake(210,125, 85, 27);
        
        compute_btn.frame=CGRectMake(100,418, 112, 27);
        logout.frame=CGRectMake(269,2, 22,22);
        [txt1 addTarget:self action:@selector(Datebtnpressed:) forControlEvents:UIControlEventEditingDidBegin];

        //[datebtn addTarget:self action:@selector(Datebtnpressed:) forControlEvents:UIControlEventTouchUpInside];
        [criminal_btn addTarget:self action:@selector(PickerView:) forControlEvents:UIControlEventTouchUpInside];
        [diagnose addTarget:self action:@selector(PickerView:) forControlEvents:UIControlEventTouchUpInside];
        [smoke_btn2 addTarget:self action:@selector(PickerView:) forControlEvents:UIControlEventTouchUpInside];
        [genderbtn addTarget:self action:@selector(PickerView:) forControlEvents:UIControlEventTouchUpInside];
        [smoke_cig_week addTarget:self action:@selector(PickerView:) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    
    [scrollviw addSubview:criminal_btn];

    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)Datebtnpressed:(id)sender{
    
    aac = [[UIActionSheet alloc] initWithTitle:@"Date Picker"
									  delegate:self
							 cancelButtonTitle:nil
						destructiveButtonTitle:nil
							 otherButtonTitles:nil];
    
    datepicker=[[UIDatePicker alloc]initWithFrame:CGRectMake(0, 44, 0, 0)];
    
    [datepicker addTarget:self action:@selector(pickerselection:) forControlEvents:UIControlEventValueChanged];
    [datepicker setTag:9];
    [datepicker setDatePickerMode:UIDatePickerModeDate];
   // [aac addSubview:datepicker];
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
	[aac addSubview:datepicker];
	[aac showInView:self.view];
    if (UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation))
    {
            [aac setBounds:CGRectMake(0,0,460, 320)];

    }else{
	[aac setBounds:CGRectMake(0,0,320, 464)];
    }
    [self pickerselection:datepicker];
    
	[datepicker release];
	[pickerDateToolbar release];
	[barItems release];
	[flexSpace release];
	[okBtn release];
    
}
-(void)pickerselection:(id)sender
{
    
    NSString *str2 = [self formatdate:datepicker.date];
    NSLog(@"string %@",str2);
    UITextField *txt1=(UITextField*)[scrollviw viewWithTag:1];
    [txt1 setText:str2];
    //[datebtn setTitle:str2 forState:UIControlStateNormal];
}

-(NSString *) formatdate:(NSDate *)date
{
	NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
	[dateFormat setDateFormat:@"MM/dd/YYYY"];
	NSString *datestring = [dateFormat stringFromDate:date];  
    [dateFormat release];
	return datestring;
    
}

-(IBAction)PickerView:(id)sender
{
    
    if (array_from!=nil && [array_from count]>0) {
        [array_from release];
    }  
    if (myPickerView!=nil && [myPickerView retainCount]>0) {
        [myPickerView release];
        myPickerView.delegate=nil;
    } 
    
    myPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 44, 0, 0)];
    
    myPickerView.delegate = self;
    myPickerView.showsSelectionIndicator = YES;
    myPickerView.dataSource=self;
	aac = [[UIActionSheet alloc] initWithTitle:@"Picker View"
									  delegate:self
							 cancelButtonTitle:nil
						destructiveButtonTitle:nil
							 otherButtonTitles:nil];
    if ([sender tag]==101) {
        array_from=[[NSMutableArray alloc]initWithObjects:@"Male",@"Female",nil];
        [genderbtn setTitle:[array_from objectAtIndex:0] forState:UIControlStateNormal];
        myPickerView.tag=201;   
    }
    if ([sender tag]==102) {
        array_from=[[NSMutableArray alloc]initWithObjects:@"YES",@"NO",nil];
        [smoke_cig_week setTitle:[array_from objectAtIndex:0] forState:UIControlStateNormal];
        myPickerView.tag=202;
        
    }
    if ([sender tag]==103) {
        array_from=[[NSMutableArray alloc]initWithObjects:@"YES",@"NO",nil];
        [smoke_btn2 setTitle:[array_from objectAtIndex:0] forState:UIControlStateNormal];
        myPickerView.tag=203;   
        
    }
    if ([sender tag]==104) {
        array_from=[[NSMutableArray alloc]initWithObjects:@"YES",@"NO",nil];
        [diagnose setTitle:[array_from objectAtIndex:0] forState:UIControlStateNormal];
        myPickerView.tag=204;   
        
    }
    if ([sender tag]==105) {
        array_from=[[NSMutableArray alloc]initWithObjects:@"YES",@"NO",nil];
        [criminal_btn setTitle:[array_from objectAtIndex:0] forState:UIControlStateNormal];
        myPickerView.tag=205;  
        
    }
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
    UITextField *txt1=(UITextField*)[scrollviw viewWithTag:1];
    [txt1 resignFirstResponder];
}


-(IBAction) popupPicker:(id)sender{
    
	if (array_from!=nil && [array_from count]>0) {
        [array_from release];
    } 
    if (myPickerView!=nil && [myPickerView retainCount]>0) {
        [myPickerView release];
        myPickerView.delegate=nil;
    } 
    myPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0,0,350,216)];
    myPickerView.delegate = self;
    myPickerView.showsSelectionIndicator = YES;
    myPickerView.dataSource=self;
    
    
    UIViewController* popoverContent = [[UIViewController alloc] init];
    
	UIView* popoverView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 350, 330)];
	popoverView.backgroundColor = [UIColor clearColor];
    if ([sender tag]==1) {
        
        [sender resignFirstResponder];
		[popoverView addSubview:datepicker]; 
		popoverContent.contentSizeForViewInPopover = CGSizeMake(datepicker.frame.size.width, datepicker.frame.size.height);
        
		[self pickerselection:datepicker];
    }  
    else if([sender tag]==101){
        array_from=[[NSMutableArray alloc]initWithObjects:@"Male",@"Female",nil];
        
        myPickerView.tag=201;
        myPickerView.frame = CGRectMake(0, 0, 350, myPickerView.frame.size.height);
		[popoverView addSubview:myPickerView]; 
		popoverContent.contentSizeForViewInPopover = CGSizeMake(myPickerView.frame.size.width, myPickerView.frame.size.height);
        [genderbtn setTitle:[array_from objectAtIndex:0] forState:UIControlStateNormal];
        
        
    }else if([sender tag]==102){
        array_from=[[NSMutableArray alloc]initWithObjects:@"YES",@"NO",nil];
        
        myPickerView.tag=202;
        myPickerView.frame = CGRectMake(0, 0, 300, myPickerView.frame.size.height);
		[popoverView addSubview:myPickerView]; 
		popoverContent.contentSizeForViewInPopover = CGSizeMake(myPickerView.frame.size.width, myPickerView.frame.size.height);
        [smoke_cig_week setTitle:[array_from objectAtIndex:0] forState:UIControlStateNormal];
        
        
    }else if([sender tag]==103){
        array_from=[[NSMutableArray alloc]initWithObjects:@"YES",@"NO",nil];
        
        myPickerView.tag=203;
        myPickerView.frame = CGRectMake(0, 0, 350, myPickerView.frame.size.height);
		[popoverView addSubview:myPickerView]; 
		popoverContent.contentSizeForViewInPopover = CGSizeMake(myPickerView.frame.size.width, myPickerView.frame.size.height);
        [smoke_btn2 setTitle:[array_from objectAtIndex:0] forState:UIControlStateNormal];
        
    }else if([sender tag]==104){
        array_from=[[NSMutableArray alloc]initWithObjects:@"YES",@"NO",nil];
        
        myPickerView.tag=204;
        myPickerView.frame = CGRectMake(0, 0, 350, myPickerView.frame.size.height);
		[popoverView addSubview:myPickerView]; 
		popoverContent.contentSizeForViewInPopover = CGSizeMake(myPickerView.frame.size.width, myPickerView.frame.size.height);
        [diagnose setTitle:[array_from objectAtIndex:0] forState:UIControlStateNormal];
        
    } else if([sender tag]==105){
        array_from=[[NSMutableArray alloc]initWithObjects:@"YES",@"NO",nil];
        
        myPickerView.tag=205;
        myPickerView.frame = CGRectMake(0, 0, 350, myPickerView.frame.size.height);
        [popoverView addSubview:myPickerView]; 
        popoverContent.contentSizeForViewInPopover = CGSizeMake(myPickerView.frame.size.width, myPickerView.frame.size.height);
        [criminal_btn setTitle:[array_from objectAtIndex:0] forState:UIControlStateNormal];
        
    }    
	popoverContent.view = popoverView;
	//create a popover controller
	UIPopoverController *popoverController = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
	popoverController.delegate = self;
    [popoverController presentPopoverFromRect:[sender frame] inView:scrollviw permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES]   ; 
    
    //release the popover content
	[popoverView release];
	[popoverContent release];
}

#pragma Mark Picker Delegate

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    NSUInteger numRows = 2;
    
    return numRows;
}

// tell the picker how many components it will have
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (pickerView.tag==201) {
        NSString *gen=[NSString stringWithFormat:@"%@",[array_from objectAtIndex:[pickerView selectedRowInComponent:0]]];
        [genderbtn setTitle:gen forState:UIControlStateNormal];
    }else if(pickerView.tag==202){
        NSString *gen=[NSString stringWithFormat:@"%@",[array_from objectAtIndex:[pickerView selectedRowInComponent:0]]];
        NSLog(@"%@",gen);
        [smoke_cig_week setTitle:gen forState:UIControlStateNormal];
        
    }else if(pickerView.tag==203){
        NSString *gen=[NSString stringWithFormat:@"%@",[array_from objectAtIndex:[pickerView selectedRowInComponent:0]]];
        NSLog(@"%@",gen);
        [smoke_btn2 setTitle:gen forState:UIControlStateNormal];
        
    }else if(pickerView.tag==204){
        NSString *gen=[NSString stringWithFormat:@"%@",[array_from objectAtIndex:[pickerView selectedRowInComponent:0]]];
        NSLog(@"%@",gen);
        [diagnose setTitle:gen forState:UIControlStateNormal];
        
    }else if(pickerView.tag==205){
        NSString *gen=[NSString stringWithFormat:@"%@",[array_from objectAtIndex:[pickerView selectedRowInComponent:0]]];
        NSLog(@"%@",gen);
        [criminal_btn setTitle:gen forState:UIControlStateNormal];
        
    }
    
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [array_from objectAtIndex:row];
    
}

-(void)CallWebservice{
//    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Work under process" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
//    [alert show];
//    [alert release];
    LifeEstimatedView *lifviw=[[LifeEstimatedView alloc]initWithNibName:@"LifeEstimatedView" bundle:nil];
    [self.navigationController pushViewController:lifviw animated:YES];
}
-(void)logout{
    [self.navigationController popToRootViewControllerAnimated:YES];
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
    
    
    if (textField.tag==503) {
        scrollviw.contentOffset=CGPointMake(scrollviw.contentOffset.x,60);
    }else if(textField.tag==504){
        scrollviw.contentOffset=CGPointMake(scrollviw.contentOffset.x,100);
    }else if(textField.tag==505) {
        scrollviw.contentOffset=CGPointMake(scrollviw.contentOffset.x,230);
        
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
    UITextField *Weight=(UITextField*)[scrollviw viewWithTag:503];
    UITextField *Height=(UITextField*)[scrollviw viewWithTag:504];
    
     if(textField.tag==504){
        [Height resignFirstResponder];
        scrollviw.contentOffset=CGPointMake(scrollviw.contentOffset.x,0);

    }else if(textField.tag==503){
        [Weight resignFirstResponder];
        [Height becomeFirstResponder];
    }else if(textField.tag==505){
       // [Height resignFirstResponder];
       // [No_Drinks becomeFirstResponder];
        scrollviw.contentOffset=CGPointMake(scrollviw.contentOffset.x,0);

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
    //[txtf setBorderStyle:UITextBorderStyleRoundedRect];
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
-(void)Queview_position{
    UITextField *Weight=(UITextField*)[scrollviw viewWithTag:503];
    UITextField *Height=(UITextField*)[scrollviw viewWithTag:504];
    UITextField *txt1=(UITextField*)[scrollviw viewWithTag:1];
    Weight.delegate=self;
    if (UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation)){

    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        scrollviw.frame=CGRectMake(0,0,1024,768);
        image_bg.image=[UIImage imageNamed:@"estimate.png"];
        image_bg.frame=scrollviw.frame;
       
        Weight.frame=CGRectMake(642,262, 210, 40);
        Height.frame=CGRectMake(642,321, 210, 40);
        
        //datebtn.frame=CGRectMake(585,220, 170, 40);
        smoke_cig_week.frame=CGRectMake(642, 460, 210, 40);
        smoke_btn2.frame=CGRectMake(642, 393, 210, 40);
        diagnose.frame=CGRectMake(642,577,210, 40);
        criminal_btn.frame=CGRectMake(642,520, 210, 40);
        genderbtn.frame=CGRectMake(642,200, 210, 40);
        compute_btn.frame=CGRectMake(403, 660, 210, 40);
        logout.frame=CGRectMake(927,13, 40,40);
        txt1.frame=CGRectMake(642,135, 210, 40);
        
        
    }else{
        image_bg.image=nil;
        scrollviw.frame=CGRectMake(0,0,480,320);
        scrollviw.contentSize=CGSizeMake(480,460);
        image_bg.image=[UIImage imageNamed:@"esti_ipn.png"];
        image_bg.frame=CGRectMake(0,0,480,480);
        scrollviw.scrollEnabled=YES;
        Weight.frame=CGRectMake(325,161, 105, 27);
        Height.frame=CGRectMake(325,203, 105, 27);
        //   No_Drinks.frame=CGRectMake(170,300, 130, 30);   
        Weight.font=[UIFont systemFontOfSize:12];
        Height.font=[UIFont systemFontOfSize:12];
        txt1.font=[UIFont systemFontOfSize:12];
        smoke_btn2.titleLabel.font=[UIFont systemFontOfSize:12];
        smoke_cig_week.titleLabel.font=[UIFont systemFontOfSize:12];
        genderbtn.titleLabel.font=[UIFont systemFontOfSize:12];
        criminal_btn.titleLabel.font=[UIFont systemFontOfSize:12];
        diagnose.titleLabel.font=[UIFont systemFontOfSize:12];
        
        txt1.frame=CGRectMake(325,85, 105, 27);
        smoke_btn2.frame=CGRectMake(345, 242, 105, 27);
        smoke_cig_week.frame=CGRectMake(345, 284, 85, 27);
        diagnose.frame=CGRectMake(345,374,85, 27);
        criminal_btn.frame=CGRectMake(345,330, 85, 27);
        genderbtn.frame=CGRectMake(345,125, 85, 27);
        [txt1 addTarget:self action:@selector(Datebtnpressed:) forControlEvents:UIControlEventEditingDidBegin];
        
        compute_btn.frame=CGRectMake(160,406, 150, 27);
        logout.frame=CGRectMake(419,4, 22,22);

       

    }
}else if(UIInterfaceOrientationIsPortrait([UIDevice currentDevice].orientation)){
    
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        scrollviw.frame=CGRectMake(0,0,768,1024);
        image_bg.image=[UIImage imageNamed:@"iLE-estimate.png"];
        image_bg.frame=scrollviw.frame;
                
        Weight.frame=CGRectMake(535,382, 170, 40);
        Height.frame=CGRectMake(535,461, 170, 40);
        // No_Drinks.frame=CGRectMake(450,390, 170, 40);
        txt1.frame=CGRectMake(535,213, 170, 40);
        
        // datebtn.frame=CGRectMake(535,220, 170, 40);
        smoke_cig_week.frame=CGRectMake(535, 625, 170, 40);
        smoke_btn2.frame=CGRectMake(535, 548, 170, 40);
        diagnose.frame=CGRectMake(535,800,170, 40);
        criminal_btn.frame=CGRectMake(535,718, 170, 40);
        genderbtn.frame=CGRectMake(535,300, 170, 40);
        compute_btn.frame=CGRectMake(283, 895, 190, 40);
        logout.frame=CGRectMake(665,10, 40,40);
        [txt1 addTarget:self action:@selector(popupPicker:) forControlEvents:UIControlEventEditingDidBegin];

    }else{
        scrollviw.frame=CGRectMake(0,0,320,480);
        image_bg.image=[UIImage imageNamed:@"iphone_compute LE.png"];
        image_bg.frame=scrollviw.frame;
        scrollviw.scrollEnabled=NO;
        Weight.frame=CGRectMake(210,161, 85, 27);
        Height.frame=CGRectMake(210,199, 85, 27);
        //   No_Drinks.frame=CGRectMake(170,300, 130, 30);   
        Weight.font=[UIFont systemFontOfSize:12];
        Height.font=[UIFont systemFontOfSize:12];
        txt1.font=[UIFont systemFontOfSize:12];
        smoke_btn2.titleLabel.font=[UIFont systemFontOfSize:12];
        smoke_cig_week.titleLabel.font=[UIFont systemFontOfSize:12];
        genderbtn.titleLabel.font=[UIFont systemFontOfSize:12];
        criminal_btn.titleLabel.font=[UIFont systemFontOfSize:12];
        diagnose.titleLabel.font=[UIFont systemFontOfSize:12];
        
        txt1.frame=CGRectMake(210,85, 85, 27);
        smoke_btn2.frame=CGRectMake(210, 242, 85, 27);
        smoke_cig_week.frame=CGRectMake(214, 284, 85, 27);
        diagnose.frame=CGRectMake(210,374,85, 27);
        criminal_btn.frame=CGRectMake(210,330, 85, 27);
        genderbtn.frame=CGRectMake(210,125, 85, 27);
        [txt1 addTarget:self action:@selector(Datebtnpressed:) forControlEvents:UIControlEventEditingDidBegin];

        compute_btn.frame=CGRectMake(100,418, 112, 27);
        logout.frame=CGRectMake(269,2, 22,22);
    }

 }
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    UITextField *Weight=(UITextField*)[scrollviw viewWithTag:503];
    UITextField *Height=(UITextField*)[scrollviw viewWithTag:504];
    UITextField *No_Drinks=(UITextField*)[scrollviw viewWithTag:505];

    UITextField *txt1=(UITextField*)[scrollviw viewWithTag:1];
    if (UIDeviceOrientationIsLandscape(interfaceOrientation)){
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            scrollviw.frame=CGRectMake(0,0,1024,768);
            image_bg.image=Ipad_Landscape3;
            image_bg.frame=scrollviw.frame;
            
            Weight.frame=CGRectMake(695,240, 160, 40);
            Height.frame=CGRectMake(695,307, 160, 40);
            No_Drinks.frame=CGRectMake(695,577, 160, 40);

            //datebtn.frame=CGRectMake(585,220, 170, 40);
            smoke_cig_week.frame=CGRectMake(695, 443, 160, 40);
            smoke_btn2.frame=CGRectMake(695, 381, 160, 40);
            diagnose.frame=CGRectMake(695,639,160, 40);
            criminal_btn.frame=CGRectMake(695,517, 160, 40);
            genderbtn.frame=CGRectMake(695,170, 160, 40);
            compute_btn.frame=CGRectMake(403, 710, 210, 40);
            logout.frame=CGRectMake(901,13, 40,40);
            txt1.frame=CGRectMake(695,100, 160, 40);
            
            
        }else{
            image_bg.image=nil;
            scrollviw.frame=CGRectMake(0,0,480,320);
            scrollviw.contentSize=CGSizeMake(480,480);
            image_bg.image=Iphone_Landscape3;
            image_bg.frame=CGRectMake(0,0,480,480);
            scrollviw.scrollEnabled=YES;
            Weight.frame=CGRectMake(325,157, 105, 27);
            Height.frame=CGRectMake(325,198, 105, 27);
            Weight.font=[UIFont systemFontOfSize:12];
            Height.font=[UIFont systemFontOfSize:12];
            txt1.font=[UIFont systemFontOfSize:12];
            smoke_btn2.titleLabel.font=[UIFont systemFontOfSize:12];
            smoke_cig_week.titleLabel.font=[UIFont systemFontOfSize:12];
            genderbtn.titleLabel.font=[UIFont systemFontOfSize:12];
            criminal_btn.titleLabel.font=[UIFont systemFontOfSize:12];
            diagnose.titleLabel.font=[UIFont systemFontOfSize:12];
            
            txt1.frame=CGRectMake(332,81, 105, 27);
            smoke_btn2.frame=CGRectMake(345, 230, 85, 27);
            smoke_cig_week.frame=CGRectMake(345, 274, 85, 27);
            
            No_Drinks.frame=CGRectMake(345,355, 85, 27);   

            diagnose.frame=CGRectMake(345,400,85, 27);
            criminal_btn.frame=CGRectMake(345,320, 85, 27);
            genderbtn.frame=CGRectMake(345,115, 85, 27);
            [txt1 addTarget:self action:@selector(Datebtnpressed:) forControlEvents:UIControlEventEditingDidBegin];
            
            compute_btn.frame=CGRectMake(180,436, 120, 27);
            logout.frame=CGRectMake(424,7, 22,22);
            
            
            
        }
    }else if(UIInterfaceOrientationIsPortrait(interfaceOrientation)){
        
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            scrollviw.frame=CGRectMake(0,0,768,1024);
            image_bg.image=Ipad_Portrait3;
            image_bg.frame=scrollviw.frame;
            
            Weight.frame=CGRectMake(560,343, 170, 40);
            Height.frame=CGRectMake(560,416, 170, 40);
            No_Drinks.frame=CGRectMake(560,718, 170, 40);
            txt1.frame=CGRectMake(560,199, 170, 40);
            
            // datebtn.frame=CGRectMake(535,220, 170, 40);
            smoke_cig_week.frame=CGRectMake(560, 555, 170, 40);
            smoke_btn2.frame=CGRectMake(560, 495, 170, 40);
            diagnose.frame=CGRectMake(560,800,170, 40);
            criminal_btn.frame=CGRectMake(560,640, 170, 40);
            genderbtn.frame=CGRectMake(560,275, 170, 40);
            compute_btn.frame=CGRectMake(283, 896, 190, 40);
            logout.frame=CGRectMake(686,10, 40,40);
            [txt1 addTarget:self action:@selector(popupPicker:) forControlEvents:UIControlEventEditingDidBegin];
            
        }else{
            scrollviw.frame=CGRectMake(0,0,320,480);
            image_bg.image=Iphone_Portrait3;
            image_bg.frame=scrollviw.frame;
            scrollviw.scrollEnabled=NO;
            Weight.frame=CGRectMake(210,148, 85, 27);
            Height.frame=CGRectMake(210,187, 85, 27);
            Weight.font=[UIFont systemFontOfSize:12];
            Height.font=[UIFont systemFontOfSize:12];
            txt1.font=[UIFont systemFontOfSize:12];
            smoke_btn2.titleLabel.font=[UIFont systemFontOfSize:12];
            smoke_cig_week.titleLabel.font=[UIFont systemFontOfSize:12];
            genderbtn.titleLabel.font=[UIFont systemFontOfSize:12];
            criminal_btn.titleLabel.font=[UIFont systemFontOfSize:12];
            diagnose.titleLabel.font=[UIFont systemFontOfSize:12];
            
            txt1.frame=CGRectMake(210,70, 85, 27);
            smoke_btn2.frame=CGRectMake(210, 227, 85, 27);
            smoke_cig_week.frame=CGRectMake(214, 264, 85, 27);
           No_Drinks.frame=CGRectMake(210,350, 85, 30);   

            diagnose.frame=CGRectMake(210,394,85, 27);
            criminal_btn.frame=CGRectMake(210,310, 85, 27);
            genderbtn.frame=CGRectMake(210,100, 85, 27);
            [txt1 addTarget:self action:@selector(Datebtnpressed:) forControlEvents:UIControlEventEditingDidBegin];
            
            compute_btn.frame=CGRectMake(100,432, 118, 27);
            logout.frame=CGRectMake(279,2, 22,22);
        }
        
    }


	return YES;
}

@end
