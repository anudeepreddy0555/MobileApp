//
//  AddCategoryController.m
//  NewsReader
//
//  Created by  on 11/4/14.
//  Copyright (c) 2014 . All rights reserved.
//

#import "AddCategoryController.h"

@interface AddCategoryController ()

@end

@implementation AddCategoryController
@synthesize delegate;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void) dealloc
{

    [delegate release];
    [_txtArea release];
    [_txtDesc release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [super viewDidLoad];
    self.title = @"Add Category";
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelAction)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveAction)];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)saveAction {
    [self dismissViewControllerAnimated:YES completion:nil];
    
    if((![self.txtArea.text isEqualToString:@""]) &&(![self.txtDesc.text isEqualToString:@""]))
    {
        if([self.delegate respondsToSelector:@selector(addCategoryName:andArticleDesc:)])
        {
            [self.delegate addCategoryName:self.txtArea.text andArticleDesc:self.txtDesc.text];
        }
    }

    
    /*-----------------------write
     some code for showing categories and entering zipcode*/
    

}
- (void)cancelAction{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
