//
//  CardLayoutAttributes.m
//  cards
//
//  Created by derrick on 7/2/13.
//  Copyright (c) 2013 derrh. All rights reserved.
//

#import "CardLayoutAttributes.h"

@implementation CardLayoutAttributes

- (id)copyWithZone:(NSZone *)zone
{
    CardLayoutAttributes *attributes = [super copyWithZone:zone];
    attributes.revealed = self.revealed;
    return attributes;
}

@end
