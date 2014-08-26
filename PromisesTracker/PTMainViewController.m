//
//  PTMainViewController.m
//  PromisesTracker
//
//  Created by Morgan Collino on 07/12/2013.
//  Copyright (c) 2013 Morgan Collino. All rights reserved.
//

#import "PTMainViewController.h"
#import "PTResultsViewController.h"
#import "PTOfficial.h"
#import "AFHTTPRequestOperation.h"
#import "AFNetworking.h"
#import "MBProgressHUD.h"

@interface PTMainViewController ()

@end

@implementation PTMainViewController

@synthesize address, label, valider, logoff;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: animated];
    self.navigationController.navigationBar.hidden = YES;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) launchResearch:(id)sender
{
    // load then : ->
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo: self.view animated: YES];
    
    NSURL *url = [NSURL URLWithString:@"https://www.googleapis.com"];
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:url];
    
    [httpClient setParameterEncoding: AFJSONParameterEncoding];
    
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                            [address text], @"address",
                            nil];
    [httpClient postPath:@"/civicinfo/us_v1/representatives/lookup?key=AIzaSyBB06jdELs946Q5_lNYRnmWCquWPSHah0M&fields=officials" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSError* error;
         NSDictionary* json = [NSJSONSerialization
                               JSONObjectWithData: (NSData *)responseObject
        
                               options:kNilOptions
                               error:&error];
         
         NSMutableArray *a = [[NSMutableArray alloc] init];
         NSLog(@"ResponseObject: %@", json);

         if ([json isKindOfClass: [NSDictionary class]])
         {
             NSDictionary *off = [json objectForKey: @"officials"];
             NSLog(@"Off: %@", off);
             NSArray *keys = [off allKeys];
             
             for (id key in keys)
             {
                 NSDictionary *res = [off objectForKey: key];
                 PTOfficial *officials = [[PTOfficial alloc] initWithDictionary: res];
                 [a addObject: officials];
             }
         }
         
         hud.hidden = YES;
         
         PTResultsViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"PTResultsViewController"];
         controller.results = a;
         [self.navigationController pushViewController:controller animated: YES];
     }
                 failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                     NSLog(@"[HTTPClient Error]: %@", error.localizedDescription);
                     NSLog(@"Error : %@", error.description);
                     hud.hidden = YES;

                 }];

    
}
- (IBAction) logOff:(id)sender
{
    [self.navigationController popViewControllerAnimated: YES];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
