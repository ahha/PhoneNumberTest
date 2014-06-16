//
//  ViewController.h
//  PhoneNumberTest
//
//  Created by Ahha on 6/15/14.
//  Copyright (c) 2014 Ahha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CountryPicker.h"

@interface ViewController : UIViewController<UITextFieldDelegate,CountryPickerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *lbZipcode;
@property (weak, nonatomic) IBOutlet UITextField *tfPhoneNum;
@property (weak, nonatomic) IBOutlet CountryPicker *pvCountry;
@property (strong, nonatomic) NSString *regionCode;
@property (strong, nonatomic) NSString *countryName;

- (IBAction)doValidate:(id)sender;
@end
