//
//  PTOfficialViewController.m
//  PromisesTracker
//
//  Created by Morgan Collino on 07/12/2013.
//  Copyright (c) 2013 Morgan Collino. All rights reserved.
//

#import "PTOfficialViewController.h"
#import "PTDetailOfficialViewController.h"
#import "UIImageView+AFNetworking.h"
#import "PTOfficial.h"

@interface PTOfficialViewController ()

@end

@implementation PTOfficialViewController

@synthesize label, imageView, info, isFulfill, official;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = [official name];
    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemAction target:self  action: @selector(showInfo:)];
    
    self.navigationItem.rightBarButtonItem = btn;
    NSLog(@"IMAGE: %@", official.imageURL);
    
    [imageView setImageWithURL: [NSURL URLWithString: official.imageURL]];
    label.text = [official name];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showInfo:(id)sender
{
    PTDetailOfficialViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"PTDetailOfficialViewController"];
    
    controller.official = official;
    
    [self.navigationController pushViewController:controller animated: YES];
}

@end
