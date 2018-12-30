//
//  WebViewController.h
//  MYTableViewCRUD
//
//  Created by student on 7/1/17.
//  Copyright © 2017 student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *AImage;

@property (strong, nonatomic) IBOutlet UIWebView *webView;

@property NSString * imageStr;
@property NSString * url;



@end
