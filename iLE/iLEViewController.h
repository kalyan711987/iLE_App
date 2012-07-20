//
//  iLEViewController.h
//  iLE
//
//  Created by Innoppl tech on 6/18/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegistrationView.h"
#import "iLEAppDelegate.h"
#import "QuestionView.h"
#import "Constants.h"
#import "ASIFormDataRequest.h"
#import "MBProgressHUD.h"
#import "XMLReader.h"
@interface iLEViewController : UIViewController<UIActionSheetDelegate,UITextFieldDelegate,UIPopoverControllerDelegate,UIPickerViewDelegate,UIPickerViewDataSource,UIScrollViewDelegate,NSXMLParserDelegate,MBProgressHUDDelegate> {
    
    MBProgressHUD *HUD;
    UIScrollView *Login_Scrol;
    UIImageView *logimage_bg;
    UIAlertView *progressView;
    NSString *tempstr;
    NSXMLParser *myxmlparser;
    NSMutableArray *parseArray;
    NSMutableArray *parseValue;
    NSMutableDictionary *ParseDic;
    BOOL isForgotpswd;
}

-(NSString *) formatdate:(NSDate *)date;
-(UITextField*)tagvalue:(NSUInteger)tag;
-(void)SignView_position;
@end
