//
//  iLEAppDelegate.h
//  iLE
//
//  Created by Innoppl tech on 6/18/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class iLEViewController;

@interface iLEAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet iLEViewController *viewController;

@end
