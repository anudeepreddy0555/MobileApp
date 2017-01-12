//
//  CategoryController.m
//  NewsReader
//
//  Created by  on 11/4/14.
//  Copyright (c) 2014 . All rights reserved.
//

#import "CategoryController.h"
#import "NewsController.h"
#import "StateController.h"
#import "PreferencesControllerTableViewController.h"
@interface CategoryController ()
@property(nonatomic,strong) AddCategoryController *addController;
@property(nonatomic,strong) PreferencesControllerTableViewController *preferencesCOntroller;
@end

@implementation CategoryController
@synthesize arrItems,addController,preferencesCOntroller;

-(void) dealloc
{
    [arrItems release];
    [addController release];
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
-(void)viewDidAppear:(BOOL)animated
{
    
    
    [self addCategoryName:@"gdfgd" andArticleDesc:@"gdfdf"];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Category";
    //self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    
    
     self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addCategory)];
    
    
    /* NSDictionary *dictIosArticle1 = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"US News", @"US States",nil] forKeys:[NSArray arrayWithObjects:@"Name",@"Desc", nil]];*/
     NSDictionary *dictIosArticle1 = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"World News", @"World News",nil] forKeys:[NSArray arrayWithObjects:@"Name",@"Desc", nil]];//changed by sangeeta
    
    NSDictionary *dictIosArticle2 = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"Most Viewed", @"Most Viewed",nil] forKeys:[NSArray arrayWithObjects:@"Name",@"Desc", nil]];
    NSDictionary *dictIosArticle3 = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"Most Shared", @"Most Shared",nil] forKeys:[NSArray arrayWithObjects:@"Name",@"Desc", nil]];
    arrItems = [[NSMutableArray alloc] initWithObjects:dictIosArticle1,dictIosArticle2,dictIosArticle3, nil];

   // arrItems = [[NSMutableArray alloc] initWithObjects:dictIosArticle1,nil];
    
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
/*-(void) addCategory
{
    NSLog(@"ADDCATEGORY");
    addController = [[AddCategoryController alloc] initWithNibName:@"AddCategoryController" bundle:nil];
    addController.delegate = self;
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:addController];
    
    [self presentViewController:navController animated:YES completion:nil];
    
}*/

-(void) addCategory
{
    
    int i;
    for(i=[arrItems count]-1;i>=3;i--)
    {
        
        [arrItems removeObjectAtIndex:i];

    }
    preferencesCOntroller = [[PreferencesControllerTableViewController alloc] initWithNibName:@"PreferencesControllerTableViewController" bundle:nil];
   // preferencesCOntroller.delegate = self;
    
    //UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:preferencesCOntroller];
    
     [self.navigationController pushViewController:preferencesCOntroller animated:YES];
    
}

-(void) reorderCategoryItems:(NSArray *)categoryEnableArray{
    NSArray *preferencerencesArray=[[NSArray alloc] init];
    preferencerencesArray=categoryEnableArray;
    
    
    
}

-(void) addCategoryName:(NSString *)strName andArticleDesc:(NSString *) strArticleDesc
{
    
    /*---------------write some code here*
      as per the preferences added*/
    
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSArray *arrayofRows = [userDefaults objectForKey:@"reorderingRows"];
    
    if(arrayofRows!=NULL)
    {
        
        int i;

        for(i=0;i<[arrayofRows count];i++)
        {
             NSString* myArrayElement = [arrayofRows objectAtIndex:i];
            NSString *savedValue = [userDefaults stringForKey:myArrayElement];
           
            if(savedValue!=NULL && [savedValue isEqualToString:@"true"])
            {
            
            NSMutableDictionary *mutDict = [[NSMutableDictionary alloc] init];
            [mutDict setObject:myArrayElement forKey:@"Name"];
            [mutDict setObject:myArrayElement forKey:@"Desc"];
            [arrItems addObject:mutDict];
            }
   
            }
    }
    [self.tableView reloadData];
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
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    
    StateController *detailViewController1 = [[StateController alloc] initWithNibName:@"StateController" bundle:nil];
    NewsController *detailViewController = [[NewsController alloc] initWithNibName:@"NewsController" bundle:nil];
     if(indexPath.row == 0)    {
     
        [self.navigationController pushViewController:detailViewController1 animated:YES];
     
     }
    
     else{
   
    NSDictionary *dictTemp = [arrItems objectAtIndex:indexPath.row];
  detailViewController.strDesc = [dictTemp objectForKey:@"Desc"];
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
   [self.navigationController pushViewController:detailViewController animated:YES];
     }
    int i;
    for(i=[arrItems count]-1;i>=3;i--)
    {
       
        [arrItems removeObjectAtIndex:i];
        
    }
    
    [detailViewController release];
    [detailViewController1 release];
     }

@end
