//
//  ViewController.m
//  PhoneNumberTest
//
//  Created by Ahha on 6/15/14.
//  Copyright (c) 2014 Ahha. All rights reserved.
//

#import "ViewController.h"
#import "NBPhoneNumberUtil.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize regionCode,countryName;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_tfPhoneNum setDelegate:self];
    [_pvCountry setDelegate:self];
    countryName = @"Afghanistan";
    regionCode = @"AF";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

-(void)countryPicker:(CountryPicker *)picker didSelectCountryWithName:(NSString *)name code:(NSString *)code{
    _lbZipcode.text = code;
    regionCode = code;
    countryName = name;
}

- (IBAction)doValidate:(id)sender {
    
    NBPhoneNumberUtil *phoneUtil = [NBPhoneNumberUtil sharedInstance];
    NSError *error = nil;
    NBPhoneNumber *phoneNumber = [phoneUtil parse:_tfPhoneNum.text defaultRegion:regionCode error:&error];
    if (error) {
        NSLog(@"err [%@]", [error localizedDescription]);
    }
    
    if ([_tfPhoneNum.text isEqualToString:@""]) {
        [self showAlertWithMessage:@"The number can not empty!"];
    }else if (![phoneUtil isPossibleNumber:phoneNumber error:&error]){
        [self showAlertWithMessage:@"This is not number phone, please input the number and start with '+' symbol!"];
    }else if (![phoneUtil isValidNumberForRegion:phoneNumber regionCode:regionCode]){
        NSString *str = [NSString stringWithFormat:@"Invalid number phone for %@",countryName];
        [self showAlertWithMessage:str];
    }else{
        NSString *str = [NSString stringWithFormat:@"This is valid number phone for %@",countryName];
        [self showAlertWithMessage:str];
    }
    
}

-(void)showAlertWithMessage:(NSString*)message{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Number phone validate" message:message delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
}

@end
