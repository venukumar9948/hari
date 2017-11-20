//
//  TableViewController.h
//  brnPulseApplication
//
//  Created by student on 10/28/17.
//  Copyright © 2017 student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UIView *imageView;

@property (strong, nonatomic) IBOutlet UIImageView *profileImage;

@property (strong, nonatomic) IBOutlet UILabel *studentName;

@property (strong, nonatomic) IBOutlet UILabel *developer;
@property (strong, nonatomic) IBOutlet UILabel *batchID;
@property (strong, nonatomic) IBOutlet UILabel *studentID;
@property NSMutableArray *menu;
@property (strong, nonatomic) IBOutlet UITableView *pulseTableView;

@property NSString *imageStrg;


@end
