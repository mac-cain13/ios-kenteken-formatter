//
//  KentekenFormatterTests.m
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

#import "KentekenFormatterTests.h"
#import "NSString+KentekenFormatter.h"

@implementation KentekenFormatterTests

- (void)setUp
{
    [super setUp];
    
    kentekenData = @[
    // Sidecode 1
    @{@"input" : @"ND-00-01", @"output" : @"ND-00-01", @"sidecode" : @(WRPKentekenSidecode1)},
    @{@"input" : @"ND@0#001", @"output" : @"ND-00-01", @"sidecode" : @(WRPKentekenSidecode1)},
    @{@"input" : @"FF2113", @"output" : @"FF-21-13", @"sidecode" : @(WRPKentekenSidecode1)},
    
    
    // Sidecode 2
    @{@"input" : @"00-02-AD", @"output" : @"00-02-AD", @"sidecode" : @(WRPKentekenSidecode2)},
    @{@"input" : @"00-02AD", @"output" : @"00-02-AD", @"sidecode" : @(WRPKentekenSidecode2)},
    
    // Sidecode 3
    @{@"input" : @"00-AD-01", @"output" : @"00-AD-01", @"sidecode" : @(WRPKentekenSidecode3)},
    @{@"input" : @"00AD01", @"output" : @"00-AD-01", @"sidecode" : @(WRPKentekenSidecode3)},
    
    // Sidecode 4
    @{@"input" : @"JG-54-PV", @"output" : @"JG-54-PV", @"sidecode" : @(WRPKentekenSidecode4)},
    @{@"input" : @"JG--54--PV", @"output" : @"JG-54-PV", @"sidecode" : @(WRPKentekenSidecode4)},
    @{@"input" : @"ZZ-54-ZZ", @"output" : @"ZZ-54-ZZ", @"sidecode" : @(WRPKentekenSidecode4)}, // GEEN Bijzondere toelating!
    @{@"input" : @"AA-22-XX", @"output" : @"AA-22-XX", @"sidecode" : @(WRPKentekenSidecode4)}, // GEEN Koninklijk Huis!
    
    // Sidecode 5
    @{@"input" : @"JG-PV-58", @"output" : @"JG-PV-58", @"sidecode" : @(WRPKentekenSidecode5)},
    @{@"input" : @"-JGPV-58-", @"output" : @"JG-PV-58", @"sidecode" : @(WRPKentekenSidecode5)},
    
    // Sidecode 6
    @{@"input" : @"54-JG-PV", @"output" : @"54-JG-PV", @"sidecode" : @(WRPKentekenSidecode6)},
    @{@"input" : @"54.JG.PV", @"output" : @"54-JG-PV", @"sidecode" : @(WRPKentekenSidecode6)},
    
    // Sidecode 7
    @{@"input" : @"01-GBB-1", @"output" : @"01-GBB-1", @"sidecode" : @(WRPKentekenSidecode7)},
    @{@"input" : @"01GBB1", @"output" : @"01-GBB-1", @"sidecode" : @(WRPKentekenSidecode7)},
    
    // Sidecode 8
    @{@"input" : @"1-KBB-00", @"output" : @"1-KBB-00", @"sidecode" : @(WRPKentekenSidecode8)},
    @{@"input" : @"1-KBB00", @"output" : @"1-KBB-00", @"sidecode" : @(WRPKentekenSidecode8)},
    
    // Sidecode 9
    @{@"input" : @"DB-001-B", @"output" : @"DB-001-B", @"sidecode" : @(WRPKentekenSidecode9)},
    @{@"input" : @"DB--001-B", @"output" : @"DB-001-B", @"sidecode" : @(WRPKentekenSidecode9)},
    
    // Sidecode 10
    @{@"input" : @"D-001-BB", @"output" : @"D-001-BB", @"sidecode" : @(WRPKentekenSidecode10)},
    @{@"input" : @"D-0-0-1-B-B", @"output" : @"D-001-BB", @"sidecode" : @(WRPKentekenSidecode10)},
    
    // Koninklijk huis kentekens
    @{@"input" : @"AA-01", @"output" : @"AA-01", @"sidecode" : @(WRPKentekenSidecodeKoninklijkHuis)},
    @{@"input" : @"AA01", @"output" : @"AA-01", @"sidecode" : @(WRPKentekenSidecodeKoninklijkHuis)},
    @{@"input" : @"AA-21", @"output" : @"AA-21", @"sidecode" : @(WRPKentekenSidecodeKoninklijkHuis)},
    @{@"input" : @"AA-21-", @"output" : @"AA-21", @"sidecode" : @(WRPKentekenSidecodeKoninklijkHuis)},
    @{@"input" : @"AA-150", @"output" : @"AA-150", @"sidecode" : @(WRPKentekenSidecodeKoninklijkHuis)},
    @{@"input" : @"-AA-150", @"output" : @"AA-150", @"sidecode" : @(WRPKentekenSidecodeKoninklijkHuis)},
    @{@"input" : @"AA-00-13", @"output" : @"AA-00-13", @"sidecode" : @(WRPKentekenSidecodeKoninklijkHuis)},
    @{@"input" : @"AA-0013", @"output" : @"AA-00-13", @"sidecode" : @(WRPKentekenSidecodeKoninklijkHuis)},
    
    // Internationaal Gerechtshof kentekens
    @{@"input" : @"CDJ-253", @"output" : @"CDJ-253", @"sidecode" : @(WRPKentekenSidecodeInternationaalGerechtshof)},
    @{@"input" : @"CDJ253", @"output" : @"CDJ-253", @"sidecode" : @(WRPKentekenSidecodeInternationaalGerechtshof)},
    @{@"input" : @"CDJ000", @"output" : @"CDJ-000", @"sidecode" : @(WRPKentekenSidecodeInternationaalGerechtshof)},
    
    // Bijzondere Toelating kenteken
    @{@"input" : @"ZZ-00-01", @"output" : @"ZZ-00-01", @"sidecode" : @(WRPKentekenSidecodeBijzondereToelating)},
    @{@"input" : @"ZZ0001", @"output" : @"ZZ-00-01", @"sidecode" : @(WRPKentekenSidecodeBijzondereToelating)},
    @{@"input" : @"ZZ-99-33", @"output" : @"ZZ-99-33", @"sidecode" : @(WRPKentekenSidecodeBijzondereToelating)},
    
    // Tijdelijk kenteken voor 1 dag
    @{@"input" : @"F-01-02", @"output" : @"F-01-02", @"sidecode" : @(WRPKentekenSidecodeTijdelijkVoorEenDag)},
    @{@"input" : @"F0102", @"output" : @"F-01-02", @"sidecode" : @(WRPKentekenSidecodeTijdelijkVoorEenDag)},
    @{@"input" : @"F-2211", @"output" : @"F-22-11", @"sidecode" : @(WRPKentekenSidecodeTijdelijkVoorEenDag)},
    
    // Ongeldige kentekens
    @{@"input" : @"", @"output" : @"", @"sidecode" : @(WRPKentekenSidecodeUnknown)},
    @{@"input" : @"ZZ-ZZ-ZZ", @"output" : @"ZZ-ZZ-ZZ", @"sidecode" : @(WRPKentekenSidecodeUnknown)},
    @{@"input" : @"22-22-22", @"output" : @"22-22-22", @"sidecode" : @(WRPKentekenSidecodeUnknown)},
    @{@"input" : @"JG-5X-PV", @"output" : @"JG-5-XPV", @"sidecode" : @(WRPKentekenSidecodeUnknown)},
    @{@"input" : @"CDJ-2534", @"output" : @"CDJ-25-34", @"sidecode" : @(WRPKentekenSidecodeUnknown)},
    @{@"input" : @"54JGPV123", @"output" : @"54-JG-PV-123", @"sidecode" : @(WRPKentekenSidecodeUnknown)},
    @{@"input" : @"D-001", @"output" : @"D-001", @"sidecode" : @(WRPKentekenSidecodeUnknown)},
    @{@"input" : @"DDD000", @"output" : @"DDD-000", @"sidecode" : @(WRPKentekenSidecodeUnknown)},
    @{@"input" : @"X0X0X0", @"output" : @"X-0-X-0-X-0", @"sidecode" : @(WRPKentekenSidecodeUnknown)},
    @{@"input" : @"F21AA", @"output" : @"F-21-AA", @"sidecode" : @(WRPKentekenSidecodeUnknown)},
    @{@"input" : @"FA21A", @"output" : @"FA-21-A", @"sidecode" : @(WRPKentekenSidecodeUnknown)}
    ];
}

- (void)tearDown
{
    kentekenData = nil;
}

- (void)testKentekenFormat
{
    for (NSDictionary *kentekenInfo in kentekenData)
    {
        NSString *outputString = [kentekenInfo[@"input"] kentekenFormat];
        STAssertEqualObjects(outputString, kentekenInfo[@"output"], @"Formatten van %@ geeft %@ in plaats van het verwachtte %@.", kentekenInfo[@"input"], outputString, kentekenInfo[@"output"]);
    }
}

- (void)testKentekenSidecode
{
    for (NSDictionary *kentekenInfo in kentekenData)
    {
        WRPKentekenSidecode outputSidecode = [kentekenInfo[@"input"] kentekenSidecode];
        STAssertEquals(outputSidecode, [kentekenInfo[@"sidecode"] intValue], @"%@ geeft sidecode %d in plaats van de verwachtte sidecode %@.", kentekenInfo[@"input"], outputSidecode, kentekenInfo[@"sidecode"]);
    }
}

@end
