//
//  navigateViewController.h
//  brnPulseApplication
//
//  Created by student on 10/27/17.
//  Copyright © 2017 student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface navigateViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak,nonatomic) IBOutlet UIBarButtonItem *barBT;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *logoutBT;

@property (strong, nonatomic) IBOutlet UITableView *attendaceTableView;

@property NSURLSession *session;
@property NSMutableURLRequest *urlReq;
@property NSURLSessionDataTask *dataTask;

@property NSDictionary *dict;

@property NSArray *summaryNameArry;

@property NSArray *arry;


@property  UIColor *red;
@property  UIColor *green;
@property  UIColor *blue;

@property NSMutableArray *cellColler;


@property NSArray *summaryKeys;
@end
