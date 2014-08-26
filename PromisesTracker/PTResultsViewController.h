//
//  PTResultsViewController.h
//  PromisesTracker
//
//  Created by Morgan Collino on 07/12/2013.
//  Copyright (c) 2013 Morgan Collino. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PTResultsViewController : UITableViewController
{
    NSArray *results;
}

@property (nonatomic, retain) NSArray *results;
@end
