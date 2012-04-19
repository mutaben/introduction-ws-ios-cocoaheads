//
//  DetailViewController.h
//  DemoWSCocoaHeads
//
//  Created by Mustapha Tarek Ben Lechhab on 18/04/12.
//  Copyright (c) 2012 Techilm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMEvent.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) BMEvent *detailItem;

@property (strong, nonatomic) IBOutlet UILabel *titre;
@property (strong, nonatomic) IBOutlet UILabel *date;
@property (strong, nonatomic) IBOutlet UILabel *heure;
@property (strong, nonatomic) IBOutlet UILabel *adresse;
@property (strong, nonatomic) IBOutlet UILabel *codePostal;
@property (strong, nonatomic) IBOutlet UILabel *ville;

@end
