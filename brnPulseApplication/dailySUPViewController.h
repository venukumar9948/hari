//
//  dailySUPViewController.h
//  brnPulseApplication
//
//  Created by student on 10/27/17.
//  Copyright © 2017 student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface dailySUPViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIBarButtonItem *sideBarButton;

@property (strong, nonatomic) IBOutlet UIView *mrng9To10;
@property (strong, nonatomic) IBOutlet UITextField *mrng10To11;
@property (strong, nonatomic) IBOutlet UITextField *mrng11To12;


@property (strong, nonatomic) IBOutlet UITextField *afterNoon12To01;

@property (strong, nonatomic) IBOutlet UITextField *afterNoon01To02;

@property (strong, nonatomic) IBOutlet UITextField *afterNoon02To03;


@property (strong, nonatomic) IBOutlet UITextField *afterNoon03To04;
@property (strong, nonatomic) IBOutlet UITextField *evng04To05;
@property (strong, nonatomic) IBOutlet UITextField *evng05To06;
@property (strong, nonatomic) IBOutlet UITextField *evngAfter06PM;

@end
