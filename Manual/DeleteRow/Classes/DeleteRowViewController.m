//
//  DeleteRowViewController.m
//  DeleteRow
//
//  Created by Deepak Kumar on 08/09/09.
//  Copyright Rose India 2009. All rights reserved.
//

#import "DeleteRowViewController.h"
@implementation DeleteRowViewController

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{
	arry = [[NSMutableArray alloc] initWithObjects:@"Rose",@"India",@"Rose India",@"Technology",@"Tutorial",nil];
	self.title = @"Edit Table ";
	UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStyleBordered target:self action:@selector(EditTable:)];
	[self.navigationItem setLeftBarButtonItem:addButton];
    
    /*
    if(self.editing)
	{
		[super setEditing:NO animated:NO];
		[Table setEditing:NO animated:NO];
		[Table reloadData];
		[self.navigationItem.leftBarButtonItem setTitle:@"Edit"];
		[self.navigationItem.leftBarButtonItem setStyle:UIBarButtonItemStylePlain];
	}
	else
	{
		[super setEditing:YES animated:YES];
		[Table setEditing:YES animated:YES];
		[Table reloadData];
		[self.navigationItem.leftBarButtonItem setTitle:@"Done"];
		[self.navigationItem.leftBarButtonItem setStyle:UIBarButtonItemStyleDone];
	}
     */
    [super setEditing:YES animated:YES];
    [Table setEditing:YES animated:YES];
    Table.allowsSelectionDuringEditing = YES;

    [super viewDidLoad];
    
    
    
}
- (void)didReceiveMemoryWarning 
{
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc 
{
    [super dealloc];
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
	
    return 1;
}
// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
	int count = [arry count];
	if(self.editing) count++;
	return count;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
	{
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }
    int count = 0;
	if(self.editing && indexPath.row != 0)
		count = 1;
	NSLog([NSString stringWithFormat:@"%i,%i",indexPath.row,(indexPath.row-count)]);
    
	// Set up the cell...
	if(indexPath.row == ([arry count]) && self.editing)
	{
		cell.textLabel.text = @"ADD";
		return cell;
	}
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	cell.textLabel.text = [arry objectAtIndex:indexPath.row];
    return cell;
}
- (IBAction)AddButtonAction:(id)sender
{
	[arry addObject:@"Tutorial "];
	[Table reloadData];
}

- (IBAction)DeleteButtonAction:(id)sender
{
	[arry removeLastObject];
	[Table reloadData];
}

- (IBAction) EditTable:(id)sender
{
	if(self.editing)
	{
		[super setEditing:NO animated:NO]; 
		[Table setEditing:NO animated:NO];
		[Table reloadData];
		[self.navigationItem.leftBarButtonItem setTitle:@"Edit"];
		[self.navigationItem.leftBarButtonItem setStyle:UIBarButtonItemStylePlain];
	}
	else
	{
		[super setEditing:YES animated:YES]; 
		[Table setEditing:YES animated:YES];
		[Table reloadData];
		[self.navigationItem.leftBarButtonItem setTitle:@"Done"];
		[self.navigationItem.leftBarButtonItem setStyle:UIBarButtonItemStyleDone];
	}
}

// The editing style for a row is the kind of button displayed to the left of the cell when in editing mode.
- (UITableViewCellEditingStyle)tableView:(UITableView *)aTableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    // No editing style if not editing or the index path is nil.
    if (self.editing == NO || !indexPath) return UITableViewCellEditingStyleNone;
    // Determine the editing style based on whether the cell is a placeholder for adding content or already
    // existing content. Existing content can be deleted.    
    if (self.editing && indexPath.row == ([arry count])) 
	{
		return UITableViewCellEditingStyleInsert;
	} else 
	{
		return UITableViewCellEditingStyleDelete;
	}
    return UITableViewCellEditingStyleNone;
}

// Update the data model according to edit actions delete or insert.
- (void)tableView:(UITableView *)aTableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle 
forRowAtIndexPath:(NSIndexPath *)indexPath 
{
	
    if (editingStyle == UITableViewCellEditingStyleDelete) 
	{
        [arry removeObjectAtIndex:indexPath.row];
		[Table reloadData];
    } else if (editingStyle == UITableViewCellEditingStyleInsert)
	{
        [arry insertObject:@"Tutorial" atIndex:[arry count]];
		[Table reloadData];
    }
}

#pragma mark Row reordering
// Determine whether a given row is eligible for reordering or not.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
// Process the row move. This means updating the data model to correct the item indices.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath 
	  toIndexPath:(NSIndexPath *)toIndexPath 
{
	NSString *item = [[arry objectAtIndex:fromIndexPath.row] retain];
	[arry removeObject:item];
	[arry insertObject:item atIndex:toIndexPath.row];
	[item release];
}

- (void) tableView:(UITableView *) tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"Test");
}

@end
