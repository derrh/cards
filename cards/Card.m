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
            return [UIColor redColor];
        case CardSuitGreen:
            return [UIColor greenColor];
        case CardSuitYellow:
            return [UIColor yellowColor];
        case CardSuitBlack:
            return [UIColor blackColor];
        case CardSuitWild:
            return [UIColor blueColor];
        default:
            break;
    }
    
    return [UIColor orangeColor];
}

@end
