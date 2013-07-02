//
//  Card.m
//  cards
//
//  Created by derrick on 7/1/13.
//  Copyright (c) 2013 derrh. All rights reserved.
//

#import "Card.h"

@interface Card ()
@property (nonatomic) NSUInteger faceValue;
@property (nonatomic) CardSuit suit;
@end

@implementation Card

- (id)initWithFaceValue:(NSUInteger)face suit:(CardSuit)suit
{
    self = [super init];
    if (self) {
        self.faceValue = MAX(1, MIN(14, face));
        self.suit = suit;
    }
    
    return self;
}

- (UIColor *)suitColor
{
    switch (self.suit) {
        case CardSuitRed:
            return [UIColor colorWithRed:1.0 green:0.23137254901961 blue:0.18823529411765 alpha:1.0];
        case CardSuitGreen:
            return [UIColor colorWithRed:76.0/255.0 green:217/255.0 blue:100/255.0 alpha:1.0];
        case CardSuitYellow:
            return [UIColor colorWithRed:1.0 green:204/255.0 blue:0 alpha:1.0];
        case CardSuitBlack:
            return [UIColor colorWithRed:142/255.0 green:142/255.0 blue:147/255.0 alpha:1.0];
        case CardSuitWild:
            return [UIColor colorWithRed:0 green:122/255.0 blue:1.0 alpha:1.0];
        default:
            break;
    }
    
    return [UIColor orangeColor];
}

@end
