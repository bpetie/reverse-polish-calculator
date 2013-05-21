//
//  Calculator.h
//  ReversePolishNotationCalculation
//
//  Created by Brian Peterman on 5/21/13.
//  Copyright (c) 2013 Brian Peterman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject

@property (strong, nonatomic) NSMutableArray *stack;

- (void) pushNumberOnStack:(NSString *)number;

- (NSString *) popNumberFromStack;

- (BOOL) canPopFromStack;

- (BOOL) performOperation:(NSString *)operation;



@end
