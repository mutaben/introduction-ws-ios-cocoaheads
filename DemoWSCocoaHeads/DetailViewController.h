//
//  DetailViewController.h
//  DemoWSCocoaHeads
//
//  Created by Mustapha Tarek Ben Lechhab on 18/04/12.
//  Copyright (c) 2012 Techilm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
