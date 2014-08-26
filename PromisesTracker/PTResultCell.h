//
//  PTResultCell.h
//  PromisesTracker
//
//  Created by Morgan Collino on 07/12/2013.
//  Copyright (c) 2013 Morgan Collino. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PTResultCell : UITableViewCell
{
    UILabel *label;
}

@property (nonatomic, retain) IBOutlet UILabel *label;

@end
