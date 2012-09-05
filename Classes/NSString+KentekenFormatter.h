//
//  NSString+KentekenFormatter.h
//
//  Created by Mathijs Kadijk on 03-09-12.
//  Copyright (c) 2012 Wrep. All rights reserved.
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
 Format een string naar een Nederlands kenteken. Sidecode 1 t/m 10 worden ondersteund.
  
 @discussion Corrupte kentekens worden zo goed en zo kwaad als het gaat geformat, dit zodat deze functie ook nuttig is om te gebruiken tijdens het invoeren van de gebruiker. Voor meer informatie over kenteken formaten en sidecodes zie http://nl.wikipedia.org/wiki/Nederlands_kenteken
 */
- (NSString *)kentekenFormat;

/**
 Check welke sidecode dit kenteken is.
 
 @discussion Voor meer informatie over kenteken sidecodes zie http://nl.wikipedia.org/wiki/Nederlands_kenteken
 */
- (WRPKentekenSidecode)kentekenSidecode;

@end
