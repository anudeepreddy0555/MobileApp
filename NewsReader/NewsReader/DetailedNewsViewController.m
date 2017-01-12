//
//  DetailedNewsViewController.m
//  NewsReader
//
//  Created by Sai kumar Gourishetty on 12/8/14.
//  Copyright (c) 2014 Sai kumar Gourishetty. All rights reserved.
//

#import "DetailedNewsViewController.h"
#import <Social/Social.h>
#import <MessageUI/MessageUI.h>
#import <Twitter/Twitter.h>

@interface DetailedNewsViewController () <UIActionSheetDelegate,MFMailComposeViewControllerDelegate>

@end

@implementation DetailedNewsViewController
@synthesize strDesc,strLink,viewDescription,strTitle;
- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(addCategory)];
   /* NSMutableString *html = [strDesc mutableCopy];
    //NSMutableString *html;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"<img[^>]*>"
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                                            error:nil];
    
  
    
    [regex replaceMatchesInString:html options:0 range:NSMakeRange(0, html.length) withTemplate:@""];*/

   NSRange r;
   //NSString *s;
   //s=strDesc;
    while ((r = [strDesc rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
        strDesc = [strDesc stringByReplacingCharactersInRange:r withString:@""];
    
    //s=strDesc;
    //if(strDesc.eq"")
   
   // self.viewDescription.frame = CGRectMake(self.viewDescription.frame.origin.x, self.viewDescription.frame.origin.y, self.viewDescription.contentSize.width, self.viewDescription.contentSize.height);
    
    NSMutableString *final = [NSMutableString stringWithString:strTitle];
    
    [final appendString:@"\n \n"];
    [final appendString:strDesc];
    
    [final appendString:@"\n \n"];
    [final appendString:strLink];
    
    self.viewDescription.text=final;
    
    strDesc=@"News";
    
   //strDesc = final;
    
   // strDesc=[NSString stringWithString:final];
    
    //strDes
    //strDesc=@"cd";
  /*  self.viewDescription.dataDetectorTypes = UIDataDetectorTypeAll;
    self.viewDescription.textAlignment = NSTextAlignmentLeft;
    self.viewDescription.textContainer.lineFragmentPadding = 0;
    self.viewDescription.textContainerInset = UIEdgeInsetsZero;*/
    self.viewDescription.editable= NO ;
    /*CGFloat wrappingWidth = self.viewDescription.bounds.size.width - (self.viewDescription.textContainerInset.left + self.viewDescription.textContainerInset.right + 2 * self.viewDescription.textContainer.lineFragmentPadding);*/
    
   /* CGRect boundingRect = [self.viewDescription  boundingRectWithSize:CGSizeMake(wrappingWidth, CGFLOAT_MAX)
                                             options:NSStringDrawingUsesLineFragmentOrigin // this is important
                                          attributes:@{ NSFontAttributeName: self.viewDescription.font } // and any other attributes of your text
                                             context:nil];*/
    
   // NSLog(@"%f",wrappingWidth);
    
    // Do any additional setup after loading the view from its nib.
}

-(void) addCategory
{
    UIActionSheet *popup = [[UIActionSheet alloc] initWithTitle:@"Select Sharing option:" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:
                            @"Share on Facebook",
                            @"Share on Twitter",
                            @"Share via E-mail",
                            nil];
    popup.tag = 1;
    [popup showInView:[UIApplication sharedApplication].keyWindow];
    
}
-(void)ShareFacebook
{
    SLComposeViewController *fbController=[SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
    {
        SLComposeViewControllerCompletionHandler __block completionHandler=^(SLComposeViewControllerResult result){
            
            [fbController dismissViewControllerAnimated:YES completion:nil];
            
            switch(result){
                case SLComposeViewControllerResultCancelled:
                default:
                {
                    NSLog(@"Cancelled.....");
                    // [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs://"]];
                    
                }
                    break;
                case SLComposeViewControllerResultDone:
                {
                    NSLog(@"Posted....");
                }
                    break;
            }};
        
        
        [fbController setInitialText:@"This is My Sample Text"];
        
        
        [fbController setCompletionHandler:completionHandler];
        [self presentViewController:fbController animated:YES completion:nil];
    }
    else{
        UIAlertView *alert = [[[UIAlertView alloc]initWithTitle:@"Sign in!" message:@"Please first Sign In!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil]autorelease];
        [alert show];
    }
}


-(void)emailContent
{
    
    if ([MFMailComposeViewController canSendMail])
    {
         MFMailComposeViewController *mail = [[MFMailComposeViewController alloc] init];
         mail.mailComposeDelegate = self;
         [mail setSubject:@"News"];
         [mail setMessageBody:strLink isHTML:NO];
          [mail setToRecipients:@[@"anudeepreddy0555@gmail.com"]];
        
         [self presentViewController:mail animated:YES completion:NULL];
    }
    else
    {
           NSLog(@"This device cannot send email");
    }
    
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result) {
        case MFMailComposeResultSent:
            NSLog(@"You sent the email.");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"You saved a draft of this email");
            break;
        case MFMailComposeResultCancelled:
            NSLog(@"You cancelled sending this email.");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail failed:  An error occurred when trying to compose this email");
            break;
        default:
            NSLog(@"An error occurred when trying to compose this email");
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}
-(void)TwitterShare
{


if ([TWTweetComposeViewController canSendTweet])
{
    TWTweetComposeViewController *tweetSheet =
    [[TWTweetComposeViewController alloc] init];
    [tweetSheet setInitialText:@"Tweeting from iOS 5 By Tutorials! :)"];
    [self presentModalViewController:tweetSheet animated:YES];
}
else
{
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"Sorry"
                              message:@"You can't send a tweet right now, make sureyour device has an internet connection and you haveat least one Twitter account setup"
                              delegate:self
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
    [alertView show];
}

}

- (void)actionSheet:(UIActionSheet *)popup clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    switch (popup.tag) {
        case 1: {
            switch (buttonIndex) {
                case 0:
                    [self ShareFacebook];
                    break;
                case 1:
                    [self TwitterShare];
                    break;
                case 2:
                    [self emailContent];
                    break;
                default:
                    break;
            }
            break;
        }
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
    // Dispose of any resources that can be recreated.
}


-(void) dealloc
{
    [viewDescription release];
    [strDesc release];
    [strLink release];
    [strTitle release];
    [super dealloc];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
