//
//  US2Condition.m
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

#import "US2Condition.h"


@implementation US2Condition


#pragma mark - Init

+ (instancetype)condition
{
    return [[[self class] alloc] init];
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self setup];
    }
    
    return self;
}

- (instancetype)initWithLocalizedViolationString:(NSString *)localizedViolationString
{
    self = [super init];
    if (self)
    {
        [self setup];
        _localizedViolationString = localizedViolationString;
    }
    
    return self;
}

- (instancetype)initWithLocalizedViolationString:(NSString *)localizedViolationString andRegexString:(NSString *)regexString
{
    self = [super init];
    if (self)
    {
        [self setup];
        _localizedViolationString = localizedViolationString;
        _regexString = regexString;
    }
    
    return self;
}

- (instancetype)initWithRegexString:(NSString *)regexString
{
    self = [super init];
    if (self)
    {
        [self setup];
        _regexString = regexString;
    }
    
    return self;
}

- (void)setup
{
    _shouldAllowViolation = YES;
}


#pragma mark - Check

/**
 Check the custom condition.
 *
 @return Return whether condition check failed or not
*/
- (BOOL)check:(NSString *)string
{
    BOOL success = YES;
    
    if(!string)
    {
        success = NO;
    }
    else if(_regexString)
    {
        NSError *error = NULL;
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:_regexString options:NSRegularExpressionCaseInsensitive error:&error];
        if(!error)
        {
            NSRange matchRange = [regex rangeOfFirstMatchInString:string options:0 range:NSMakeRange(0, string.length)];
            success = (matchRange.location == 0) && (matchRange.length == string.length);
        }
    }
    
    return success;
}


#pragma mark - Localization

/**
 Create a localized violation string.
 */
- (NSString *)createLocalizedViolationString
{
    return nil;
}

/**
 Returns a localized violation string.
 *
 @return Localized violation string
*/
- (NSString *)localizedViolationString
{
    if (!_localizedViolationString)
    {
        return [self createLocalizedViolationString];
    }
    
    return _localizedViolationString;
}


#pragma mark - Description

/**
 Returns the description
 *
 @return Description string
*/
- (NSString *)description
{
    NSMutableString *description = [NSMutableString string];
    [description appendString:@"<"];
    [description appendString:[super description]];
    [description appendString:[NSString stringWithFormat:@"\n <shouldAllowViolation: %@>", _shouldAllowViolation == 0 ? @"NO" : @"YES"]];
    [description appendString:[NSString stringWithFormat:@"\n <localizedViolationString: %@>", [self localizedViolationString]]];
    [description appendString:[NSString stringWithFormat:@"\n <regexString: %@>", _regexString]];
    [description appendString:@">"];
    
    return description;
}


@end
