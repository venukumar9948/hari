//
//  attendanceCustom.h
//  BRNApplication
//
//  Created by student on 11/2/17.
//  Copyright © 2017 Shiva Reddy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface attendanceCustom : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *number;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *day;
@property (weak, nonatomic) IBOutlet UILabel *checkIn;
@property (weak, nonatomic) IBOutlet UILabel *checkOut;
@property (weak, nonatomic) IBOutlet UILabel *timeSpent;
@property (weak, nonatomic) IBOutlet UILabel *spentSummary;
@property (weak, nonatomic) IBOutlet UILabel *pointEarned;

@end
