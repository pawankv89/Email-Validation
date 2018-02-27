//
//  ViewController.m
//  EmailValidation
//
//  Created by Pawan on 27/02/18.
//  Copyright © 2018 Pawan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
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
