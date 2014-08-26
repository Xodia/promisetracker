//
//  PTMainViewController.h
//  PromisesTracker
//
//  Created by Morgan Collino on 07/12/2013.
//  Copyright (c) 2013 Morgan Collino. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PTMainViewController : UIViewController <UITextFieldDelegate>
{
    UILabel *label;
    UITextField *zipcode, *city, *official;
    UIButton *valider, *logoff;
}

@property (nonatomic, retain) IBOutlet UITextField *address;
@property (nonatomic, retain) IBOutlet UIButton *valider;
@property (nonatomic, retain) IBOutlet UIButton *logoff;
@property (nonatomic, retain) IBOutlet UILabel *label;


@end
