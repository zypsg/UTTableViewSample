//
//  ViewController.m
//  UITableViewSample
//
//  Created by  on 12-5-12.
//  Copyright (c) 2012年 瓦力. All rights reserved.
//

#import "ViewController.h"
#import "DequeueReuseViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize _tableview,titles;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.titles = [NSArray arrayWithObjects:@"dequeueReusable study", nil];
    self.navigationItem.title =@"UITableViewStudy";
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


- (void) dealloc
{
    [_tableview release];
    [titles release];
    [super dealloc];
}
#pragma mark-
#pragma mark ---UITableView Delegate Methods ---
 
 
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
        {
            DequeueReuseViewController* drvc = [[DequeueReuseViewController alloc] initWithStyle:UITableViewStylePlain];
            drvc.navigationItem.title = [self.titles objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:drvc animated:YES];
            [drvc release];
        }
            break;
            
        default:
            break;
    }
}
 
#pragma mark-
#pragma mark ---UITableView Datasource Methods ---
 

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.titles count];
}
 

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellIdentifier = @"cellIdentifier";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell==nil)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
    }
    cell.textLabel.text = [self.titles objectAtIndex:indexPath.row];
    return cell;
}

 

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

 
@end
