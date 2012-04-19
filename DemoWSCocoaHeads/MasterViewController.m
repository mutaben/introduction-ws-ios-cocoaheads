//
//  MasterViewController.m
//  DemoWSCocoaHeads
//
//  Created by Mustapha Tarek Ben Lechhab on 18/04/12.
//  Copyright (c) 2012 Techilm. All rights reserved.
//

#define kLatestEventsURL [NSURL URLWithString:@"http://sbjoomla.techilm.com/api/events/"] 

#import "MasterViewController.h"
#import "BMEvent.h"
#import "DetailViewController.h"


@implementation MasterViewController

@synthesize detailViewController = _detailViewController;
@synthesize tableauEvent;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Evenements";

    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    NSData* data = [NSData dataWithContentsOfURL:kLatestEventsURL];

    NSError* error;
    NSDictionary* json = [NSJSONSerialization 
                          JSONObjectWithData:data
                          options:kNilOptions 
                          error:&error];
    
    tableauEvent = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dic in json) {        
        BMEvent *event = [[BMEvent alloc] initWithDictionary:dic];
        [tableauEvent addObject:event];        
    }
    
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}



#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return tableauEvent.count;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }


    BMEvent *event = [tableauEvent objectAtIndex:indexPath.row];
    cell.textLabel.text = event.ville;
    cell.detailTextLabel.text = event.titre;
    return cell;
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.detailViewController) {
        self.detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    }
    self.detailViewController.detailItem = [tableauEvent objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:self.detailViewController animated:YES];
}

@end
