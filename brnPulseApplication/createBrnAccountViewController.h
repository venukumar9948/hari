//
//  createBrnAccountViewController.h
//  brnPulseApplication
//
//  Created by student on 11/8/17.
//  Copyright © 2017 student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface createBrnAccountViewController : UIViewController<UITextFieldDelegate,UIImagePickerControllerDelegate,UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UIView *myView;

@property (strong, nonatomic) IBOutlet UITextField *firstNameTF;
@property (strong, nonatomic) IBOutlet UITextField *lastNameTF;

@property (strong, nonatomic) IBOutlet UITextField *chooseGenderTF;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIButton *selectImageBt;

- (IBAction)getImageBT:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *numberTF;
@property (strong, nonatomic) IBOutlet UITextField *cityOrTownTF;
@property (strong, nonatomic) IBOutlet UITextField *chooseStateTF;
@property (strong, nonatomic) IBOutlet UITextField *emailTF;
@property (strong, nonatomic) IBOutlet UITextField *paswTF;
@property (strong, nonatomic) IBOutlet UITextField *reEnterPswdTF;
- (IBAction)submitBT:(id)sender;

- (IBAction)cancelBT:(id)sender;
@property (strong, nonatomic) IBOutlet UIStackView *stackView;
@property (strong, nonatomic) IBOutlet UIStackView *genderStack;
@property UITableView *textTableView;

@property NSMutableArray *stateArry;
@property NSMutableArray *stateSub;

@property NSMutableArray *genderArry;
@property NSMutableArray *genderSub;


@end
