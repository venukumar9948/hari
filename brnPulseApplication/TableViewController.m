//
//  TableViewController.m
//  brnPulseApplication
//
//  Created by student on 10/28/17.
//  Copyright © 2017 student. All rights reserved.
//

#import "TableViewController.h"
#import "AppDelegate.h"


@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createElement];
    // Do any additional setup after loading the view.
}
-(void)createElement{
    
    self.imageView.layer.cornerRadius=self.imageView.frame.size.width/2;
    self.imageView.clipsToBounds=YES;
    self.profileImage.layer.cornerRadius=35;
    self.profileImage.clipsToBounds=YES;

    
    self.menu = [[NSMutableArray alloc]initWithObjects:@"Home",@"Daily Status",@"Create Request",@"Apply Leave",@"App Search",@"Attendance Details",@"Logout", nil];
    
    self.pulseTableView.scrollEnabled=NO;
    self.pulseTableView.delegate=self;
    self.pulseTableView.dataSource=self;
    
    
    AppDelegate *appdel =(AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    
    self.imageStrg =[appdel.dataArry objectAtIndex:0];
    
    self.imageStrg =[self.imageStrg stringByReplacingOccurrencesOfString:@".." withString:@""];
    
 NSString *test =[@"http://www.brninfotech.com/pulse/modules" stringByAppendingString:self.imageStrg];
    
    self.profileImage.image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:test]]];
    
    self.studentName.text=[appdel.dataArry objectAtIndex:1];
    self.studentID.text=[appdel.dataArry objectAtIndex:3];
    self.batchID.text=[appdel.dataArry objectAtIndex:2];


}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;{



    return self.menu.count;



}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;{
    
    
    
    
    NSString *cellIdentify =[self.menu objectAtIndex:indexPath.row];
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentify forIndexPath:indexPath];
    
    
//
//    UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:@"nari"];
//    
//    if (cell==0) {
//        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"nari"];
//    }
//    
//    cell.textLabel.text=[self.menu objectAtIndex:indexPath.row];
//    
    return cell;


}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
