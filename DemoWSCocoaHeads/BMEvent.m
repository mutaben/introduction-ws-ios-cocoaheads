//
//  BMEvent.m
//  DemoWSCocoaHeads
//
//  Created by Mustapha Tarek Ben Lechhab on 18/04/12.
//  Copyright (c) 2012 Techilm. All rights reserved.
//

#import "BMEvent.h"

@implementation BMEvent

@synthesize date, heure, titre, adresse, codePostal, ville;

-(id)initWithDictionary:(NSDictionary *) dataDict{
    self = [super init];
    if (self)
    {
        NSDateFormatter *dfDate = [[NSDateFormatter alloc] init];
        [dfDate setDateFormat:@"yyyy-MM-dd"];
        
        NSLocale *frLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"France"];
        [dfDate setLocale:frLocale];
        
        NSDate *laDate = [dfDate dateFromString:[dataDict objectForKey:@"date"]];
          
        self.date = laDate;
        
        NSDateFormatter *dfHeure = [[NSDateFormatter alloc] init];
        [dfHeure setDateFormat:@"HH:mm:ss"];
        
        [dfHeure setLocale:frLocale];
        
        NSDate *lHeure = [dfHeure dateFromString:[dataDict objectForKey:@"heure"]];
        
        
        self.heure = lHeure;
        self.titre = [dataDict objectForKey:@"titre"];
        self.adresse = [dataDict objectForKey:@"adresse"];
        self.codePostal = [dataDict objectForKey:@"codepostal"];
        self.ville = [dataDict objectForKey:@"ville"];
    }
    return self;
}


@end
