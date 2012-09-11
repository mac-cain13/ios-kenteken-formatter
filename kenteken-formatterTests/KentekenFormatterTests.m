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
    @{@"input" : @"ND-00-01", @"output" : @"ND-00-01", @"sidecode" : @(WRPKentekenSidecode1), @"type" : @(WRPKentekenTypeNormal)},
    @{@"input" : @"ND@0#001", @"output" : @"ND-00-01", @"sidecode" : @(WRPKentekenSidecode1), @"type" : @(WRPKentekenTypeNormal)},
    @{@"input" : @"FF2113", @"output" : @"FF-21-13", @"sidecode" : @(WRPKentekenSidecode1), @"type" : @(WRPKentekenTypeNormal)},
    
    
    // Sidecode 2
    @{@"input" : @"00-02-AD", @"output" : @"00-02-AD", @"sidecode" : @(WRPKentekenSidecode2), @"type" : @(WRPKentekenTypeNormal)},
    @{@"input" : @"00-02AD", @"output" : @"00-02-AD", @"sidecode" : @(WRPKentekenSidecode2), @"type" : @(WRPKentekenTypeNormal)},
    
    // Sidecode 3
    @{@"input" : @"00-AD-01", @"output" : @"00-AD-01", @"sidecode" : @(WRPKentekenSidecode3), @"type" : @(WRPKentekenTypeNormal)},
    @{@"input" : @"00AD01", @"output" : @"00-AD-01", @"sidecode" : @(WRPKentekenSidecode3), @"type" : @(WRPKentekenTypeNormal)},
    
    // Sidecode 4
    @{@"input" : @"JG-54-PV", @"output" : @"JG-54-PV", @"sidecode" : @(WRPKentekenSidecode4), @"type" : @(WRPKentekenTypeNormal)},
    @{@"input" : @"JG--54--PV", @"output" : @"JG-54-PV", @"sidecode" : @(WRPKentekenSidecode4), @"type" : @(WRPKentekenTypeNormal)},
    @{@"input" : @"ZZ-54-ZZ", @"output" : @"ZZ-54-ZZ", @"sidecode" : @(WRPKentekenSidecode4), @"type" : @(WRPKentekenTypeNormal)}, // GEEN Bijzondere toelating!
    @{@"input" : @"AA-22-XX", @"output" : @"AA-22-XX", @"sidecode" : @(WRPKentekenSidecode4), @"type" : @(WRPKentekenTypeNormal)}, // GEEN Koninklijk Huis!
    
    // Sidecode 5
    @{@"input" : @"JG-PV-58", @"output" : @"JG-PV-58", @"sidecode" : @(WRPKentekenSidecode5), @"type" : @(WRPKentekenTypeNormal)},
    @{@"input" : @"-JGPV-58-", @"output" : @"JG-PV-58", @"sidecode" : @(WRPKentekenSidecode5), @"type" : @(WRPKentekenTypeNormal)},
    
    // Sidecode 6
    @{@"input" : @"54-JG-PV", @"output" : @"54-JG-PV", @"sidecode" : @(WRPKentekenSidecode6), @"type" : @(WRPKentekenTypeNormal)},
    @{@"input" : @"54.JG.PV", @"output" : @"54-JG-PV", @"sidecode" : @(WRPKentekenSidecode6), @"type" : @(WRPKentekenTypeNormal)},
    
    // Sidecode 7
    @{@"input" : @"01-GBB-1", @"output" : @"01-GBB-1", @"sidecode" : @(WRPKentekenSidecode7), @"type" : @(WRPKentekenTypeNormal)},
    @{@"input" : @"01GBB1", @"output" : @"01-GBB-1", @"sidecode" : @(WRPKentekenSidecode7), @"type" : @(WRPKentekenTypeNormal)},
    
    // Sidecode 8
    @{@"input" : @"1-KBB-00", @"output" : @"1-KBB-00", @"sidecode" : @(WRPKentekenSidecode8), @"type" : @(WRPKentekenTypeNormal)},
    @{@"input" : @"1-KBB00", @"output" : @"1-KBB-00", @"sidecode" : @(WRPKentekenSidecode8), @"type" : @(WRPKentekenTypeNormal)},
    
    // Sidecode 9
    @{@"input" : @"DB-001-B", @"output" : @"DB-001-B", @"sidecode" : @(WRPKentekenSidecode9), @"type" : @(WRPKentekenTypeNormal)},
    @{@"input" : @"DB--001-B", @"output" : @"DB-001-B", @"sidecode" : @(WRPKentekenSidecode9), @"type" : @(WRPKentekenTypeNormal)},
    
    // Sidecode 10
    @{@"input" : @"D-001-BB", @"output" : @"D-001-BB", @"sidecode" : @(WRPKentekenSidecode10), @"type" : @(WRPKentekenTypeNormal)},
    @{@"input" : @"D-0-0-1-B-B", @"output" : @"D-001-BB", @"sidecode" : @(WRPKentekenSidecode10), @"type" : @(WRPKentekenTypeNormal)},
    
    // Koninklijk huis kentekens
    @{@"input" : @"AA-01", @"output" : @"AA-01", @"sidecode" : @(WRPKentekenSidecodeKoninklijkHuis), @"type" : @(WRPKentekenTypeSpecial)},
    @{@"input" : @"AA01", @"output" : @"AA-01", @"sidecode" : @(WRPKentekenSidecodeKoninklijkHuis), @"type" : @(WRPKentekenTypeSpecial)},
    @{@"input" : @"AA-21", @"output" : @"AA-21", @"sidecode" : @(WRPKentekenSidecodeKoninklijkHuis), @"type" : @(WRPKentekenTypeSpecial)},
    @{@"input" : @"AA-21-", @"output" : @"AA-21", @"sidecode" : @(WRPKentekenSidecodeKoninklijkHuis), @"type" : @(WRPKentekenTypeSpecial)},
    @{@"input" : @"AA-150", @"output" : @"AA-150", @"sidecode" : @(WRPKentekenSidecodeKoninklijkHuis), @"type" : @(WRPKentekenTypeSpecial)},
    @{@"input" : @"-AA-150", @"output" : @"AA-150", @"sidecode" : @(WRPKentekenSidecodeKoninklijkHuis), @"type" : @(WRPKentekenTypeSpecial)},
    @{@"input" : @"AA-00-13", @"output" : @"AA-00-13", @"sidecode" : @(WRPKentekenSidecodeKoninklijkHuis), @"type" : @(WRPKentekenTypeSpecial)},
    @{@"input" : @"AA-0013", @"output" : @"AA-00-13", @"sidecode" : @(WRPKentekenSidecodeKoninklijkHuis), @"type" : @(WRPKentekenTypeSpecial)},
    
    // Internationaal Gerechtshof kentekens
    @{@"input" : @"CDJ-253", @"output" : @"CDJ-253", @"sidecode" : @(WRPKentekenSidecodeInternationaalGerechtshof), @"type" : @(WRPKentekenTypeSpecial)},
    @{@"input" : @"CDJ253", @"output" : @"CDJ-253", @"sidecode" : @(WRPKentekenSidecodeInternationaalGerechtshof), @"type" : @(WRPKentekenTypeSpecial)},
    @{@"input" : @"CDJ000", @"output" : @"CDJ-000", @"sidecode" : @(WRPKentekenSidecodeInternationaalGerechtshof), @"type" : @(WRPKentekenTypeSpecial)},
    
    // Bijzondere Toelating kenteken
    @{@"input" : @"ZZ-00-01", @"output" : @"ZZ-00-01", @"sidecode" : @(WRPKentekenSidecodeBijzondereToelating), @"type" : @(WRPKentekenTypeSpecial)},
    @{@"input" : @"ZZ0001", @"output" : @"ZZ-00-01", @"sidecode" : @(WRPKentekenSidecodeBijzondereToelating), @"type" : @(WRPKentekenTypeSpecial)},
    @{@"input" : @"ZZ-99-33", @"output" : @"ZZ-99-33", @"sidecode" : @(WRPKentekenSidecodeBijzondereToelating), @"type" : @(WRPKentekenTypeSpecial)},
    
    // Tijdelijk kenteken voor 1 dag
    @{@"input" : @"F-01-02", @"output" : @"F-01-02", @"sidecode" : @(WRPKentekenSidecodeTijdelijkVoorEenDag), @"type" : @(WRPKentekenTypeSpecial)},
    @{@"input" : @"F0102", @"output" : @"F-01-02", @"sidecode" : @(WRPKentekenSidecodeTijdelijkVoorEenDag), @"type" : @(WRPKentekenTypeSpecial)},
    @{@"input" : @"F-2211", @"output" : @"F-22-11", @"sidecode" : @(WRPKentekenSidecodeTijdelijkVoorEenDag), @"type" : @(WRPKentekenTypeSpecial)},
    
    // Voertuig binnen/buiten Nederland brengen
    @{@"input" : @"Z-01-02", @"output" : @"Z-01-02", @"sidecode" : @(WRPKentekenSidecodeVoertuigBinnenOfBuitenNederlandBrengen), @"type" : @(WRPKentekenTypeSpecial)},
    @{@"input" : @"Z0102", @"output" : @"Z-01-02", @"sidecode" : @(WRPKentekenSidecodeVoertuigBinnenOfBuitenNederlandBrengen), @"type" : @(WRPKentekenTypeSpecial)},
    @{@"input" : @"Z-2211", @"output" : @"Z-22-11", @"sidecode" : @(WRPKentekenSidecodeVoertuigBinnenOfBuitenNederlandBrengen), @"type" : @(WRPKentekenTypeSpecial)},
    
    // Ongeldige kentekens
    @{@"input" : @"", @"output" : @"", @"sidecode" : @(WRPKentekenSidecodeUnknown), @"type" : @(WRPKentekenTypeUnknown)},
    @{@"input" : @"ZZ-ZZ-ZZ", @"output" : @"ZZ-ZZ-ZZ", @"sidecode" : @(WRPKentekenSidecodeUnknown), @"type" : @(WRPKentekenTypeUnknown)},
    @{@"input" : @"22-22-22", @"output" : @"22-22-22", @"sidecode" : @(WRPKentekenSidecodeUnknown), @"type" : @(WRPKentekenTypeUnknown)},
    @{@"input" : @"JG-5X-PV", @"output" : @"JG-5-XPV", @"sidecode" : @(WRPKentekenSidecodeUnknown), @"type" : @(WRPKentekenTypeUnknown)},
    @{@"input" : @"CDJ-2534", @"output" : @"CDJ-25-34", @"sidecode" : @(WRPKentekenSidecodeUnknown), @"type" : @(WRPKentekenTypeUnknown)},
    @{@"input" : @"54JGPV123", @"output" : @"54-JG-PV-123", @"sidecode" : @(WRPKentekenSidecodeUnknown), @"type" : @(WRPKentekenTypeUnknown)},
    @{@"input" : @"D-001", @"output" : @"D-001", @"sidecode" : @(WRPKentekenSidecodeUnknown), @"type" : @(WRPKentekenTypeUnknown)},
    @{@"input" : @"DDD000", @"output" : @"DDD-000", @"sidecode" : @(WRPKentekenSidecodeUnknown), @"type" : @(WRPKentekenTypeUnknown)},
    @{@"input" : @"X0X0X0", @"output" : @"X-0-X-0-X-0", @"sidecode" : @(WRPKentekenSidecodeUnknown), @"type" : @(WRPKentekenTypeUnknown)},
    @{@"input" : @"F21AA", @"output" : @"F-21-AA", @"sidecode" : @(WRPKentekenSidecodeUnknown), @"type" : @(WRPKentekenTypeUnknown)},
    @{@"input" : @"FA21A", @"output" : @"FA-21-A", @"sidecode" : @(WRPKentekenSidecodeUnknown), @"type" : @(WRPKentekenTypeUnknown)},
    @{@"input" : @"Z21AA", @"output" : @"Z-21-AA", @"sidecode" : @(WRPKentekenSidecodeUnknown), @"type" : @(WRPKentekenTypeUnknown)},
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

- (void)testKentekenType
{
    for (NSDictionary *kentekenInfo in kentekenData)
    {
        WRPKentekenType outputType = [kentekenInfo[@"input"] kentekenType];
        STAssertEquals(outputType, [kentekenInfo[@"type"] intValue], @"%@ geeft type %d in plaats van de verwachtte type %@.", kentekenInfo[@"input"], outputType, kentekenInfo[@"type"]);
    }
}

@end
