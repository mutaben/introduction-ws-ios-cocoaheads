//
//  MasterViewController.h
//  DemoWSCocoaHeads
//
//  Created by Mustapha Tarek Ben Lechhab on 18/04/12.
//  Copyright (c) 2012 Techilm. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
