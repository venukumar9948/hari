//
//  navigateViewController.m
//  brnPulseApplication
//
//  Created by student on 10/27/17.
//  Copyright © 2017 student. All rights reserved.
//

#import "navigateViewController.h"
#import "SWRevealViewController.h"
#import "xibcellTableViewCell.h"

@interface navigateViewController ()

@end

@implementation navigateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.red=[UIColor redColor];
    self.green=[UIColor greenColor];
    self.blue=[UIColor blueColor];
    
    
    self.cellColler=[[NSMutableArray alloc]initWithObjects:self.red,self.green,self.blue, nil];
    
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.barBT setTarget: self.revealViewController];
        [self.barBT setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }

    
    self.attendaceTableView.delegate=self;
    self.attendaceTableView.dataSource=self;
    
    self.summaryNameArry =@[@"Total Days",@"Working Days",@"Leaves",@"Absents",@"Days Attended",@"Updates Sent",@"Working Hours",@"Worked Hours",@"Overall Spent Summary",@"Worked Per day(Avg.Hrs)",@"Shortage Per day(Avg.Hrs)",@"Late to Office",@"Minimum Hrs Missed",@"Max Points",@"Points Earned",@"Your Performance Score",];
    
    self.session=[NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    self.urlReq=[[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:@"http://www.brninfotech.com/pulse/modules/admin/DashboardSnippets.php"]];
    
    
    self.urlReq.HTTPMethod=@"POST";
    
    NSMutableString *strg =[[NSMutableString alloc]initWithFormat:@"funcName=%@",@"getUserAttendance"];
    
    NSData *dataToPassToServer=[strg dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];

    NSString *postLength =[NSString stringWithFormat:@"%lu",(unsigned long)[dataToPassToServer length]];
    
    [self.urlReq setValue:postLength forHTTPHeaderField:@"Content-Length"];
    
    [self.urlReq setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    [self.urlReq setHTTPBody:dataToPassToServer];
    
    
    self.dataTask =[self.session dataTaskWithRequest:self.urlReq completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        
        
        [self dataTask:[NSJSONSerialization JSONObjectWithData:data options:0 error:nil]];
        
        
        [self.attendaceTableView reloadData];
        
         
         }];
    
    [self.dataTask resume];
}

-(void)dataTask:(NSArray *)dataTask;{


    self.arry=dataTask;

    NSLog(@"....%@",self.arry);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;


{

    return self.summaryNameArry.count;
    //return self.cellColler.count;

}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;



{


    xibcellTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"nari"];
    
    
    if (cell==nil) {
        NSArray *xibFile=[[NSBundle mainBundle]loadNibNamed:@"xibcellTableViewCell" owner:self options:nil];
        
        cell=[xibFile objectAtIndex:0];
    }

    
   self.summaryKeys=@[@"totalDays",@"totalWorkingDays",@"totalLeaves",@"totalAbsents",@"totalDaysAttended",@"totalUpdatesSent",@"totalWorkingHours",@"totalWorkedHours",@"totalDays",@"avgWorkingHours",@"avgShortageHours",@"numberOfTimesLateToOffice",@"numberOfTimesMinimumHoursMissed",@"maxPoints",@"pointsScored",@"percScored",];

    cell.listName.text=[NSString stringWithFormat:@"%@",[self.summaryNameArry objectAtIndex:indexPath.row]];
    
    cell.integers.text=[NSString stringWithFormat:@"%@",[[self.arry objectAtIndex:0] objectForKey:[self.summaryKeys objectAtIndex:indexPath.row]]];
    //cell.backgroundColor=self.cellColler[indexPath.row% self.cellColler.count];
    
    
    return cell;
    
}





@end
