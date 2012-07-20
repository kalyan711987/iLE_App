//
//  RegistrationView.h
//  iLE
//
//  Created by Innoppl tech on 6/20/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuestionView.h"
#import "Constants.h"
@interface RegistrationView : UIViewController<UIPopoverControllerDelegate> {
    
    UIScrollView *scrolViw;
    UIImageView *imageview_bg;
    UIPickerView *myPickerView;
    UIToolbar *pickerDateToolbar; 
	UIActionSheet *aac;
    UIPopoverController *popoverController;
    NSString *emailRegEx;
    NSMutableArray   *countryArray;
    
}
-(UITextField*)tagvalue:(NSUInteger)tag;
-(UILabel*)lblframe:(CGRect)rect text:(NSString*)text;
-(NSString *) formatdate:(NSDate *)date;
-(void)callAlert: (NSString*)message;
@end
