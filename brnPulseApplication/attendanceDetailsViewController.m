//
//  attendanceDetailsViewController.m
//  brnPulseApplication
//
//  Created by narendra reddy on 05/11/17.
//  Copyright © 2017 student. All rights reserved.
//

#import "attendanceDetailsViewController.h"
#import "AppDelegate.h"
#import "navigateViewController.h"
#import "attendanceCustom.h"
#import "SWRevealViewController.h"

@interface attendanceDetailsViewController ()

@end

@implementation attendanceDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.sideBarButton setImageInsets:UIEdgeInsetsMake(2, 2, 2, 2)];
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sideBarButton setTarget: self.revealViewController];
        [self.sideBarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    
    
       [self createComponents];
    
    // Do any additional setup after loading the view.
}

-(void)createComponents{
//    
//        self.summaryNameArry =@[@"Total Days",@"Working Days",@"Leaves",@"Absents",@"Days Attended",@"Updates Sent",@"Working Hours",@"Worked Hours",@"Overall Spent Summary",@"Worked Per day(Avg.Hrs)",@"Shortage Per day(Avg.Hrs)",@"Late to Office",@"Minimum Hrs Missed",@"Max Points",@"Points Earned",@"Your Performance Score",];
//
//    self.summaryKeys=@[@"totalDays",@"totalWorkingDays",@"totalLeaves",@"totalAbsents",@"totalDaysAttended",@"totalUpdatesSent",@"totalWorkingHours",@"totalWorkedHours",@"totalDays",@"avgWorkingHours",@"avgShortageHours",@"numberOfTimesLateToOffice",@"numberOfTimesMinimumHoursMissed",@"maxPoints",@"pointsScored",@"percScored",];
//    
//    
//    AppDelegate *appdelg =(AppDelegate*)[[UIApplication sharedApplication]delegate];
//    
//    
//    
//        self.profileArray=[[NSMutableArray alloc]init];
//       self.keysArray=[[NSMutableArray alloc]initWithObjects:@"attendanceDayCount",@"attendanceDate",@"attendanceDay",@"checkIn",@"checkOut",@"timeSpent",@"shortageExcessTime",@"totalPoints", nil];
//    
//    
//    
//    ////////
//    self.session2 =[NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
//    
//    self.urlReq2 =[[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:@"http://www.brninfotech.com/pulse/modules/admin/DashboardSnippets.php"]];
//    
//    
//    self.urlReq2.HTTPMethod=@"POST";
//    
//    NSMutableString *strg2 =[[NSMutableString alloc]initWithFormat:@"funcName=%@",@"getUserAttendance"];
//    
//    NSData *dataToPassToServer2=[strg2 dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
//    
//    NSString *postLength =[NSString stringWithFormat:@"%lu",(unsigned long)[dataToPassToServer2 length]];
//    
//    [self.urlReq2 setValue:postLength forHTTPHeaderField:@"Content-Length"];
//    
//    [self.urlReq2 setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
//    
//    [self.urlReq2 setHTTPBody:dataToPassToServer2];
//    
//    
//    self.dataTask2 =[self.session2 dataTaskWithRequest:self.urlReq2 completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        
//        dispatch_async(dispatch_get_main_queue(),^{
//            
//            self.dataStoredArray =[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//            
//            
//            self.dict2=[self.dataStoredArray objectAtIndex:0];
//            
//            
//            appdelg.dataArry2 =[[NSArray alloc]initWithObjects:[self.dict2 objectForKey:@"attendanceDayCount"],[self.dict2 objectForKey:@"attendanceDate"],[self.dict2 objectForKey:@"attendanceDay"],[self.dict2 objectForKey:@"checkIn"],[self.dict2 objectForKey:@"checkOut"],[self.dict2 objectForKey:@"timeSpent"],[self.dict2 objectForKey:@"shortageExcessTime"],[self.dict2 objectForKey:@"totalPoints"], nil];
//            
//            NSLog(@"dataArray2 is-%@",appdelg.dataArry2);
//            
//            
//        });
//    }];
//    
//    [self.dataTask2 resume];
//    
//    
//    
//    
//    
    

    
    
    
//   
//    NSLog(@"dataArray2 is-%@",appdelg.dataArry2);
//
//    
//    self.Array=[[NSMutableArray alloc]initWithArray:appdelg.dataArry2];
//    
//    NSLog(@"New Array is-%@",self.Array);
  
    
    self.profileArray=[[NSMutableArray alloc]init];
    self.keysArray=[[NSMutableArray alloc]initWithObjects:@"attendanceDayCount",@"attendanceDate",@"attendanceDay",@"checkIn",@"checkOut",@"timeSpent",@"shortageExcessTime",@"totalPoints", nil];
    
    /////////////////////////////////////
    
    self.URLSession =[NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    self.URLReq=[[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:@"http://www.brninfotech.com/pulse/modules/admin/DashboardSnippets.php"]];
    
    self.URLReq.HTTPMethod=@"POST";
    
    NSMutableString *dataToserver=[NSMutableString stringWithFormat:@"funcName=%@",@"getUserAttendance"];
    
    NSData *dataToPassToServer=[dataToserver dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength=[NSString stringWithFormat:@"%lu",(unsigned long)[dataToPassToServer length]];
    
    [self.URLReq setValue:postLength  forHTTPHeaderField:@"Content-Length"];
    [self.URLReq setValue:@"application/x-www-form-urlencoded;charset=utf-8"    forHTTPHeaderField:@"Content-Type"];
    
    [self.URLReq setHTTPBody:dataToPassToServer];
    
    self.dataTask=[self.URLSession dataTaskWithRequest:self.URLReq completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //[self.activityIndicator stopAnimating];
        
        NSLog(@"Received Data from Service");
        
        self.attDetailsTableView.delegate=self;
        self.attDetailsTableView.dataSource=self;
        
        
        self.profileArray=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        //  [self.profileArray removeObjectAtIndex:0];
        
        NSLog(@"sorted Array is -%@",self.profileArray);
        //self.sortedArray
        
        [self.attDetailsTableView reloadData];
        
        
        //  [self.activityIndicator hidesWhenStopped];
        //  [self.activityIndicator setHidden:YES];
        
    }];
    
    [self.dataTask resume];
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.profileArray.count-1;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 115;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier=@"cell1";
    
    attendanceCustom *customCell=[tableView dequeueReusableCellWithIdentifier:identifier];
    
    NSArray *xibActorArray=[[NSBundle mainBundle]loadNibNamed:@"attendanceCustom" owner:self options:nil];
    if (customCell==nil) {
        customCell=[xibActorArray objectAtIndex:0];
    }
    
    //customCell.keys.text=[self.dataArray objectAtIndex:indexPath.row];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        
        customCell.backgroundColor=[UIColor colorWithRed:255/255.0 green:102/255.0 blue:153/255.0 alpha:1];
        
        
        customCell.number.text=[NSString stringWithFormat:@"%@",[[self.profileArray objectAtIndex:indexPath.row+1]objectForKey:[self.keysArray objectAtIndex:0]]];
        customCell.date.text=[NSString stringWithFormat:@"%@",[[self.profileArray objectAtIndex:indexPath.row+1]objectForKey:[self.keysArray objectAtIndex:1]]];
        customCell.day.text=[NSString stringWithFormat:@"%@",[[self.profileArray objectAtIndex:indexPath.row+1]objectForKey:[self.keysArray objectAtIndex:2]]];
        customCell.checkIn.text=[NSString stringWithFormat:@"%@",[[self.profileArray objectAtIndex:indexPath.row+1]objectForKey:[self.keysArray objectAtIndex:3]]];
        customCell.checkOut.text=[NSString stringWithFormat:@"%@",[[self.profileArray objectAtIndex:indexPath.row+1]objectForKey:[self.keysArray objectAtIndex:4]]];
        customCell.timeSpent.text=[NSString stringWithFormat:@"%@",[[self.profileArray objectAtIndex:indexPath.row+1]objectForKey:[self.keysArray objectAtIndex:5]]];
        customCell.spentSummary.text=[NSString stringWithFormat:@"%@",[[self.profileArray objectAtIndex:indexPath.row+1]objectForKey:[self.keysArray objectAtIndex:6]]];
        customCell.pointEarned.text=[NSString stringWithFormat:@"%@",[[self.profileArray objectAtIndex:indexPath.row+1]objectForKey:[self.keysArray objectAtIndex:7]]];
        
        
    });
    
    
    return customCell;
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
