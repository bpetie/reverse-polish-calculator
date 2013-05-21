//
//  CalculatorViewController.m
//  ReversePolishNotationCalculation
//
//  Created by Brian Peterman on 5/21/13.
//  Copyright (c) 2013 Brian Peterman. All rights reserved.
//

#import "CalculatorView.h"
#import "CalculatorViewController.h"

@interface CalculatorViewController ()

@property (strong, nonatomic) CalculatorView *view;


@end

@implementation CalculatorViewController

- (id)init
{
    self = [super init];
    if (self) {
        [self setView:[[CalculatorView alloc] init]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
