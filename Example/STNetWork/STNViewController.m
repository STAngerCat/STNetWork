//
//  STNViewController.m
//  STNetWork
//
//  Created by mapleiny on 11/25/2017.
//  Copyright (c) 2017 mapleiny. All rights reserved.
//

#import "STNViewController.h"

#import <STNetWork/STNetWork.h>

@interface STNViewController ()

@end

@implementation STNViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    STNRequest *res = [STNRequest get:@"http://api.sms.maple.im/" params:nil completeBlock:^(STNResponse *response) {
        
    }];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
