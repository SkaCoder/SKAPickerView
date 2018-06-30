//
//  ViewController.m
//  SKAPickerViewExample
//  Created by Alok Singh on 13/03/18.
//  Copyright © 2018 Alok Singh. All rights reserved.
//

#import "ViewController.h"
#import "SKAPickerView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    nameArray=[[NSArray alloc]initWithObjects:@"Sachin",@"Abhi",@"Avinash",@"Rahul",@"Pratham",@"Sanjay",@"china",@"India",@"Malvan",@"Japan",@"Srilanka",@"Maharastra",@"Bihar",@"UP",@"Delhi",@"Mumbai",@"Pune",@"Nashik",@"Nagpur", nil];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
 }

- (IBAction)btnShowPickerClick:(id)sender {
    
    objYHCPickerView = [[SKAPickerView alloc] initWithFrame:CGRectMake(0, 467, 414, 270) withNSArray:nameArray];
    
    objYHCPickerView.delegate = self;
    
    CGRect newFrame = objYHCPickerView.frame;
    
    objYHCPickerView.passRect=newFrame;
    
    [self.view addSubview:objYHCPickerView];
    
    [objYHCPickerView showPicker];
 }

-(void)didSelectItem:(NSString *)item{
    main_label.text=item;
    NSLog(@"%@",item);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
