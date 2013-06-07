//
//  DeleteRowViewController.h
//  DeleteRow
//
//  Created by Deepak Kumar on 08/09/09.
//  Copyright Rose India 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DeleteRowViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
	IBOutlet UITableView *Table;
	NSMutableArray *arry;
}

- (IBAction) EditTable:(id)sender;
@end

