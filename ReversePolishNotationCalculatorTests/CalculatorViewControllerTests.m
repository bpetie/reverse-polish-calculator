//
//  CalculatorViewControllerTests.m
//  ReversePolishNotationCalculation
//
//  Created by Brian Peterman on 5/21/13.
//  Copyright (c) 2013 Brian Peterman. All rights reserved.
//

#import <GHUnitIOS/GHUnit.h>
#import "CalculatorViewController.h"
#import <objc/runtime.h>
#import "CalculatorView.h"

@interface CalculatorViewControllerTests: GHTestCase

@end

@implementation CalculatorViewControllerTests

- (void) testViewControllerCanBeCreated
{
    GHAssertNotNil([[CalculatorViewController alloc] init], @"calculator view controller should be able to be created");
}

- (void) testControllerLoadsCustomView
{
    CalculatorViewController *myCalculator = [[CalculatorViewController alloc] init];
    GHAssertEquals([myCalculator.view class], [CalculatorView class], @"Calculator view should be equal to our custom view");
}

@end
