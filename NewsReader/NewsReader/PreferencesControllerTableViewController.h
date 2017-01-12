//
//  PreferencesControllerTableViewController.h
//  NewsReader
//
//  Created by  on 11/14/14.
//  Copyright (c) 2014 . All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol preferenceControllerDelegate <NSObject>

-(void) reorderCategoryItems:(NSMutableArray *)categoryEnableArray;


@end







@interface PreferencesControllerTableViewController : UITableViewController


{
    NSInteger temp;

NSMutableArray *reorderingRowsPreferences;
}
@property (nonatomic, strong) UISwitch *switchObj;
@property (nonatomic, strong) id <preferenceControllerDelegate> delegatePreference;
@property (nonatomic, strong) NSMutableArray *reorderingRows;
@property (nonatomic, strong) NSMutableArray *originalRows;

@end
