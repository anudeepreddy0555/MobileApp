//
//  SPTArticleDetailViewController.m
//  NewsReader
//
//  Created by  on 11/5/14.
//  Copyright (c) 2014 . All rights reserved.
//

#import "SPTArticleDetailViewController.h"

@interface SPTArticleDetailViewController ()

@end

@implementation SPTArticleDetailViewController

@synthesize strDesc;
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
     self.title = @"Description";
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.txtDetails.text = strDesc;
}


@end
