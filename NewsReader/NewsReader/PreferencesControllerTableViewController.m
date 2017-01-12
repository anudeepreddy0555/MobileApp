//
//  PreferencesControllerTableViewController.m
//  NewsReader
//
//  Created by  on 11/14/14.
//  Copyright (c) 2014 . All rights reserved.
//

#import "PreferencesControllerTableViewController.h"

@interface PreferencesControllerTableViewController ()

@end

@implementation PreferencesControllerTableViewController


@synthesize delegatePreference,reorderingRows,switchObj;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
   
    self.originalRows=[[NSMutableArray alloc]initWithObjects:@"Technology",@"Sports",@"Business",@"Science",@"Health",nil];
    self.reorderingRows = [[NSMutableArray alloc]initWithObjects:@"Technology",@"Sports",@"Business",@"Science",@"Health",nil];

    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *arrayofRows = [userDefaults objectForKey:@"reorderingRows"];
     if(arrayofRows!=NULL)
    {
        self.originalRows=arrayofRows;
        self.reorderingRows = arrayofRows;
        
    }
    

     self.navigationItem.rightBarButtonItem = self.editButtonItem;


}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

-(void) dealloc
{
    [switchObj release];
   [delegatePreference release];

    [super dealloc];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
   return [self.reorderingRows count];
}


- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
   
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *stringToMove = [self.reorderingRows objectAtIndex:sourceIndexPath.row];
    [self.reorderingRows removeObjectAtIndex:sourceIndexPath.row];
    [self.reorderingRows insertObject:stringToMove atIndex:destinationIndexPath.row];
    
    [userDefaults setObject:self.reorderingRows forKey:@"reorderingRows"];
    [userDefaults synchronize];
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if(tableView.editing==YES){
//        NSLog(@"cell editing is yes");
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mycell"];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mycell"];
//    }
//        
//        NSString *cellValue = [self.reorderingRows objectAtIndex:indexPath.row];
//        
//        cell.textLabel.text = cellValue;
////        
////    if(indexPath.row == 0)    {
////        cell.textLabel.text = ;
////    }
//// 
////    else if(indexPath.row == 1)    {
////        cell.textLabel.text = @"Medium";
////    }
////    else if(indexPath.row == 2)    {
////        cell.textLabel.text = @"Difficult";
////    }
//         NSLog(@"cell value: %@", cell);
//   return cell;
//
//  }
//
//    else{
    
    
    UILabel *mainLabel;
   // UISwitch *switchObj1;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellWithSwitch"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellWithSwitch"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.font = [UIFont systemFontOfSize:14];
    
        mainLabel = [[UILabel alloc] initWithFrame:CGRectMake(40.0, 0.0, 220.0, 15.0)];
       
        mainLabel.font = [UIFont systemFontOfSize:14.0];
       
        mainLabel.textColor = [UIColor blackColor];
        mainLabel.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleHeight;
        [cell.contentView addSubview:mainLabel];
        
        
       switchObj= [[UISwitch alloc] initWithFrame:CGRectMake(225.0, 0.0, 80.0, 45.0)];
     
       switchObj.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleHeight;
        switchObj.tag=indexPath.row;
        NSString* myArrayElement = [self.originalRows objectAtIndex:indexPath.row];
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSString *savedValue = [userDefaults stringForKey:myArrayElement];
      
        if(savedValue!=NULL && [savedValue isEqualToString:@"true"])
        {

            switchObj.on=YES;
        }
        
        
    [switchObj addTarget:self action:@selector(toggleSoundEffects:)  forControlEvents:(UIControlEventValueChanged | UIControlEventTouchDragInside) ];
        
      
        
        [cell.contentView addSubview:switchObj];
    }
    
    else{
         mainLabel = (UILabel *)[cell.contentView viewWithTag:1];
        switchObj = (UISwitch *)[cell.contentView viewWithTag:indexPath.row];
    }
    
    //switchObj = [[UISwitch alloc] initWithFrame:CGRectMake(1.0, 1.0, 20.0, 20.0)];
    //switchObj.tag=indexPath.row;
      mainLabel.text = [self.reorderingRows objectAtIndex:indexPath.row];
    
   
   
    
    
   
  


    

    return cell;
    }

-(void)viewDidAppear:(BOOL)animated
{
   //NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    //self.reorderingRows  = [userDefaults objectForKey:@"reorderingRows"];
  // [self.tableView reloadData];
}



- (void)toggleSoundEffects:(id) switches{
    
    
    UISwitch* switcher = (UISwitch*)switches;
    
    
    
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString* myArrayElement = [self.originalRows objectAtIndex:switcher.tag];
    
   
   
    
    if ([switcher isOn]) {
       
        [userDefaults setObject:@"true" forKey:myArrayElement];
        
    } else {
        
        [userDefaults setObject:@"false" forKey:myArrayElement];
    }
        [self.delegatePreference reorderCategoryItems:reorderingRowsPreferences];
    

   
     [userDefaults synchronize];
    
    
    
    
}
     

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleNone;
}




// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    UISwitch* switcher = (UISwitch*)[cell.contentView viewWithTag:indexPath.row];
    [switcher setOn:!switcher.on animated:YES];
    [self toggleSoundEffects:switcher];
    
  
}


@end
