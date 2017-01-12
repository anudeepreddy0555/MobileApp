//
//  SPTArticleDetailViewController.h
//  NewsReader
//
//  Created by  on 11/5/14.
//  Copyright (c) 2014 . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SPTArticleDetailViewController : UIViewController
@property (nonatomic,strong) IBOutlet UITextView *txtDetails;

@property (nonatomic,strong) NSString *strDesc;
@end
