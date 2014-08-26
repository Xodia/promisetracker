//
//  PTDetailOfficialViewController.m
//  PromisesTracker
//
//  Created by Morgan Collino on 07/12/2013.
//  Copyright (c) 2013 Morgan Collino. All rights reserved.
//

#import "PTDetailOfficialViewController.h"
#import "PTOfficial.h"
#import "UIImageView+AFNetworking.h"
#import "XTTry.h"

@interface PTDetailOfficialViewController ()

@end

@implementation PTDetailOfficialViewController

@synthesize party, imageView, city, description, line, partyImage, official, phone, social, graphImage;

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
    self.navigationController.navigationBar.opaque = YES;
    self.title = official.name;
    
    party.text = [official party];
    city.text = [NSString stringWithFormat: @"%@,%@", [official.city capitalizedString], official.state];
    line.text = [official line1];
    [phone setTitle: official.phone forState: UIControlStateNormal];
    [partyImage setImageWithURL: [NSURL URLWithString: official.imageURL]];
	// Do any additional setup after loading the view.
    
    if (![official.name isEqualToString: @"Eric Garcetti"])
    {
        graphImage.hidden = YES;
        description.text = @"Working on it :)";
    }
    else
        party.text = @"Democrat";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) callMember:(id)sender
{
    NSString *phonee = [official phone];
    phonee = [phonee stringByReplacingOccurrencesOfString: @"(" withString: @""];
    phonee = [phonee stringByReplacingOccurrencesOfString: @")" withString: @""];
    phonee = [phonee stringByReplacingOccurrencesOfString: @"-" withString: @""];
    phonee = [phonee stringByReplacingOccurrencesOfString: @" " withString: @""];
    
    NSURL *telURL = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", phonee]];
        UIApplication *myApp = [UIApplication sharedApplication];
    [myApp openURL: telURL];
}

- (IBAction) showSocial:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Social medias"
                                                    message:@""
                                                   delegate:self
                                          cancelButtonTitle:@"Return"
                                          otherButtonTitles: nil];
    NSArray *d = [official channel];
    for (NSDictionary *dic in d)
    {
        [alert addButtonWithTitle: [XTTry tryGettingString: dic forKey: @"type"]];
    }
    [alert show];
}


- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        return;
    }
    NSDictionary *d = [[official channel] objectAtIndex: buttonIndex - 1];

    if ([[XTTry tryGettingString: d forKey: @"type"] isEqualToString: @"Twitter"])
    {
        NSString *url = [NSString stringWithFormat: @"https://twitter.com/%@", [XTTry tryGettingString: d forKey: @"id"]];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
    }
    if ([[XTTry tryGettingString: d forKey: @"type"] isEqualToString: @"Facebook"])
    {
        NSString *url = [NSString stringWithFormat: @"https://www.facebook.com/%@", [XTTry tryGettingString: d forKey: @"id"]];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
    }
    if ([[XTTry tryGettingString: d forKey: @"type"] isEqualToString: @"YouTube"])
    {
        NSString *url = [NSString stringWithFormat: @"http://www.youtube.com/user/%@", [XTTry tryGettingString: d forKey: @"id"]];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
    }
}

@end
