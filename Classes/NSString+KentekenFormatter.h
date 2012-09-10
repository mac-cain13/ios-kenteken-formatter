//
//  NSString+KentekenFormatter.h
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

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, WRPKentekenSidecode) {
    WRPKentekenSidecodeBijzondereToelating = -3,
    WRPKentekenSidecodeInternationaalGerechtshof = -2,
    WRPKentekenSidecodeKoninklijkHuis = -1,
    WRPKentekenSidecodeUnknown = 0,
    WRPKentekenSidecode1 = 1,
    WRPKentekenSidecode2 = 2,
    WRPKentekenSidecode3 = 3,
    WRPKentekenSidecode4 = 4,
    WRPKentekenSidecode5 = 5,
    WRPKentekenSidecode6 = 6,
    WRPKentekenSidecode7 = 7,
    WRPKentekenSidecode8 = 8,
    WRPKentekenSidecode9 = 9,
    WRPKentekenSidecode10 = 10
};

@interface NSString (KentekenFormatter)

/**
 Check welke sidecode dit kenteken is.
 
 @discussion Voor meer informatie over kenteken sidecodes zie http://nl.wikipedia.org/wiki/Nederlands_kenteken
 */
@property (readonly, nonatomic)WRPKentekenSidecode kentekenSidecode;

/**
 Format een string naar een Nederlands kenteken. Sidecode 1 t/m 10 worden ondersteund.
  
 @discussion Corrupte kentekens worden zo goed en zo kwaad als het gaat geformat, dit zodat deze functie ook nuttig is om te gebruiken tijdens het invoeren van de gebruiker. Voor meer informatie over kenteken formaten en sidecodes zie http://nl.wikipedia.org/wiki/Nederlands_kenteken
 */
- (NSString *)kentekenFormat;

@end
