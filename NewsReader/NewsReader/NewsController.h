//
//  NewsController.h
//  NewsReader
//
//  Created by  on 11/8/14.
//  Copyright (c) 2014 . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsController : UITableViewController <NSXMLParserDelegate>
@property (nonatomic,strong) NSString *strDesc;
@end
