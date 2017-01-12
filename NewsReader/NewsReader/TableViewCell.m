//
//  TableViewCell.m
//  NewsReader
//
//  Created by  on 12/6/14.
//  Copyright (c) 2014 . All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell
@synthesize textData;
- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [textData release];
    [super dealloc];
}
- (IBAction)textValue:(id)sender {
    
}
@end
