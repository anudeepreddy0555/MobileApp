//
//  AddCategoryController.h
//  NewsReader
//
//  Created by  on 11/4/14.
//  Copyright (c) 2014 . All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol AddCategoryDelegate <NSObject>

-(void) addCategoryName:(NSString *)strName andArticleDesc:(NSString *) strArticleDesc;

@end

@interface AddCategoryController : UIViewController

@property (unsafe_unretained) id <AddCategoryDelegate> delegate;

/*---------write some code for IBOUTlet-----------------*/
@property (retain, nonatomic) IBOutlet UITextField *txtArea;
@property (retain, nonatomic) IBOutlet UITextField *txtDesc;

- (void)saveAction;
- (void)cancelAction;
@end
