//
//  StateController.m
//  NewsReader
//
//  Created by  on 11/8/14.
//  Copyright (c) 2014 . All rights reserved.
//

#import "StateController.h"
#import "NewsController.h"
@interface StateController ()

@end

@implementation StateController
@synthesize arrItems;

-(void) dealloc
{
    [arrItems release];
    [super dealloc];
}
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"State";
    /*self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addCategory)];*/
    //Changed by sangeeta
    self.title = @"Continental";
    /*self.navigationController.navigationBar.barTintColor = [UIColor redColor];
     self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addCategory)];*/
    NSDictionary *dictIosArticle1 = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"Africa", @"AF",nil] forKeys:[NSArray arrayWithObjects:@"Name",@"Desc", nil]];
    
    NSDictionary *dictIosArticle2 = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"Americas", @"AM",nil] forKeys:[NSArray arrayWithObjects:@"Name",@"Desc", nil]];
    NSDictionary *dictIosArticle3 = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"Asia-Pacific", @"AP",nil] forKeys:[NSArray arrayWithObjects:@"Name",@"Desc", nil]];
    
    NSDictionary *dictIosArticle4 = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"Australia", @"AU",nil] forKeys:[NSArray arrayWithObjects:@"Name",@"Desc", nil]];
    NSDictionary *dictIosArticle5 = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"Europe", @"EU",nil] forKeys:[NSArray arrayWithObjects:@"Name",@"Desc", nil]];
    NSDictionary *dictIosArticle6 = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"Middle East", @"ME",nil] forKeys:[NSArray arrayWithObjects:@"Name",@"Desc", nil]];
    NSDictionary *dictIosArticle7 = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"South Asia", @"SA",nil] forKeys:[NSArray arrayWithObjects:@"Name",@"Desc", nil]];
    NSDictionary *dictIosArticle8 = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"United Kingdom", @"UK",nil] forKeys:[NSArray arrayWithObjects:@"Name",@"Desc", nil]];
    
    arrItems = [[NSMutableArray alloc] initWithObjects:dictIosArticle1,dictIosArticle2,dictIosArticle3,dictIosArticle4,dictIosArticle5,dictIosArticle6,dictIosArticle7,dictIosArticle8, nil];

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [arrItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    
    NSDictionary *dictTmp = [arrItems objectAtIndex:indexPath.row];
    cell.textLabel.text = [dictTmp objectForKey:@"Name"];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:14.0];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    
    
    NewsController *detailViewController = [[NewsController alloc] initWithNibName:@"NewsController" bundle:nil];
 
    
  
        
        NSDictionary *dictTemp = [arrItems objectAtIndex:indexPath.row];
        detailViewController.strDesc = [dictTemp objectForKey:@"Desc"];
        // Pass the selected object to the new view controller.
        
        // Push the view controller.
        [self.navigationController pushViewController:detailViewController animated:YES];

    
    [detailViewController release];

}


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

@end
