//
//  ViewController.m
//  AJ
//
//  Created by TCG Digital on 10/05/17.
//  Copyright © 2017 TCG Digital. All rights reserved.
//

#import "ViewController.h"
#import "AJMaterialTextfield.h"

@interface ViewController ()<UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    AJMaterialTextfield *userNameTextfield =[[AJMaterialTextfield alloc] initWithFrame:CGRectMake(40, 150, self.view.frame.size.width-80, 34)];
    userNameTextfield.textColor=[UIColor whiteColor];
    
    userNameTextfield.enableMaterialPlaceHolder = YES;
    userNameTextfield.errorColor = materialTextfieldColorOptionredColor;
    userNameTextfield.lineColor=[UIColor whiteColor];
    userNameTextfield.tintColor=[UIColor lightGrayColor];
    userNameTextfield.placeholder=@"Username";
    userNameTextfield.delegate=self;
    userNameTextfield.showClearButtonOption = YES;
    userNameTextfield.autocorrectionType = UITextAutocorrectionTypeNo;
    userNameTextfield.returnKeyType=UIReturnKeyNext;
    [self.view addSubview:userNameTextfield];
    
    AJMaterialTextfield *passTextField =[[AJMaterialTextfield alloc] initWithFrame:CGRectMake(40, 210, self.view.frame.size.width-80, 34)];
    passTextField.textColor=[UIColor whiteColor];
    passTextField.enableMaterialPlaceHolder = YES;
    passTextField.errorColor = materialTextfieldColorOptionredColor;
    passTextField.lineColor=[UIColor whiteColor];
    passTextField.tintColor=[UIColor lightGrayColor];
    passTextField.placeholder=@"Password";
    passTextField.showClearButtonOption = YES;
    passTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    passTextField.delegate=self;
    passTextField.returnKeyType=UIReturnKeyNext;
    [self.view addSubview:passTextField];
   
    //self.passwordTextfield = passTextField;
    
    UIButton *button=[[UIButton alloc] initWithFrame:CGRectMake(40, 300, self.view.frame.size.width-80, 60)];
    [button setTitle:@"Submit" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor colorWithRed:0.482 green:0.800 blue:1.000 alpha:1.000]];
    [self.view addSubview:button];
    
    [button addTarget:self action:@selector(submit) forControlEvents:UIControlEventTouchUpInside];
}

-(void)submit {
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
