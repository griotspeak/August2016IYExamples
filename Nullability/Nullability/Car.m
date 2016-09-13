//
//  Car.m
//  Nullability
//
//  Created by TJ Usiyan on 2016/13/09.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

#import "Car.h"

@implementation Car

- (instancetype)init {
    return [self initWithMake:(id _Nonnull)nil
                        owner:nil];
}

- (instancetype)initWithMake:( NSString * _Nonnull )make
                       owner:( NSString * _Nullable )owner {
    if (make == nil) {
        return nil;
    }

    self = [super init];
    if (self) {
        _make = make;
        _owner = owner;
    }
    return self;
}

@end
