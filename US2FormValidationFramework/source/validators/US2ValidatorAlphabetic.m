//
//  US2ValidatorAlphabetic.m
//  US2FormValidator
//
//  Copyright (C) 2012 ustwo™
//  
//  Permission is hereby granted, free of charge, to any person obtaining a copy of
//  this software and associated documentation files (the "Software"), to deal in
//  the Software without restriction, including without limitation the rights to
//  use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
//  of the Software, and to permit persons to whom the Software is furnished to do
//  so, subject to the following conditions:
//  
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//  
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//  

#import "US2ValidatorAlphabetic.h"
#import "US2ConditionAlphabetic.h"


@implementation US2ValidatorAlphabetic


#pragma mark - Initialization

- (id)init
{
    self = [self initWithCondition:[[US2ConditionAlphabetic alloc] init]];
    return self;
}

// TODO: (MS) Think about it whether it is needed or not.
//- (BOOL)allowWhitespace
//{
//    return [(US2ConditionAlphabetic *)[self condition] allowWhitespace];
//}
//
//- (void)setAllowWhitespace:(BOOL)allowWhitespace
//{
//    [(US2ConditionAlphabetic *)[self condition] setAllowWhitespace:allowWhitespace];
//}

@end
