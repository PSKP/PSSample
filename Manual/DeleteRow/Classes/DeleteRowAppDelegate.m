//
//  DeleteRowAppDelegate.m
//  DeleteRow
//
//  Created by Deepak Kumar on 08/09/09.
//  Copyright Rose India 2009. All rights reserved.
//

#import "DeleteRowAppDelegate.h"
#import "DeleteRowViewController.h"

@implementation DeleteRowAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
	UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:viewController];
 
    // Override point for customization after app launch    
   [window addSubview:navController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
