//
//  TableViewCell.h
//  NewsReader
//
//  Created by  on 12/6/14.
//  Copyright (c) 2014 . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UILabel *textData;
- (IBAction)textValue:(id)sender;

@end
