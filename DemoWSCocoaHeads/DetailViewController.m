//
//  DetailViewController.m
//  DemoWSCocoaHeads
//
//  Created by Mustapha Tarek Ben Lechhab on 18/04/12.
//  Copyright (c) 2012 Techilm. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

@synthesize titre = _titre;
@synthesize date = _date;
@synthesize heure = _heure;
@synthesize adresse = _adresse;
@synthesize codePostal = _codePostal;
@synthesize ville = _ville;

@synthesize detailItem = _detailItem;

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        
        NSDateFormatter *maDate = [[NSDateFormatter alloc] init];
        [maDate setDateFormat:@"dd MMM yyyy"];
        
        NSLocale *frLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"France"];
        [maDate setLocale:frLocale];
        
        NSString *dateString = [NSString stringWithFormat:@"%@", [maDate stringFromDate:self.detailItem.date]];

        NSDateFormatter *monHeure = [[NSDateFormatter alloc] init];
        [monHeure setDateFormat:@"HH'h'mm"];

        [monHeure setLocale:frLocale];
        
        NSString *heureString = [NSString stringWithFormat:@"%@", [monHeure stringFromDate:self.detailItem.heure]];
        
        self.titre.text = self.detailItem.titre;
        self.date.text = dateString;
        self.heure.text = heureString;
        self.adresse.text = self.detailItem.adresse;
        self.codePostal.text = self.detailItem.codePostal;
        self.ville.text = self.detailItem.ville;
        
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)viewDidUnload
{
    [self setDate:nil];
    [self setHeure:nil];
    [self setAdresse:nil];
    [self setCodePostal:nil];
    [self setVille:nil];
    [super viewDidUnload];
    
    // Release any retained subviews of the main view.
    self.date = nil;
    self.heure = nil;
    self.titre = nil;
    self.adresse = nil;
    self.codePostal = nil;
    self.ville = nil;
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Detail", @"Detail");
    }
    return self;
}
							
@end
