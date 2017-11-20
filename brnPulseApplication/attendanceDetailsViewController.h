//
//  attendanceDetailsViewController.h
//  brnPulseApplication
//
//  Created by narendra reddy on 05/11/17.
//  Copyright © 2017 student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface attendanceDetailsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *attDetailsTableView;




@property (weak, nonatomic) IBOutlet UIBarButtonItem *sideBarButton;



@property NSURLSession *URLSession;
@property NSMutableURLRequest *URLReq;
@property NSURLSessionDataTask *dataTask;


@property NSArray *profileArray;
@property NSDictionary *profileDict;

@property NSMutableArray *storedArray;

@property NSMutableArray *dataArray;
@property NSMutableArray *keysArray;
@property NSMutableArray *sortedArray;
@property NSMutableArray *Array;

@property NSURLSession *session2;
@property NSMutableURLRequest *urlReq2;
@property NSURLSessionDataTask *dataTask2;



@property NSArray *summaryNameArry;
@property NSArray *summaryKeys;
@property NSDictionary *dict2;
@property NSMutableArray *dataStoredArray;
@property NSArray *deatilsNameArry;
@property NSArray *detailsArry;
@property NSArray *detailsKeys;


@end
