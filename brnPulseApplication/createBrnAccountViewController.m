//
//  createBrnAccountViewController.m
//  brnPulseApplication
//
//  Created by student on 11/8/17.
//  Copyright © 2017 student. All rights reserved.
//

#import "createBrnAccountViewController.h"
#import "UIView+Toast.h"

@interface createBrnAccountViewController ()

@end

@implementation createBrnAccountViewController

@synthesize  numberTF,firstNameTF,chooseStateTF,chooseGenderTF,emailTF,paswTF,lastNameTF,reEnterPswdTF,cityOrTownTF;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createElements];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)createElements{
    
    
    
    self.stateArry =[[NSMutableArray alloc]initWithObjects:@"Andhra Pradesh",@"Arunachal Pradesh",@"Assam",@"Bihar",@"Goa",@"Gujarat",@"Haryana",@"Himachal Pradesh",@"Jammu & Kashmi",@"Karnataka",@"Kerala",@"Madhya Pradesh",@"Maharashtra",@"Manipur",@"Meghalaya",@"Mizoram ",@"Nagaland",@"Orissa ",@"Punjab",@"Rajasthan ",@"Sikkim",@"Tamil Nadu ",@"Tripura ",@"Uttar Pradesh",@"West Bengal",@"Chhattisgarh",@"Uttarakhand ",@"Jharkhand ",@"Telangana ", nil];
    
    self.stateSub=[[NSMutableArray alloc]init];
    
    self.textTableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 175, 300,120) style:UITableViewStylePlain];
    self.textTableView.delegate=self;
    self.textTableView.dataSource=self;
    self.textTableView.scrollEnabled=YES;
    
    [self.textTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"nari"];
    
    [self.stackView addSubview:self.textTableView];
    
    
    
    
    
    [self.textTableView setHidden:TRUE];
    self.chooseStateTF.delegate=self;
   
    
    
    

//    
//    self.firstNameTF.delegate=self;
//    self.lastNameTF.delegate=self;
//
//    self.chooseGenderTF.delegate=self;
//
//    self.numberTF.delegate=self;
//
//    self.cityOrTownTF.delegate=self;
//
//    self.chooseStateTF.delegate=self;
//
//    self.emailTF.delegate=self;
//
//    self.paswTF.delegate=self;
//    self.reEnterPswdTF.delegate=self;
//
    



}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;{

    
    
    return self.stateSub.count;
   
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;{

    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"nari"];
    
    if (cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"nari"];
   
    }
    
           cell.textLabel.text=[self.stateSub objectAtIndex:indexPath.row];
    
    cell.backgroundColor=[UIColor brownColor];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;{

    [self.stackView endEditing:YES];
    self.chooseStateTF.text=[self.stateSub objectAtIndex:indexPath.row];
    
  venu kumar
    
    

}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    
    [self searchText:textField replacementString:@"Begin"];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    self.textTableView.hidden = TRUE;
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.textTableView.hidden = TRUE;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    [self searchText:textField replacementString:string];
    return YES;
}


-(void) searchText:(UITextField *)textField replacementString:(NSString *)string
{
    
    NSString *str_Search_String=[NSString stringWithFormat:@"%@",textField.text];
    if([string isEqualToString:@"Begin"])
        
        str_Search_String=[NSString stringWithFormat:@"%@",textField.text];
    
    else if([string isEqualToString:@""])
        str_Search_String = [str_Search_String substringToIndex:[str_Search_String length] - 1];
    else
        str_Search_String=[str_Search_String stringByAppendingString:string];
    
    self. stateSub=[[NSMutableArray alloc] init];
    if(str_Search_String.length>0)
    {
        NSInteger counter = 0;
        for(NSString *name in self.stateArry)
        {
            NSRange r = [name rangeOfString:str_Search_String options:NSCaseInsensitiveSearch];
            if(r.length>0)
            {
                [self.stateSub addObject:name];
            }
            
            counter++;
            
        }
        
        if (self.stateSub.count > 0)
        {
            NSLog(@"%@",self.stateSub);
            self.textTableView.hidden = FALSE;
            [self.textTableView reloadData];
        }
        else
        {
            self.textTableView.hidden = TRUE;
        }
        
        
        
    }
    else
    {
        [self.textTableView setHidden:TRUE];
        
    }
    
    
}


//- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
//{
//    
//    
//    if (textField==self.firstNameTF) {
//        return YES;
//        
//    }
//    
//    ////lastname
//    
//    if (textField==self.lastNameTF){
//        if ([self.firstNameTF.text isEqualToString:@""]) {
//            
//            [self.view makeToast:@"please enter first name field " duration:3.0 position:CSToastPositionCenter];
//            [self.view showToast:self.myView];
//            
//            return NO;
//        }
//        else if(self.firstNameTF.text.length<=1){
//            
//            [self.view makeToast:@"please enter minimum letters" duration:3.0 position:CSToastPositionCenter];
//            [self.view showToast:self.myView];
//            
//            return NO;
//        }else {
//            
//            return YES;
//        }
//        
//    }
//    
//    
//    
//    
//    ////age
//    
//    
//    if (textField==self.chooseGenderTF) {
//        if ([self.firstNameTF.text isEqualToString:@""]||[self.lastNameTF.text isEqualToString:@""]) {
//            [self.view makeToast:@"please enter above fields " duration:3.0 position:CSToastPositionCenter];
//            [self.view showToast:self.myView];
//            return NO;
//        }
//        
//        else if(self.lastNameTF.text.length<=1 ){
//            [self.view makeToast:@"please enter minimum letters" duration:3.0 position:CSToastPositionCenter];
//            [self.view showToast:self.myView];
//            return NO;
//        }else {
//            
//            return YES;
//            
//        }
//    }
//    
//    
//    
//    
//    ////phone
//    
//    
//    if (textField==self.numberTF) {
//        if ([self.firstNameTF.text isEqualToString:@""]||[self.lastNameTF.text isEqualToString:@""]||[self.chooseGenderTF.text isEqualToString:@""]) {
//            [self.view makeToast:@"please enter above fields " duration:3.0 position:CSToastPositionCenter];
//            [self.view showToast:self.myView];
//            return NO;
//        }
//        else if(self.chooseGenderTF.text.length<=1) {
//            [self.view makeToast:@"please enter minimum letters" duration:3.0 position:CSToastPositionCenter];
//            [self.view showToast:self.myView];
//            return NO;
//        }
//        else {
//            
//            
//            return YES;
//            
//        }
//    }
//    
//    
//    
//    
//    
//    ////email
//    
//    if (textField ==self.cityOrTownTF) {
//        if ([self.firstNameTF.text isEqualToString:@""]||[self.lastNameTF.text isEqualToString:@""]||[self.chooseGenderTF.text isEqualToString:@""]||[self.numberTF.text isEqualToString:@""]) {
//            [self.view makeToast:@"please enter above fields " duration:3.0 position:CSToastPositionCenter];
//            [self.view showToast:self.myView];
//            return  NO;
//            
//        }
//        else if ( self.numberTF.text.length<=1) {
//            [self.view makeToast:@"please enter minimum letters" duration:3.0 position:CSToastPositionCenter];
//            [self.view showToast:self.myView];
//            return NO;
//            
//        }else{
//            
//            return YES;
//        }
//    }
//    
//    
//    
//    
//    
//    ////fbId
//    
//    if (textField==self.chooseStateTF) {
//        if ([self.firstNameTF.text isEqualToString:@""]||[self.lastNameTF.text isEqualToString:@""]||[self.chooseGenderTF.text isEqualToString:@""]||[self.numberTF.text isEqualToString:@""]||[self.cityOrTownTF.text isEqualToString:@""]) {
//            [self.view makeToast:@"please enter above fields " duration:3.0 position:CSToastPositionCenter];
//            [self.view showToast:self.myView];
//            return  NO;
//        }
//        else if ( self.cityOrTownTF.text.length<=1) {
//            [self.view makeToast:@"please enter minimum letters" duration:3.0 position:CSToastPositionCenter];
//            [self.view showToast:self.myView];
//            return NO;
//            
//        }else {
//            return YES;
//            
//        }
//        
//    }
//    
//    
//    ////userId
//    
//    if (textField==self.emailTF) {
//        if ([self.firstNameTF.text isEqualToString:@""]||[self.lastNameTF.text isEqualToString:@""]||[self.chooseGenderTF.text isEqualToString:@""]||[self.numberTF.text isEqualToString:@""]||[self.cityOrTownTF.text isEqualToString:@""]||[self.chooseStateTF.text isEqualToString:@""]) {
//            [self.view makeToast:@"please enter above fields " duration:3.0 position:CSToastPositionCenter];
//            [self.view showToast:self.myView];
//            return  NO;
//        }
//        else if ( self.chooseStateTF.text.length<=1) {
//            [self.view makeToast:@"please enter minimum letters" duration:3.0 position:CSToastPositionCenter];
//            [self.view showToast:self.myView];
//            return NO;
//            
//        }else{
//            
//            return YES;
//        }
//    }
//    
//    
//    
//    ////password
//    
//    
//    if (textField==self.paswTF) {
//        if ([self.firstNameTF.text isEqualToString:@""]||[self.lastNameTF.text isEqualToString:@""]||[self.chooseGenderTF.text isEqualToString:@""]||[self.numberTF.text isEqualToString:@""]||[self.cityOrTownTF.text isEqualToString:@""]||[self.chooseStateTF.text isEqualToString:@""]||[self.emailTF.text isEqualToString:@""]) {
//            [self.view makeToast:@"please enter above fields " duration:3.0 position:CSToastPositionCenter];
//            [self.view showToast:self.myView];
//            return  NO;
//        }
//        else if (  self.emailTF.text.length<=1) {
//            [self.view makeToast:@"please enter minimum letters" duration:3.0 position:CSToastPositionCenter];
//            [self.view showToast:self.myView];
//            return NO;
//        }else{
//            
//            
//            return YES;
//            
//        }
//    }
//    
//    
//    ////reEnterPassword
//    
//    
//    if (textField==self.reEnterPswdTF) {
//        if ([self.firstNameTF.text isEqualToString:@""]||[self.lastNameTF.text isEqualToString:@""]||[self.chooseGenderTF.text isEqualToString:@""]||[self.numberTF.text isEqualToString:@""]||[self.cityOrTownTF.text isEqualToString:@""]||[self.chooseStateTF.text isEqualToString:@""]||[self.emailTF.text isEqualToString:@""]||[self.paswTF.text isEqualToString:@""]) {
//            [self.view makeToast:@"please enter above fields " duration:3.0 position:CSToastPositionCenter];
//            [self.view showToast:self.myView];
//            return  NO;
//        }
//        
//        else if ( self.paswTF.text.length<=1) {
//            [self.view makeToast:@"please enter minimum letters" duration:3.0 position:CSToastPositionCenter];
//            [self.view showToast:self.myView];
//            return NO;
//        }else {
//            
//            
//            return YES;
//        }
//    }
//    
//    return YES;
//}
//
//- (void)textFieldDidBeginEditing:(UITextField *)textField;
//{
//
//[self 
//    
//    
//}
-(BOOL)validatenumberTF:(NSString*)enterNumber{
    NSString*expression=@"^[7-9][0-9]{9}$";
    NSPredicate*mobileText=[NSPredicate predicateWithFormat:@"self Matches%@",expression];
    return [mobileText evaluateWithObject:enterNumber];
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField;
{
    bool endEditing=YES;
if (textField==numberTF){
    if ([self validatenumberTF:[numberTF text]]==YES) {
        
        [self.myView makeToast:@"Your Mobile Number is Valid" duration:4.0 position:CSToastPositionTop style:nil];
    }else{
        
        [self.myView makeToast:@"Your Mobile Number is InValid" duration:4.0 position:CSToastPositionTop style:nil];
        endEditing=NO;
    }

}


    return YES;

}





- (IBAction)getImageBT:(id)sender {
    
    UIImagePickerController *picker =[[UIImagePickerController alloc]init];
    
    picker.delegate=self;
    
    
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:nil];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{

    [picker dismissViewControllerAnimated:YES completion:nil];
    self.imageView.image=[info objectForKey:@"UIImagePickerControllerOriginalImage"];


}








- (IBAction)submitBT:(id)sender {
}

- (IBAction)cancelBT:(id)sender {
}
@end
