//
//  PTOfficialViewController.h
//  PromisesTracker
//
//  Created by Morgan Collino on 07/12/2013.
//  Copyright (c) 2013 Morgan Collino. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PTOfficial;

@interface PTOfficialViewController : UIViewController
{
    UIImageView *imageView;
    UILabel *label;
    UIButton *info;
    UIImageView *isFulfill;
}

@property (nonatomic, retain) IBOutlet UIImageView *imageView;
@property (nonatomic, retain) IBOutlet UIImageView *isFulfill;
@property (nonatomic, retain) IBOutlet UIButton *info;
@property (nonatomic, retain) IBOutlet UILabel *label;

@property (nonatomic, retain) PTOfficial *official;

@end
