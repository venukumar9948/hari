//
//  ViewController.m
//  brnPulseApplication
//
//  Created by student on 10/24/17.
//  Copyright © 2017 student. All rights reserved.
//

#import "ViewController.h"
#import "navigateViewController.h"
#import "AppDelegate.h"
#import "SWRevealViewController.h"
#import "UIView+Toast.h"
#import <Reachability.h>



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    ////sqlite3///
    
    NSString *docsDir;
    NSArray *dirPaths;
    
    
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    
    NSLog(@"dirPaths is %@",dirPaths);
    
    docsDir = [dirPaths objectAtIndex:0];
    
    NSLog(@"docsDir is %@",docsDir);
    
    // Build the path to the database file
    NSString * databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"contacts.db"]];
    
    NSLog(@"database path-->%@",databasePath);
    
    
    sqlite3_stmt    *statement;
    
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    if ([filemgr fileExistsAtPath: databasePath ] == NO)
    {
        
        NSLog(@"Database doesnt exist, need to create it");
        const char *dbpath = [databasePath UTF8String];
        
        if (sqlite3_open(dbpath, &_contactDB) == SQLITE_OK)
        {
            char *errMsg;
            const char *sql_stmt = "CREATE TABLE IF NOT EXISTS CONTACTS (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT, ADDRESS TEXT)";
            
            
            ////////
            
            
            
            sqlite3_prepare_v2(_contactDB, sql_stmt, -1, &statement, NULL);
            if (sqlite3_step(statement) != SQLITE_DONE)
            {
                //statusLbl.text = @"Failed to create table";
            }
            
            
            ///////
            
            
//            
//                        if (sqlite3_exec(_contactDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK)
//                        {
//                            _statusLbl.text = @"Failed to create table";
//                        }
//            
            sqlite3_close(_contactDB);
            
        } else {
            //statusLbl.text = @"Failed to open/create database";
        }
    }

    
    
    
    /////////////
    
    [self createElement];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)createElement{
    
//    UIImageView *narendra = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"freedom.jpg"]];
//    
//    narendra.frame = self.view.bounds;
//    
//    [[self view] addSubview:narendra];
    
    

    CALayer *lyr =[CALayer layer];
    
    CGFloat borderWidth =2;
    lyr.borderColor=[UIColor blackColor].CGColor;
    lyr.frame=CGRectMake(0, self.userNameTF.frame.size.height - borderWidth, self.userNameTF.frame.size.width, self.userNameTF.frame.size.height);
    lyr.borderWidth=borderWidth;
    self.userNameTF.layer.masksToBounds=YES;
    [self.userNameTF.layer addSublayer:lyr];
    

    
    CALayer *lyr2 =[CALayer layer];
    
    CGFloat borderWidth2 =2;
    lyr2.borderColor=[UIColor blackColor].CGColor;
    lyr2.frame=CGRectMake(0, self.passwordTF.frame.size.height - borderWidth, self.passwordTF.frame.size.width, self.passwordTF.frame.size.height);
    lyr2.borderWidth=borderWidth2;
    self.passwordTF.layer.masksToBounds=YES;
    [self.passwordTF.layer addSublayer:lyr2];

}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField;
{
    
    
    
    if (textField==self.userNameTF) {
        return YES;
    }
    
    
    if (textField==self.passwordTF) {
        
        
        if([self.userNameTF.text isEqualToString:@""]){
        //[self.view makeToast:@"Please enter user name "];
        
        [self.view makeToast:@"Please enter user name " duration:3.0 position:CSToastPositionBottom];
        
        [self.view showToast:self.myView];
        
        
        return NO;
            
        }else{
    
        return YES;
    
    }
    }
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField;
{


}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField;
{
    return YES;
}
- (BOOL)textFieldShouldClear:(UITextField *)textField;
{
    return YES;

}
- (BOOL)textFieldShouldReturn:(UITextField *)textField;{

    [self.userNameTF resignFirstResponder];
    [self.passwordTF resignFirstResponder];
    
        return YES;


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)topOnLoginBT:(id)sender {

    if ([self.userNameTF.text isEqualToString:@""] || [self.passwordTF.text isEqualToString:@""]) {
       // [self.myView makeToast:@"please fill the above fields" duration:3.0 position:CSToastPositionBottom];
        CSToastStyle *style =[[CSToastStyle alloc]initWithDefaultStyle];
        [self.view makeToast:@"please fill the above fields" duration:3.0 position:CSToastPositionBottom style:style];
        
        [self.view showToast:self.myView];
    }else{
    
    Reachability* reach = [Reachability reachabilityWithHostname:@"www.google.com"];
    reach.reachableBlock = ^(Reachability*reach)
    {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"REACHABLE!");

    SWRevealViewController *vc =[self.storyboard instantiateViewControllerWithIdentifier:@"home2"];
    
    self.session =[NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    
    
    self.urlReq=[[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:@"http://www.brninfotech.com/pulse/modules/admin/ValidateLogin.php"]];
    
    
    
    self.urlReq.HTTPMethod = @"POST";
    
    
    
    NSMutableString *dataToserver=[NSMutableString stringWithFormat:@"funcName=%@&registeredEmail=%@&registeredPassword=%@",@"verifyLogin",self.userNameTF.text,self.passwordTF.text];
    
    
    
    
    
    NSData *dataToPassToServer=[dataToserver dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    
    
    NSString *postLength=[NSString stringWithFormat:@"%lu",(unsigned long)[dataToPassToServer length]];
    
    
    
    [self.urlReq setValue:postLength  forHTTPHeaderField:@"Content-Length"];
    
    
    
    [self.urlReq setValue:@"application/x-www-form-urlencoded;charset=utf-8"    forHTTPHeaderField:@"Content-Type"];
    
    
    
    [self.urlReq setHTTPBody:dataToPassToServer];
    
    
    
    
    self.dataTask=[self.session dataTaskWithRequest:self.urlReq completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(),^{
        
        NSLog(@"data ");
        self.dict=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSLog(@"server response is %@",self.dict);
            
            [self.activityIndicator stopAnimating];
            
              NSLog(@"Received Login Data from Service");
            
            self.dict =[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            
            
            AppDelegate *appdel=(AppDelegate*)[[UIApplication sharedApplication]delegate];
            
            
            NSString *strg1=[self.dict objectForKey:@"profileImagePath"];
            NSString *strg2=[self.dict objectForKey:@"firstName"];
            NSString *strg3=[self.dict objectForKey:@"batchID"];
            NSString *strg4=[self.dict objectForKey:@"studentID"];
        
            
            
            appdel.dataArry =[[NSArray alloc]initWithObjects:strg1,strg2,strg3,strg4,nil];
            
            
            sqlite3_stmt    *statement;
            
            const char *dbpath = [_databasePath UTF8String];
            
            if (sqlite3_open(dbpath, &_contactDB) == SQLITE_OK)
            {
                NSString *insertSQL = [NSString stringWithFormat: @"INSERT INTO CONTACTS (name, address) VALUES (\"%@\", \"%@\")",self.userNameTF.text, self.passwordTF.text];
                
                const char *insert_stmt = [insertSQL UTF8String];
                
                sqlite3_prepare_v2(_contactDB, insert_stmt, -1, &statement, NULL);
                if (sqlite3_step(statement) == SQLITE_DONE)
                {
                    
                    self.userNameTF.text = @"";
                    self.passwordTF.text = @"";
                    
                } else {
                    //_statusLbl.text = @"Failed to add contact";
                }
                sqlite3_finalize(statement);
                sqlite3_close(_contactDB);
            }

            
            NSLog(@"appdelegate data %@",appdel.dataArry);
            
            NSLog(@"login details %@",self.dict);
          
        [self presentViewController:vc animated:YES completion:nil];
        
        });
    }];
    
    
    [self.dataTask resume];
            
        });
        
        
    };
    
    reach.unreachableBlock = ^(Reachability*reach)
    {
        NSLog(@"UNREACHABLE!");
        
        UIAlertController * alert = [UIAlertController
                                     alertControllerWithTitle:@"Warning Alert"
                                     message:@"No InterNet Connection"
                                     preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* yesButton = [UIAlertAction
                                    actionWithTitle:@"Ok"
                                    style:UIAlertActionStyleDefault
                                    handler:nil];
        
        [alert addAction:yesButton];
        [self presentViewController:alert animated:YES completion:nil];
        
        
    };
    
    [reach startNotifier];
    
    }
    
    

}

- (IBAction)topOnRememberBT:(id)sender {
}

- (IBAction)topOnForgotPswdBT:(id)sender {
}

- (IBAction)createAccontBT:(id)sender {
}
@end
