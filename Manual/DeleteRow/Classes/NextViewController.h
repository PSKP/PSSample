//
//  NextViewController.h
//  DeleteRow
//
//  Created by Deepak Kumar on 08/09/09.
//  Copyright 2009 Rose India. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NextViewController : UIViewController {

	IBOutlet UILabel *lblProductTxt;
}

- (IBAction) changeProductText:(NSString *)str;
@end
