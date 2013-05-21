//
//  CalculatorView.h
//  ReversePolishNotationCalculation
//
//  Created by Brian Peterman on 5/21/13.
//  Copyright (c) 2013 Brian Peterman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalculatorView : UIView

@property (strong, nonatomic)  UIButton *zeroButton;
@property (strong, nonatomic)  UIButton *oneButton;
@property (strong, nonatomic)  UIButton *twoButton;
@property (strong, nonatomic)  UIButton *threeButton;
@property (strong, nonatomic)  UIButton *fourButton;
@property (strong, nonatomic)  UIButton *fiveButtton;
@property (strong, nonatomic)  UIButton *sixButton;
@property (strong, nonatomic)  UIButton *sevenButton;
@property (strong, nonatomic)  UIButton *eightButton;
@property (strong, nonatomic)  UIButton *nineButton;
@property (strong, nonatomic)  UIButton *addButton;
@property (strong, nonatomic)  UIButton *minusButton;
@property (strong, nonatomic)  UIButton *multiplyButton;
@property (strong, nonatomic)  UIButton *divideButton;
@property (strong, nonatomic)  UIButton *enterButton;
@property (strong, nonatomic)  UILabel *displayScreen;

@end
