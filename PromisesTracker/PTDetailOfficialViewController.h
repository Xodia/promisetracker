//
//  PTDetailOfficialViewController.h
//  PromisesTracker
//
//  Created by Morgan Collino on 07/12/2013.
//  Copyright (c) 2013 Morgan Collino. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PTOfficial;

@interface PTDetailOfficialViewController : UIViewController <UIAlertViewDelegate>
{
    UIImageView *imageView;
    UILabel *city, *line, *description, *party;
    UIImageView *partyImage, *graphImage;
    UIButton *phone, *social;
}

@property (nonatomic, retain) IBOutlet UIImageView *imageView;
@property (nonatomic, retain) IBOutlet UIImageView *partyImage;
@property (nonatomic, retain) IBOutlet UIImageView *graphImage;
@property (nonatomic, retain) IBOutlet UILabel *city;
@property (nonatomic, retain) IBOutlet UILabel *line;
@property (nonatomic, retain) IBOutlet UILabel *description;
@property (nonatomic, retain) IBOutlet UILabel *party;
@property (nonatomic, retain) IBOutlet UIButton *phone;
@property (nonatomic, retain) IBOutlet UIButton *social;

@property (nonatomic, retain) PTOfficial *official;

@end
