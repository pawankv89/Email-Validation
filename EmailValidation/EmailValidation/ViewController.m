//
//  ViewController.m
//  EmailValidation
//
//  Created by Pawan on 27/02/18.
//  Copyright © 2018 Pawan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Status
    self.statusLabel.text = [NSString stringWithFormat:@"%@", @""];
    self.statusLabel.textColor = UIColor.clearColor;
    
    /*
    if ([self isValidEmailAddress:@"pawan@gmail.co.uk"]) {
        NSLog(@"Validate");
    }
    else{
        NSLog(@"InValidate");
    }
    
    if ([self isValidEmailAddress:@"pawan@aol.co.nz"]) {
        NSLog(@"Validate");
    }
    else{
        NSLog(@"InValidate");
    }
     */
}

- (IBAction)ValidateButtonTap:(id)sender {
    
    if (self.emailTextField.text.length == 0)
    {
        return;
    }
    
    if ([self isValidEmailAddress: self.emailTextField.text]) {
        NSLog(@"Validate");
        self.statusLabel.text = [NSString stringWithFormat:@"%@ %@", @"Status:- ", @"Validate"];
        self.statusLabel.textColor = UIColor.greenColor;
    }
    else{
        NSLog(@"InValidate");
        self.statusLabel.text = [NSString stringWithFormat:@"%@ %@", @"Status:- ", @"InValidate"];
        self.statusLabel.textColor = UIColor.redColor;
    }
}


- (BOOL)isValidEmailAddress:(NSString *)emailAddress {
    
    //Create a regex string
    NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    //Create predicate with format matching your regex string
    NSPredicate* emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", stricterFilterString];
    
    //return true if email address is valid
    return [emailTest evaluateWithObject:emailAddress];
}

@end
