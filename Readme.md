iOS Kenteken formatter
======================

Nederlandse kentekens formatten en valideren in je iOS project.

Ontstaan van het project
------------------------
Voor een project waren we op zoek naar een formatter/validator voor Nederlandse kentekens in Objective-C. Die konden we niet vinden dus besloten we zelf een te maken! We delen deze code graag met je zodat ook jij je voordeel ermee kunt doen.

Hoe gebruik ik het?
-------------------
Hang de `NSString+KentekenFormatter` bestanden, die vind je in de `Classes`-map, in je project. Importeer deze waar nodig en roep op de betreffende `NSString` de methodes aan die je nodig hebt!

Kijk eventueel in de `NSString+KentekenFormatter.h` welke methoden beschikbaar zijn en wat ze doen, hier vind je ook enige inline documentatie. Een klein codevoorbeeldje:

`[@"11AA22" kentekenFormat]; // Dit geeft de string 11-AA-22 terug`
`[@"11A" kentekenFormat]; // Dit geeft de string 11-A terug`
`[@"11A" kentekenSidecode]; // Dit geeft WRPKentekenSidecodeUnknown terug`
`[@"AA-01" kentekenSidecode]; // Dit geeft de WRPKentekenSidecodeKoninklijkHuis terug`

Hoe kan ik meehelpen?
---------------------
Natuurlijk! Fork het project, maak je aanpassingen/toevoegingen/bugfixes en submit een pull request. Check de issues tab voor eventuele inspiratie als je mee wilt werken maar niet zo goed iets weet. Let goed up dat je pull request gebaseerd is op de laatste commits hier! Dat maakt het een stuk makkelijker voor iedereen. :)

Als je foutjes vind of verbeterpunten weet maak dan vooral een issue aan hier op Github!

Kan ik betaalde ondersteuning krijgen?
--------------------------------------
Ja dat kan, kijk op [onze website](http://www.wrep.nl/#contactgegevens) voor contactgegevens, bel of mail met een heldere omschrijving van je probleem of vraag en dan kijken we graag wat we voor je kunnen betekenen!

