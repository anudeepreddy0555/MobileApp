//
//  CategoryController.h
//  NewsReader
//
//  Created by  on 11/4/14.
//  Copyright (c) 2014 . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddCategoryController.h"
@class PreferencesControllerTableViewController;
@interface CategoryController : UITableViewController
@property (nonatomic,strong) NSMutableArray *arrItems;
@end
