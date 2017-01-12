//
//  DetailedNewsViewController.h
//  NewsReader
//
//  Created by Sai kumar Gourishetty on 12/8/14.
//  Copyright (c) 2014 Sai kumar Gourishetty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailedNewsViewController : UIViewController
@property (nonatomic,strong) NSString *strDesc,*strLink,*strTitle;
@property (strong, nonatomic) IBOutlet UITextView *viewDescription;
@end
