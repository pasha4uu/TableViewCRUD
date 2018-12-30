//
//  MYTableViewController.m
//  MYTableViewCRUD
//
//  Created by student on 7/1/17.
//  Copyright © 2017 student. All rights reserved.
//

#import "MYTableViewController.h"

@interface MYTableViewController ()

@end

@implementation MYTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createElements];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


-(void)createElements
{
    self.TWActorsArr=[[NSMutableArray alloc]initWithObjects:@"Pawan Kalyan",@"Allu Arjun",@"Nani",@"Mahesh Babu", nil];
    
    self.TWActorsImgArr=[[NSMutableArray alloc]initWithObjects:@"Pawan2.jpeg",@"Allu Arjun.jpg",@"nani.jpg",@"maheshBabu.jpeg", nil];
    
    self.BWActorsArr=[[NSMutableArray alloc]initWithObjects:@"Aamir",@"Hrithik Roshan",@"John Abraham",@"Salman Khan", nil];
    
    self.BWActorsImgArr=[[NSMutableArray alloc]initWithObjects:@"aamir.jpg",@"Hrithik-Roshan.jpg",@"john-abraham",@"salman-khan.jpg", nil];
    self.CKTSArr=[[NSMutableArray alloc]initWithObjects:@"Dhoni",@"jadhav",@"Virat",@"Yuv Raj", nil];
    
    self.CKTSImgArr=[[NSMutableArray alloc]initWithObjects:@"Dhoni.jpeg",@"jadhav.jpg",@"Virat.jpeg",@"yuvi.jpeg", nil];

    self.TWActorsWiki=[[NSMutableArray alloc]initWithObjects:
                       @"https://en.wikipedia.org/wiki/Pawan_Kalyan",
                       @"https://en.wikipedia.org/wiki/Allu_Arjun",
                       @"https://en.wikipedia.org/wiki/Nani_(actor)",
                       @"https://en.wikipedia.org/wiki/Mahesh_Babu",
                       nil];
    
    self.BWActorsWiki=[[NSMutableArray alloc]initWithObjects:
                       @"https://en.wikipedia.org/wiki/Aamir_Khan",
                       @"https://en.wikipedia.org/wiki/Hrithik_Roshan",
                       @"https://en.wikipedia.org/wiki/John_Abraham_(actor)",
                       @"https://en.wikipedia.org/wiki/Salman_Khan",
                       nil];
    
    self.CKTSWiki=[[NSMutableArray alloc]initWithObjects:
                       @"https://en.wikipedia.org/wiki/MS_Dhoni",
                       @"https://en.wikipedia.org/wiki/Kedar_Jadhav",
                       @"https://en.wikipedia.org/wiki/Virat_Kohli",
                       @"https://en.wikipedia.org/wiki/Yuvraj_Singh",
                       nil];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    
    if(section==0)
    {
        return self.TWActorsArr.count;
    }
   else if(section==1)
    {
        return self.BWActorsArr.count;
    }
   else
    {
        return self.CKTSArr.count;
    }

   
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WebViewController *WVC=[self.storyboard instantiateViewControllerWithIdentifier:@"WEBID"];
 
        if (indexPath.section==0)
        {
          WVC.url = [self.TWActorsWiki objectAtIndex:indexPath.row];
          WVC.imageStr = [self.TWActorsImgArr objectAtIndex:indexPath.row];
        }
        else if (indexPath.section==1)
        {
          WVC.url = [self.BWActorsWiki objectAtIndex:indexPath.row];
          WVC.imageStr = [self.BWActorsImgArr objectAtIndex:indexPath.row];
        }
        else if (indexPath.section==2)
        {
          WVC.url = [self.CKTSWiki objectAtIndex:indexPath.row];
          WVC.imageStr = [self.CKTSImgArr objectAtIndex:indexPath.row];
        }
  [self.navigationController pushViewController:WVC animated:YES];

}





- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 //   TollyTableViewCell * TWCell = [tableView dequeueReusableCellWithIdentifier:@"TWCELLID" forIndexPath:indexPath];
//    BollyTableViewCell * BWCell = [tableView dequeueReusableCellWithIdentifier:@"BWCELLID" forIndexPath:indexPath];
//    
//   CricketTableViewCell * CKCell = [tableView dequeueReusableCellWithIdentifier:@"CKCELLID" forIndexPath:indexPath];
    
  if(indexPath.section==0)
   {
    TollyTableViewCell * TWCell = [tableView dequeueReusableCellWithIdentifier:@"TWCELLID" forIndexPath:indexPath];
       
    TWCell.TWLbl.text=[self.TWActorsArr objectAtIndex:indexPath.row];
    TWCell.TWImgView.image=[UIImage imageNamed:[self.TWActorsImgArr objectAtIndex:indexPath.row]];
    TWCell.TWDetails.text=@"TollyWood Actor";
       return TWCell;
        }
   else if(indexPath.section==1)
    {
        BollyTableViewCell * BWCell = [tableView dequeueReusableCellWithIdentifier:@"BWCELLID" forIndexPath:indexPath];
    BWCell.BWLbl.text=[self.BWActorsArr objectAtIndex:indexPath.row];
    BWCell.BWImgView.image=[UIImage imageNamed:[self.BWActorsImgArr objectAtIndex:indexPath.row]];
    BWCell.BWDetailsLbl.text=@"BollyWood Actor";
      return BWCell;
    }
     else
    {
        CricketTableViewCell * CKCell = [tableView dequeueReusableCellWithIdentifier:@"CKCELLID" forIndexPath:indexPath];
        
    CKCell.CKLbl.text=[self.CKTSArr objectAtIndex:indexPath.row];
    CKCell.CKImgView.image=[UIImage imageNamed:[self.CKTSImgArr objectAtIndex:indexPath.row]];
    CKCell.CKDetailsLbl.text=@"Cricketer";
      return CKCell;
    }
    // Configure the cell...
    
    return nil;

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0)
    {
        return 175;
    }
    else if(indexPath.section==1)
    {
        return 188;
    }
   else
    {
        return 173;
    }
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section==0)
    {
    return @"TOLLYWOOD";
    }
    if(section==1)
    {
        return @"BOLLYWOOD";
    }
    else
    {
        return @"CRICKET";
    }
    
}
- (nullable NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    if(section==0)
    {
        return @"---------------------END-------------------";
    }
    if(section==1)
    {
        return @"---------------------END-------------------";
    }
    else
    {
        return @"---------------------END-------------------";
    }

}




// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0)
    {
        if([[self.TWActorsArr objectAtIndex:indexPath.row] isEqualToString:@"Nani"])
        {
            return UITableViewCellEditingStyleDelete;
        }
        else
        {
            return UITableViewCellEditingStyleInsert;
        }
    }
   else if(indexPath.section==1)
    {
        if([[self.BWActorsArr objectAtIndex:indexPath.row] isEqualToString:@"Salman Khan"])
        {
            return UITableViewCellEditingStyleDelete;
        }
        else
        {
            return UITableViewCellEditingStyleInsert;
        }
    }
    else
    {
        if([[self.CKTSArr objectAtIndex:indexPath.row] isEqualToString:@"jadhav"])
        {
            return UITableViewCellEditingStyleDelete;
        }
        else
        {
            return UITableViewCellEditingStyleInsert;
        }
    }

    
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
   if(editingStyle==UITableViewCellEditingStyleDelete)
   {
       [tableView beginUpdates];
       [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
       
       if(indexPath.section==0)
       {
           [self.TWActorsArr removeObjectAtIndex:indexPath.row];
       }
       else if(indexPath.section==1)
       {
          [self.BWActorsArr removeObjectAtIndex:indexPath.row];
       }
       else
       {
           [self.CKTSArr removeObjectAtIndex:indexPath.row];
       }
       [tableView endUpdates];
   }

    else if (editingStyle==UITableViewCellEditingStyleInsert)
    {
        [tableView beginUpdates];
        
        [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        if(indexPath.section==0)
        {
            [self.TWActorsArr insertObject:@"Pavan" atIndex:indexPath.row];
            [self.TWActorsImgArr insertObject:@"Pawan2.jpeg" atIndex:indexPath.row];
            
        }
      else  if(indexPath.section==1)
        {
            [self.BWActorsArr insertObject:@"Salman" atIndex:indexPath.row];
            [self.BWActorsImgArr insertObject:@"salman-khan.jpg" atIndex:indexPath.row];
        }
        else
        {
            [self.CKTSArr insertObject:@"Virat" atIndex:indexPath.row];
            [self.CKTSImgArr insertObject:@"Virat.jpeg" atIndex:indexPath.row];
        }

         [tableView endUpdates];
    }
    
    
    
}


- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath
{
   
    if(proposedDestinationIndexPath.section!=sourceIndexPath.section)
    {
        return sourceIndexPath;
    }
    else
    {
        return proposedDestinationIndexPath;
    }
}




// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
//    NSString * moveData=[self.TWActorsArr objectAtIndex:fromIndexPath.row];    
//    [self.TWActorsArr removeObjectAtIndex:fromIndexPath.row];
//    [self.TWActorsArr insertObject:moveData atIndex:toIndexPath.row];
    
    
}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
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
