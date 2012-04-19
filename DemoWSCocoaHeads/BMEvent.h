//
//  BMEvent.h
//  DemoWSCocoaHeads
//
//  Created by Mustapha Tarek Ben Lechhab on 18/04/12.
//  Copyright (c) 2012 Techilm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BMEvent : NSObject

@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSDate *heure;
@property (nonatomic, strong) NSString *titre;
@property (nonatomic, strong) NSString *adresse;
@property (nonatomic, strong) NSString *codePostal;
@property (nonatomic, strong) NSString *ville;

-(id)initWithDictionary:(NSDictionary *) dataDict;

@end
