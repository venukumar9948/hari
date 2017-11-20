//
//  createReqViewController.m
//  brnPulseApplication
//
//  Created by student on 10/27/17.
//  Copyright © 2017 student. All rights reserved.
//

#import "createReqViewController.h"
#import "SWRevealViewController.h"
#import "UIView+Toast.h"


@interface createReqViewController ()

@end

@implementation createReqViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self createElements];
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sideBarButton setTarget: self.revealViewController];
        [self.sideBarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }

    // Do any additional setup after loading the view.
}

-(void)createElements{
    
    
    self.reqArry =[[NSMutableArray alloc]initWithObjects:@"New Software Installation",@"Unable to Login thru my User Name",@"Internet not Working",@"Audio not Working",@"Install code",@"No KeyBoard",@"Mouse Not Working Properly",@"System Hangs Frequently",@"Monitor Display Problem",@"KeyBoard not Working Properly",@"OS not Boosting", nil];
    
    
    self.labArry =[[NSMutableArray alloc]initWithObjects:@"L1H",@"L12",@"L13",@"L14",@"L2H",@"L21",@"L22",@"L23",@"L24",@"L31",@"L32",@"L33",nil];
    
    self.seatArry =[[NSMutableArray alloc]initWithObjects:@"", nil];
    
    
    self.l1HArry =[[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25", nil];
    self.l12Arry =[[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",nil];
    
    self.l13Arry =[[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",nil];
    
    self.l14Arry =[[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",nil];
    
     self.l2HArry =[[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25", nil];

    self.l21Arry =[[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12", nil];
    
    
      self.l22Arry =[[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",nil];
    
    self.l23Arry =[[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",nil];
    
    
     self.l24Arry =[[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",nil];
    
    
     self.l31Arry =[[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11", nil];
    
    self.l32Arry =[[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",nil];
    
    self.l33Arry =[[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",nil];
    
    self.pickerView =[[UIPickerView alloc]init];
    
    self.pickerView.delegate=self;
    self.pickerView.dataSource=self;
    
    
    
    self.seatNOTF.inputView=self.pickerView;
    self.labIDTF.inputView=self.pickerView;
    self.reqTypeTF.inputView=self.pickerView;
    self.descripTF.inputView=self.pickerView;
    

    
    
    
    self.seatNOTF.delegate=self;
    self.labIDTF.delegate=self;
    self.reqTypeTF.delegate=self;
    self.descripTF.delegate=self;

    
    
    
}
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{

    if (component==0) {
        return [self.reqArry objectAtIndex:row];
    }else if (component==1){
    
        return [self.labArry objectAtIndex:row];
    
    }else{
    
        return [self.seatArry objectAtIndex:row];
    
    }




}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
{

    return 3;

}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{

    if (component==0) {
      return  self.reqArry.count;
    }else if (component==1){
    
        return self.labArry.count;
        
        
    }else{
    
        return self.seatArry.count;
    
    }



}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{

    if (component==0) {
        self.reqTypeTF.text=self.reqArry[row];
    
    
        [self.reqTypeTF resignFirstResponder];
    }else if (component==1){
    
        self.labIDTF.text=self.labArry[row];
        
        if ([[self.labArry objectAtIndex:row]isEqualToString:@"L1H"]) {
            self.seatArry=self.l1HArry;
            
            
        }else if([[self.labArry objectAtIndex:row]isEqualToString:@"L12"]){
        
            self.seatArry=self.l12Arry;
        
        }else if([[self.labArry objectAtIndex:row]isEqualToString:@"L13"]){
        
            self.seatArry=self.l13Arry;
        
        }else if([[self.labArry objectAtIndex:row]isEqualToString:@"L14"]){
            
            self.seatArry=self.l14Arry;

        }else if([[self.labArry objectAtIndex:row]isEqualToString:@"L2H"]){
            
            self.seatArry=self.l2HArry;
        }else if([[self.labArry objectAtIndex:row]isEqualToString:@"L21"]){
            
            self.seatArry=self.l21Arry;
        }else if([[self.labArry objectAtIndex:row]isEqualToString:@"L22"]){
            
            self.seatArry=self.l22Arry;
        }else if([[self.labArry objectAtIndex:row]isEqualToString:@"L22"]){
            
            self.seatArry=self.l22Arry;
        }else if([[self.labArry objectAtIndex:row]isEqualToString:@"L23"]){
            
            self.seatArry=self.l23Arry;
        }else if([[self.labArry objectAtIndex:row]isEqualToString:@"L24"]){
            
            self.seatArry=self.l24Arry;
        }else if([[self.labArry objectAtIndex:row]isEqualToString:@"L31"]){
            
            self.seatArry=self.l31Arry;
        }else if([[self.labArry objectAtIndex:row]isEqualToString:@"L32"]){
            
            self.seatArry=self.l32Arry;
        }else if([[self.labArry objectAtIndex:row]isEqualToString:@"L33"]){
            
            self.seatArry=self.l33Arry;
        }

        [self.labIDTF resignFirstResponder];
    
    }else {
    
        self.seatNOTF.text=self.seatArry[row];
    }

    
    
    [self.seatNOTF resignFirstResponder];
    
    [pickerView reloadAllComponents];




}
//-(BOOL)validateseatNOTF:(NSString*)enterSeatNumber{
//    NSString*expression=@"^[1-9][A-Z][0-9]{1-2}$";
//    NSPredicate*seatText=[NSPredicate predicateWithFormat:@"self Matches%@",expression];
//    return [seatText evaluateWithObject:enterSeatNumber];
//}
//-(BOOL)validatelabIDTF:(NSString*)enterLabID{
//    NSString*expression=@"^[1-9][0-9]{1}$";
//    NSPredicate*labText=[NSPredicate predicateWithFormat:@"self Matches%@",expression];
//    return [labText evaluateWithObject:enterLabID];
//}
//
//
//- (BOOL)textFieldShouldEndEditing:(UITextField *)textField;
//{
//    bool endEditing=YES;
//    if (textField==labIDTF){
//        if ([self validatelabIDTF:[labIDTF text]]==YES) {
//            
//            [self.myView makeToast:@"Your Lab ID  is Valid" duration:4.0 position:CSToastPositionTop style:nil];
//        }else{
//            
//            [self.myView makeToast:@"Your Lab ID is InValid" duration:4.0 position:CSToastPositionTop style:nil];
//            endEditing=NO;
//        }
//    }  else if (textField==seatNOTF){
//        if ([self validateseatNOTF:[seatNOTF text]]==YES) {
//            
//            [self.myView makeToast:@"Your Seat Number is Valid" duration:4.0 position:CSToastPositionTop style:nil];
//        }else{
//            
//            [self.myView makeToast:@"Your Seat Number is InValid" duration:4.0 position:CSToastPositionTop style:nil];
//            endEditing=NO;
//        }
//        }
//    
//    
//    return YES;
//    
//}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
