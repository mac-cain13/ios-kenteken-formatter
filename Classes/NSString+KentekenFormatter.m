//
//  NSString+KentekenFormatter.m
//
//  Created by Mathijs Kadijk on 03-09-12.
//  Copyright (c) 2012 Wrep - http://www.wrep.nl/
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this
//  software and associated documentation files (the "Software"), to deal in the Software
//  without restriction, including without limitation the rights to use, copy, modify, merge,
//  publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons
//  to whom the Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all copies or
//  substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
//  INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
//  PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE
//  FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
//  OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
//  DEALINGS IN THE SOFTWARE.
//

#import "NSString+KentekenFormatter.h"

@implementation NSString (KentekenFormatter)

- (NSString *)kentekenFormat
{
    // If string if empty just return an empty string
    if ([self length] == 0)
    {
        return @"";
    }
    
    // Strip non-alphanumeric characters
    NSCharacterSet *nonAlphaNumericCharacters = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
    NSString *workingString = [[self componentsSeparatedByCharactersInSet:nonAlphaNumericCharacters] componentsJoinedByString:@""];
    
    // Uppercase the string
    workingString = [workingString uppercaseString];

    // Initialize some variables
    char curChar = [workingString characterAtIndex:0];
    BOOL lastCharWasNumber = (curChar >= '0' && curChar <= '9');
    int charsOfTheSameTypeInARow = 0;
    
    // Loop through all characters
    for (int i = 0; i < [workingString length]; i++)
    {
        curChar = [workingString characterAtIndex:i];
        BOOL curCharIsNumber = (curChar >= '0' && curChar <= '9');
        
        if (curCharIsNumber != lastCharWasNumber)
        {
            // We are switching from letters to numbers or vice versa, add dash and reset counter
            workingString = [workingString stringByReplacingCharactersInRange:NSMakeRange(i, 0) withString:@"-"];
            charsOfTheSameTypeInARow = 0;
        }
        else
        {
            // Count the number of letters/numbers in a row
            charsOfTheSameTypeInARow++;
            
            if (charsOfTheSameTypeInARow >= 4)
            {
                // There are 4 of the same type of characters in a row, add dash between number 2 and 3 and set the counter to the correct amount
                workingString = [workingString stringByReplacingCharactersInRange:NSMakeRange(i-1, 0) withString:@"-"];
                charsOfTheSameTypeInARow = 1;
            }
        }

        // Save the type of this character for the next iteration
        lastCharWasNumber = curCharIsNumber;
    }

    // Return the result
    return workingString;
}

- (WRPKentekenSidecode)kentekenSidecode
{
    // Initialize sidecode regexps
    NSArray *sidecodeExpressions = @[
    @{@"regexp" : @"^ZZ-[0-9]{2}-[0-9]{2}$", @"sidecode" : @(WRPKentekenSidecodeBijzondereToelating)},
    @{@"regexp" : @"^CDJ-[0-9]{3}$", @"sidecode" : @(WRPKentekenSidecodeInternationaalGerechtshof)},
    @{@"regexp" : @"^AA-[0-9]{2,3}(-[0-9]{2})?$", @"sidecode" : @(WRPKentekenSidecodeKoninklijkHuis)},
    @{@"regexp" : @"^[A-Z]{2}-[0-9]{2}-[0-9]{2}$", @"sidecode" : @(WRPKentekenSidecode1)},
    @{@"regexp" : @"^[0-9]{2}-[0-9]{2}-[A-Z]{2}$", @"sidecode" : @(WRPKentekenSidecode2)},
    @{@"regexp" : @"^[0-9]{2}-[A-Z]{2}-[0-9]{2}$", @"sidecode" : @(WRPKentekenSidecode3)},
    @{@"regexp" : @"^[A-Z]{2}-[0-9]{2}-[A-Z]{2}$", @"sidecode" : @(WRPKentekenSidecode4)},
    @{@"regexp" : @"^[A-Z]{2}-[A-Z]{2}-[0-9]{2}$", @"sidecode" : @(WRPKentekenSidecode5)},
    @{@"regexp" : @"^[0-9]{2}-[A-Z]{2}-[A-Z]{2}$", @"sidecode" : @(WRPKentekenSidecode6)},
    @{@"regexp" : @"^[0-9]{2}-[A-Z]{3}-[0-9]{1}$", @"sidecode" : @(WRPKentekenSidecode7)},
    @{@"regexp" : @"^[0-9]{1}-[A-Z]{3}-[0-9]{2}$", @"sidecode" : @(WRPKentekenSidecode8)},
    @{@"regexp" : @"^[A-Z]{2}-[0-9]{3}-[A-Z]{1}$", @"sidecode" : @(WRPKentekenSidecode9)},
    @{@"regexp" : @"^[A-Z]{1}-[0-9]{3}-[A-Z]{2}$", @"sidecode" : @(WRPKentekenSidecode10)},
    ];
    
    // Format kenteken
    NSString *kentekenString = [self kentekenFormat];
    
    // Walk through all sidecode options
    for (NSDictionary *sidecodeInfo in sidecodeExpressions)
    {
        // Initialize regexp
        NSError *error;
        NSRegularExpression *regexp = [NSRegularExpression regularExpressionWithPattern:sidecodeInfo[@"regexp"]
                                                                                options:0
                                                                                  error:&error];
        
#if DEBUG
        // Check for initialization errors
        if (error)
        {
            NSLog(@"NSString+KentekenFormatter could not initialize regular expression: %@", sidecodeInfo[@"regexp"]);
        }
#endif
        
        // Calculate if this string matches the regexp
        NSRange matchedRange = [regexp rangeOfFirstMatchInString:kentekenString
                                                         options:0
                                                           range:NSMakeRange(0, kentekenString.length)];
        
        // If we have a match...
        if (matchedRange.location != NSNotFound)
        {
            // Return the correct sidecode
            return [sidecodeInfo[@"sidecode"] integerValue];
        }
    }
    
    // No matched, so sidecode unknown
    return WRPKentekenSidecodeUnknown;
}

@end
