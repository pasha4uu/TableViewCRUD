//
//  MYTableViewController.h
//  MYTableViewCRUD
//
//  Created by student on 7/1/17.
//  Copyright © 2017 student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TollyTableViewCell.h"
#import "BollyTableViewCell.h"
#import "CricketTableViewCell.h"
#import "WebViewController.h"
@interface MYTableViewController : UITableViewController


@property NSMutableArray *TWActorsArr;
@property NSMutableArray *BWActorsArr;
@property NSMutableArray *CKTSArr;


@property NSMutableArray *TWActorsImgArr;
@property NSMutableArray *BWActorsImgArr;
@property NSMutableArray *CKTSImgArr;


@property NSMutableArray *TWActorsWiki;
@property NSMutableArray *BWActorsWiki;
@property NSMutableArray *CKTSWiki;

@end
