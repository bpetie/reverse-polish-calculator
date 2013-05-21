//
//  Calculator.m
//  ReversePolishNotationCalculation
//
//  Created by Brian Peterman on 5/21/13.
//  Copyright (c) 2013 Brian Peterman. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

@synthesize stack;

- (id) init {
    self = [super init];
    if (self) {
        [self setStack:[[NSMutableArray alloc] init]];
    }
    return self;
}



- (void) pushNumberOnStack:(NSString *)number
{
    [self.stack addObject:number];
}

- (NSString *) popNumberFromStack
{
    NSString *poppedItem = nil;
    if ([self canPopFromStack]) {
        poppedItem = [self.stack objectAtIndex:([self.stack count] -1)];
        [self.stack removeLastObject];
    }
    return poppedItem;
}

- (BOOL) canPopFromStack
{
    return ([self.stack count] > 0);
}

- (BOOL) performOperation:(NSString *)operation
{
    NSString *firstOffStack = [self popNumberFromStack];
    if (firstOffStack == nil) {
        return false;
    }
    
    NSString *secondOffStack = [self popNumberFromStack];
    if (secondOffStack == nil) {
        [self pushNumberOnStack:firstOffStack];
        return false;
    }
    
    NSString *pushBackOnStack;
    double firstDouble = [firstOffStack doubleValue];
    double secondDouble = [secondOffStack doubleValue];
    
    if ([operation isEqualToString:@"+"]) {
        pushBackOnStack = [NSString stringWithFormat:@"%g", (firstDouble + secondDouble)];
    }
    
    else if ([operation isEqualToString:@"-"]) {
        pushBackOnStack = [NSString stringWithFormat:@"%g", (firstDouble - secondDouble)];
    }

    else if ([operation isEqualToString:@"*"]) {
        pushBackOnStack = [NSString stringWithFormat:@"%g", (firstDouble * secondDouble)];
    }
    
    else if ([operation isEqualToString:@"/"]) {
        if (secondDouble == 0) {
            [self pushNumberOnStack:secondOffStack];
            [self pushNumberOnStack:firstOffStack];
            return false;
        }
        pushBackOnStack = [NSString stringWithFormat:@"%g", (firstDouble / secondDouble)];
        
    }
    
    else {
        [self pushNumberOnStack:secondOffStack];
        [self pushNumberOnStack:firstOffStack];
        return false;
    }
    
    [self pushNumberOnStack:pushBackOnStack];
    return true;
}



@end


