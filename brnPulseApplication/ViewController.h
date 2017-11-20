//
//  ViewController.h
//  brnPulseApplication
//
//  Created by student on 10/24/17.
//  Copyright © 2017 student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>




@interface ViewController : UIViewController<UITextFieldDelegate>


@property (strong, nonatomic) IBOutlet UITextField *userNameTF;

@property (strong, nonatomic) IBOutlet UITextField *passwordTF;


@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;


@property (strong, nonatomic) IBOutlet UIButton *loginBT;

@property NSURLSession *session;
@property NSMutableURLRequest *urlReq;
@property NSURLSessionDataTask *dataTask;


@property UIView *myView;

@property NSDictionary * dict;

@property  NSString *databasePath;


- (IBAction)topOnLoginBT:(id)sender;

- (IBAction)topOnRememberBT:(id)sender;

- (IBAction)topOnForgotPswdBT:(id)sender;


- (IBAction)createAccontBT:(id)sender;

@property sqlite3 *contactDB;



@end

