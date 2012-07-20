//
//  QuestionView.h
//  iLE
//
//  Created by Innoppl tech on 6/20/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LifeEstimatedView.h"
#import "Constants.h"
@interface QuestionView : UIViewController<UIActionSheetDelegate,UITextFieldDelegate,UIPopoverControllerDelegate,UIPickerViewDelegate,UIPickerViewDataSource,UIScrollViewDelegate> {
    UIDatePicker *datepicker;
    UITextField *Fullname;
    UITextField *Drinktext;
    UIButton *genderbtn ;
    UIButton *datebtn;
    UIToolbar *pickerDateToolbar; 
	UIActionSheet *aac;
    UIScrollView *scrollviw;
    UIPickerView *myPickerView;
    NSMutableArray *array_from;
    UIButton *smoke_cig_week;
    UIButton *diagnose;
    UIButton *criminal_btn;
    UIButton *smoke_btn2;
    UIImageView *image_bg;

}
-(void)PickerView:(id)sender;
-(void)pickerselection:(id)sender;
-(NSString *) formatdate:(NSDate *)date;
-(UITextField*)tagvalue:(NSUInteger)tag;
-(UILabel*)lblframe:(CGRect)rect text:(NSString*)text;

@end
