//
//  Car.h
//  Nullability
//
//  Created by TJ Usiyan on 2016/13/09.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject

@property (nonnull, nonatomic, copy) NSString *make;
@property (nullable, nonatomic, copy) NSString *owner;

- (instancetype _Nullable)initWithMake:( NSString * _Nonnull )make
                       owner:( NSString * _Nullable )owner NS_DESIGNATED_INITIALIZER;

@end
