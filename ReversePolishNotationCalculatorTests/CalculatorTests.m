//
//  CalculatorTests.m
//  ReversePolishNotationCalculation
//
//  Created by Brian Peterman on 5/21/13.
//  Copyright (c) 2013 Brian Peterman. All rights reserved.
//

#import <GHUnitIOS/GHUnit.h>
#import "Calculator.h"
@interface CalculatorTests:GHTestCase

@property (strong, nonatomic) Calculator *calc;

@end

@implementation CalculatorTests

@synthesize calc;

- (void) setUp
{
    [self setCalc:[[Calculator alloc] init]];

}

- (void) tearDown
{
    [self setCalc:nil];
}

- (void) testCalculatorCanBeCreated
{
    GHAssertNotNil([[Calculator alloc] init], @"calculator should be initialize when we call init method");
    
}

- (void) testCalculaorStackIsNotNilByDefault
{
    GHAssertNotNil(self.calc.stack, @"stack should exist and be empty");
}

- (void) testCalculatorStackIsEmptyByDefault
{
    GHAssertTrue([self.calc.stack count] == 0, @"stack should be empty apon creation");
}

- (void) testPushOperandOnToStackIncreasesSizeOfStack
{
    [self.calc pushNumberOnStack:@"8"];
    GHTestLog(@"the size of our stack is %d", [self.calc.stack count]);
    GHAssertTrue([self.calc.stack count] == 1, @"putting an operand on the stack should increase the size by one");
}

- (void) testCorrectOperandIsOnStack
{
    [self.calc pushNumberOnStack:@"8"];
    GHAssertTrue([[self.calc.stack objectAtIndex:0] isEqualToString:@"8"], @"putting an operand on the stack should put it in the array");
}

- (void) testAddingMoreThanOneOperandToStack
{
    [self.calc pushNumberOnStack:@"3"];
    [self.calc pushNumberOnStack:@"9"];
    [self.calc pushNumberOnStack:@"1"];
    GHAssertTrue([[self.calc.stack objectAtIndex:1] isEqualToString:@"9"], @"putting 3 items on the stack and looking to see if the second (index 1) is correct");
}

- (void) testPopOperandFromStackDecreasesSizeofStack
{
    [self.calc pushNumberOnStack:@"8"];
    GHTestLog(@"the size of our stack is %d", [self.calc.stack count]);
    GHTestLog(@"what was poped from the stack %@", [self.calc popNumberFromStack]);
    GHAssertTrue([self.calc.stack count] == 0, @"adding an opperand and then poping it off of the stack");
}

- (void) testPopOperandFromStackReturnsCorrectValue
{
    [self.calc pushNumberOnStack:@"8"];
    [self.calc pushNumberOnStack:@"2"];
    [self.calc pushNumberOnStack:@"69"];
    GHAssertTrue([[self.calc popNumberFromStack] isEqualToString:@"69"], @"adding in mutiple operands and checking that the one that popped off is the correct one");

}

- (void) testCheckIfThePopWorksWithZeroNumbersOnStack
{
    GHAssertTrue([self.calc popNumberFromStack] == nil, @"trying to pop an operand when there isnt one");
}

- (void) testCheckToSeeIfCanPopIsCorrectNothingOn
{
    GHAssertFalse([self.calc canPopFromStack], @"looking to see if the stack has nothing on it");
}

- (void) testCheckToSeeIfCanPopIsCorrectItemsOn
{
    [self.calc pushNumberOnStack:@"8"];
    GHAssertTrue([self.calc canPopFromStack], @"looking to see if the stack has items on it");
}

- (void) testPerformTheOperationBoolReturnTrue
{
    [self.calc pushNumberOnStack:@"8"];
    [self.calc pushNumberOnStack:@"2"];
    GHAssertTrue([self.calc performOperation:@"+"], @"checks for basic functionality in returning a bool");
}

- (void) testPerformTheOperationBoolReturnFalseNotEnough
{
    [self.calc pushNumberOnStack:@"8"];
    GHAssertFalse([self.calc performOperation:@"+"], @"checks for basic functionality in returning a bool, there aren't enough numbers in stack so it returns false");
}

- (void) testPerformTheOperationCorrectOrder
{
    [self.calc pushNumberOnStack:@"2"];
    [self.calc pushNumberOnStack:@"8"];
    [self.calc performOperation:@"-"];
    GHAssertTrue([[self.calc.stack objectAtIndex:0] isEqualToString:@"6"], @"checks to see if the first off the stack is subtracted from the second off the stack");
}

- (void) testPerformTheOperationWithWrongSymbol
{
    [self.calc pushNumberOnStack:@"2"];
    [self.calc pushNumberOnStack:@"8"];
    GHAssertFalse([self.calc performOperation:@"$"], @"using the incorrect symbol to try and break things");
}

- (void) testPerformTheOperationNotEnoughOnStack0
{
    GHAssertFalse([self.calc performOperation:@"+"], @"trying to do an operation with nothing on the stack");
}

- (void) testPerformTheOperationNotEnoughOnStack1
{
    [self.calc pushNumberOnStack:@"2"];
    GHAssertFalse([self.calc performOperation:@"+"], @"trying to do an operation with only one number on the stack");
}

- (void) testPerformTheOperationNotEnoughOnStack1StillOnIt
{
    [self.calc pushNumberOnStack:@"2"];
    [self.calc performOperation:@"+"];
    GHAssertTrue([[self.calc.stack objectAtIndex:0] isEqualToString:@"2"], @"trying to do an operation with only one number on the stack");
}

- (void) testPerformTheOperationDivideByZero
{
    [self.calc pushNumberOnStack:@"0"];
    [self.calc pushNumberOnStack:@"2"];
    
    GHAssertFalse([self.calc performOperation:@"/"], @"dividing by zero should return false");
    
}


- (void) testPerformTheOperationDivideByZeroOnStack
{
    [self.calc pushNumberOnStack:@"0"];
    [self.calc pushNumberOnStack:@"2"];
    [self.calc performOperation:@"/"];
    GHAssertTrue([[self.calc.stack objectAtIndex:0] isEqualToString:@"0"], @"dividing by zero should leave the numbers on the stack in the same order");
    
}



@end
