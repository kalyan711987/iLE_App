//
//  LifeEstimatedView.h
//  iLE
//
//  Created by Innoppl tech on 6/20/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebController.h"
#import "Constants.h"
@interface LifeEstimatedView : UIViewController {
    
    UIScrollView *Last_Scrol;

    UIImageView *image_bg;

}
-(UILabel*)lblframe:(CGRect)rect text:(NSString*)text siz:(CGFloat)size;
-(UILabel*)lbltag:(NSInteger)tag text:(NSString*)text;

@end
