//
//  DeleteRowAppDelegate.h
//  DeleteRow
//
//  Created by Deepak Kumar on 08/09/09.
//  Copyright Rose India 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DeleteRowViewController;

@interface DeleteRowAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    DeleteRowViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet DeleteRowViewController *viewController;

@end

