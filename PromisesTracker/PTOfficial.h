//
//  PTOfficial.h
//  PromisesTracker
//
//  Created by Morgan Collino on 08/12/2013.
//  Copyright (c) 2013 Morgan Collino. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PTOfficial : NSObject
{
    NSString *name, *party, *city, *state, *zip, *line1, *phone, *position, *imageURL, *description, *promise, *graphURL;
    NSArray *channel;
    NSNumber *rank;
}

@property (nonatomic, copy) NSString *position;
@property (nonatomic, copy) NSString *imageURL;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *party;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *state;
@property (nonatomic, copy) NSString *zip;
@property (nonatomic, copy) NSString *line1;
@property (nonatomic, copy) NSString *phone;

@property (nonatomic, copy) NSArray *channel;

@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) NSString *graphURL;
@property (nonatomic, copy) NSString *promise;
@property (nonatomic, copy) NSNumber *rank;


- (id) initWithDictionary: (NSDictionary *) dic;

@end
