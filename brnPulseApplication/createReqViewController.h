//
//  createReqViewController.h
//  brnPulseApplication
//
//  Created by student on 10/27/17.
//  Copyright © 2017 student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface createReqViewController : UIViewController<UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource>
@property (strong, nonatomic) IBOutlet UIBarButtonItem *sideBarButton;
@property (strong, nonatomic) IBOutlet UITextField *reqTypeTF;

@property (strong, nonatomic) IBOutlet UITextField *labIDTF;
@property (strong, nonatomic) IBOutlet UITextField *seatNOTF;
@property (strong, nonatomic) IBOutlet UITextField *descripTF;
@property (strong, nonatomic) IBOutlet UIView *myView;
@property (strong, nonatomic) IBOutlet UIButton *submitBT;

@property UIPickerView *pickerView;

@property NSMutableArray *labArry;

@property NSMutableArray *seatArry;
@property NSMutableArray *reqArry;

@property NSMutableArray *l1HArry;
@property NSMutableArray *l12Arry;
@property NSMutableArray *l13Arry;
@property NSMutableArray *l14Arry;
@property NSMutableArray *l2HArry;
@property NSMutableArray *l21Arry;
@property NSMutableArray *l22Arry;
@property NSMutableArray *l23Arry;
@property NSMutableArray *l24Arry;
@property NSMutableArray *l31Arry;
@property NSMutableArray *l32Arry;
@property NSMutableArray *l33Arry;


@end
