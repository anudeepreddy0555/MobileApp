//
//  NewsController.m
//  NewsReader
//
//  Created by  on 11/8/14.
//  Copyright (c) 2014 . All rights reserved.
//

#import "NewsController.h"
#import "DetailedNewsViewController.h"
@interface NewsController (){
    NSXMLParser *parser;
    NSMutableArray *feeds;
    NSMutableDictionary *item;
    NSMutableString *title;
    NSMutableString *link;
    NSString *element;
     NSString *path;//sangeeta
    NSMutableString *description;
    
}

@end

@implementation NewsController
@synthesize strDesc;

- (void)awakeFromNib
{
    [super awakeFromNib];
}
-(void) dealloc
{
    
    [strDesc release];
 
    [super dealloc];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
      self.title = strDesc;
    feeds = [[NSMutableArray alloc] init];
    
    //path = @"http://sports.yahoo.com/mlb/teams/bos/rss.xml";
    
     if([strDesc isEqualToString:@"Sports"])
         path = @"http://timesofindia.indiatimes.com/rssfeeds/4719148.cms";
    else if([strDesc isEqualToString:@"Business"])
         path = @"http://timesofindia.indiatimes.com/rssfeeds/1898055.cms";
    else if([strDesc isEqualToString:@"Technology"])
        path = @"http://timesofindia.indiatimes.com/rssfeeds/5880659.cms";
    else if([strDesc isEqualToString:@"Health"])
        path = @"http://timesofindia.indiatimes.com/rssfeeds/3908999.cms";
    else if([strDesc isEqualToString:@"Science"])
        path = @"http://timesofindia.indiatimes.com/rssfeeds/-2128672765.cms";
    
    //self.title = @"News";
    //Code by sangeeta
    
    else if([strDesc isEqual:(@"AF")]){
        path = @"http://feeds.news24.com/articles/news24/Africa/rss";
    }
    else if([strDesc isEqual:(@"AM")]){
        path = @"http://timesofindia.indiatimes.com/rssfeeds/30359486.cms";
    }
    else if([strDesc isEqual:(@"AP")]){
        path = @"http://www.channelnewsasia.com/rss/latest_cna_asiapac_rss.xml";
    }
    else if([strDesc isEqual:(@"AU")]){
        path = @"http://feeds.news.com.au/public/rss/2.0/aus_business_811.xml";
    }
    else if([strDesc isEqual:(@"EU")]){
        path = @"http://timesofindia.indiatimes.com/rssfeeds/1898274.cms";
    }
    else if([strDesc isEqual:(@"ME")]){
        path = @"http://timesofindia.indiatimes.com/rssfeeds/1898272.cms";
    }
    else if([strDesc isEqual:(@"SA")]){
        path = @"http://timesofindia.indiatimes.com/rssfeeds/3907412.cms";
    }
    else if([strDesc isEqual:(@"UK")]){
        path = @"http://timesofindia.indiatimes.com/rssfeeds/2177298.cms";
    }
    else if([strDesc isEqual:(@"Most Viewed")]){
        path = @"http://timesofindia.indiatimes.com/rssfeedmostread.cms";
    }
    
    else if([strDesc isEqual:(@"Most Shared")]){
        path = @"http://timesofindia.indiatimes.com/rssfeedmostemailed.cms";
    }

    NSURL *url = [NSURL URLWithString:path];//sangeeta
    
    parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    [parser setDelegate:self];
    [parser setShouldResolveExternalEntities:NO];
    [parser parse];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)viewDidAppear:(BOOL)animated
{
    self.title = strDesc;
    
    feeds = [[NSMutableArray alloc] init];
    
    //path = @"http://sports.yahoo.com/mlb/teams/bos/rss.xml";
    
   /*if([strDesc isEqualToString:@"Sports"])
        path = @"http://www.nytimes.com/services/xml/rss/nyt/InternationalSports.xml";
    else if([strDesc isEqualToString:@"Business"])
        path = @"http://feeds.nytimes.com/nyt/rss/Business";
    else if([strDesc isEqualToString:@"Technology"])
        path = @"http://feeds.nytimes.com/nyt/rss/Technology";
    else if([strDesc isEqualToString:@"Health"])
        path = @"http://www.nytimes.com/services/xml/rss/nyt/Health.xml";
    else if([strDesc isEqualToString:@"Science"])
        path = @"http://www.nytimes.com/services/xml/rss/nyt/Science.xml";*/
    
    if([strDesc isEqualToString:@"Sports"])
        path = @"http://timesofindia.indiatimes.com/rssfeeds/4719148.cms";
    else if([strDesc isEqualToString:@"Business"])
        path = @"http://timesofindia.indiatimes.com/rssfeeds/1898055.cms";
    else if([strDesc isEqualToString:@"Technology"])
        path = @"http://timesofindia.indiatimes.com/rssfeeds/5880659.cms";
    else if([strDesc isEqualToString:@"Health"])
        path = @"http://timesofindia.indiatimes.com/rssfeeds/3908999.cms";
    else if([strDesc isEqualToString:@"Science"])
        path = @"http://timesofindia.indiatimes.com/rssfeeds/-2128672765.cms";
    
    
    //self.title = @"News";
    //Code by sangeeta
    
    else if([strDesc isEqual:(@"AF")]){
        path = @"http://feeds.news24.com/articles/news24/Africa/rss";
    }
    else if([strDesc isEqual:(@"AM")]){
        path = @"http://timesofindia.indiatimes.com/rssfeeds/30359486.cms";
    }
    else if([strDesc isEqual:(@"AP")]){
        path = @"http://www.channelnewsasia.com/rss/latest_cna_asiapac_rss.xml";
    }
    else if([strDesc isEqual:(@"AU")]){
        path = @"http://feeds.news.com.au/public/rss/2.0/aus_business_811.xml";
    }
    else if([strDesc isEqual:(@"EU")]){
        path = @"http://timesofindia.indiatimes.com/rssfeeds/1898274.cms";
    }
    else if([strDesc isEqual:(@"ME")]){
        path = @"http://timesofindia.indiatimes.com/rssfeeds/1898272.cms";
    }
    else if([strDesc isEqual:(@"SA")]){
        path = @"http://timesofindia.indiatimes.com/rssfeeds/3907412.cms";
    }
    else if([strDesc isEqual:(@"UK")]){
        path = @"http://timesofindia.indiatimes.com/rssfeeds/2177298.cms";
    }
    
    else if([strDesc isEqual:(@"Most Viewed")]){
        path = @"http://timesofindia.indiatimes.com/rssfeedmostread.cms";
    }
    
    else if([strDesc isEqual:(@"Most Shared")]){
        path = @"http://timesofindia.indiatimes.com/rssfeedmostemailed.cms";
    }
    NSURL *url = [NSURL URLWithString:path];//sangeeta
    


    

    
    parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    [parser setDelegate:self];
    [parser setShouldResolveExternalEntities:NO];
    [parser parse];
    
    
    
     [self.tableView reloadData];
    
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
    return feeds.count;
}
- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    //self.txtDetails.text = strDesc;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
      static NSString *CellIdentifier = @"Cell";
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
   // UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    //cell.textLabel.text = [[feeds objectAtIndex:indexPath.row] objectForKey: @"title"];
    //return cell;
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    
    NSDictionary *dictTmp = [feeds objectAtIndex:indexPath.row];
    cell.textLabel.numberOfLines = 0;//sangeeta
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;//sangeeta
    cell.textLabel.text = [dictTmp objectForKey:@"title"];
    
    
    cell.textLabel.font = [UIFont boldSystemFontOfSize:14.0];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
    
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    element = elementName;
    
    if ([element isEqualToString:@"item"]) {
        
        item    = [[NSMutableDictionary alloc] init];
        title   = [[NSMutableString alloc] init];
        link    = [[NSMutableString alloc] init];
        description=[[NSMutableString alloc] init];
    }

    
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if ([elementName isEqualToString:@"item"]) {
        
        [item setObject:title forKey:@"title"];
        [item setObject:link forKey:@"link"];
        [item setObject:description forKey:@"description"];
        [feeds addObject:[item copy]];
        
    }

    
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    if ([element compare:@"title" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
        [title appendString:string];
    } else if ([element compare:@"link" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
        [link appendString:string];
    }
    else if ([element compare:@"description" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
        [description appendString:string];
     }
    
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
    
    [self.tableView reloadData];
    
}
//code by sangeeta
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    int rowHeight =0.0f;
    NSDictionary *dictTmp = [feeds objectAtIndex:indexPath.row];
    NSString *longStringValue = [dictTmp objectForKey:@"title"];
    NSString *stringToSize=[NSString stringWithFormat:@"%@",longStringValue];
    CGSize size = [stringToSize
                   sizeWithFont:[UIFont systemFontOfSize:15.0f]
                   constrainedToSize:CGSizeMake(3000, 6000)
                   lineBreakMode:NSLineBreakByWordWrapping];
    rowHeight = size.height+20;
    return rowHeight;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    
     NSDictionary *dictTmp = [feeds objectAtIndex:indexPath.row];
    
    
    DetailedNewsViewController *detailViewController1 = [[DetailedNewsViewController alloc] initWithNibName:@"DetailedNewsViewController" bundle:nil];
   
    detailViewController1.strTitle=[dictTmp objectForKey:@"title"];
    detailViewController1.strDesc=[dictTmp objectForKey:@"description"];
    detailViewController1.strLink=[dictTmp objectForKey:@"link"];
        //NSDictionary *dictTemp = [arrItems objectAtIndex:indexPath.row];
        //detailViewController.strDesc = [dictTemp objectForKey:@"Desc"];
        // Pass the selected object to the new view controller.
        
        // Push the view controller.
        [self.navigationController pushViewController:detailViewController1 animated:YES];


    [detailViewController1 release];
}


/*
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSString *string = [feeds[indexPath.row] objectForKey: @"link"];
        [[segue destinationViewController] setUrl:string];
        
    }
}*/


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
