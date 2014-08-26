//
//  PTOfficial.m
//  PromisesTracker
//
//  Created by Morgan Collino on 08/12/2013.
//  Copyright (c) 2013 Morgan Collino. All rights reserved.
//

#import "PTOfficial.h"
#import "XTTry.h"

@implementation PTOfficial

@synthesize description, graphURL, imageURL, position, promise, rank, channel, city,line1, name, party, phone, state, zip;

- (id) initWithDictionary: (NSDictionary *) dic
{
    if (self = [super init])
    {
        // parsing
        name = [XTTry tryGettingString: dic forKey: @"name"];
        NSLog(@"Value: %@, class: %@", [dic objectForKey: @"party"], [[dic objectForKey: @"party"] class]);

        party = [XTTry tryGettingString: dic forKey: @"party" defaultValue: @"Unknown party"];
        if ([[XTTry tryGettingArray: dic forKey: @"phones"] count] > 0)
            phone = [[XTTry tryGettingArray: dic forKey: @"phones"] objectAtIndex: 0];
        else
            phone = @"";
        
        NSLog(@"IMAGE: %@, class: %@",[XTTry tryGettingString: dic forKey: @"photoUrl"], [[XTTry tryGettingString: dic forKey: @"photoUrl"] class]);

        imageURL = [XTTry tryGettingString: dic forKey: @"photoUrl"];
        channel = [XTTry tryGettingArray: dic forKey: @"channels"];
        
        NSArray *address = [XTTry tryGettingArray: dic forKey: @"address"];
        if ([address count] > 0)
        {
            NSDictionary *d = [address objectAtIndex: 0];
            line1 = [XTTry tryGettingString: d forKey: @"line1"];
            city = [XTTry tryGettingString: d forKey: @"city"];
            state = [XTTry tryGettingString: d forKey: @"state"];
            zip = [XTTry tryGettingString: d forKey: @"zip"];
        }
    }
    return  self;
}

@end
