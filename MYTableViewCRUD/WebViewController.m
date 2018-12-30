//
//  WebViewController.m
//  MYTableViewCRUD
//
//  Created by student on 7/1/17.
//  Copyright © 2017 student. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
  self.AImage.image = [UIImage imageNamed:self.imageStr];
  
  NSURLRequest * req = [NSURLRequest requestWithURL:[NSURL URLWithString:self.url]];
  
  dispatch_async(dispatch_get_main_queue(), ^{
    [self.webView loadRequest:req];

  });
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
