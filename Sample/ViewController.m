//
//  ViewController.m
//  Sample
//
//  Created by SKANNAN on 1/21/13.
//  Copyright (c) 2013 SKANNAN. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];	
	
}

- (IBAction)buttonClicked:(id)sender
{
    //Changes by Rubini.
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Really click?" message:@"Do you really want to click?" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
