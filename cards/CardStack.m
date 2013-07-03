//
//  CardStack.m
//  cards
//
//  Created by derrick on 7/1/13.
//  Copyright (c) 2013 derrh. All rights reserved.
//

#import "CardStack.h"
#import "Card.h"
#import "MessyStackCardCollectionLayoutHelper.h"

@implementation CardStack

+ (void)addAllCardsForSuit:(CardSuit)suit toArray:(NSMutableArray *)cards
{
    for (NSUInteger face = 1; face <= 14; ++face)
    {
        [cards addObject:[[Card alloc] initWithFaceValue:face suit:suit]];
    }
}

+ (instancetype)shuffledDeck
{
    NSMutableArray *allCards = [NSMutableArray arrayWithCapacity:14*4+1];
    
    [self addAllCardsForSuit:CardSuitRed toArray:allCards];
    [self addAllCardsForSuit:CardSuitYellow toArray:allCards];
    [self addAllCardsForSuit:CardSuitGreen toArray:allCards];
    [self addAllCardsForSuit:CardSuitBlack toArray:allCards];
    [allCards addObject:[[Card alloc] initWithFaceValue:1 suit:CardSuitWild]];
    
    
    for (NSUInteger current = 0; current < [allCards count] - 1; ++current) {
        NSUInteger remainingCount = [allCards count] - (current + 1);
        NSUInteger randomLocation = (random() % remainingCount) + current + 1;
        Card *swap = allCards[current];
        allCards[current] = allCards[randomLocation];
        allCards[randomLocation] = swap;
    }
 
    CardStack *me = [[self alloc] init];
    [me pushCards:allCards];

    return me;
}


- (CardCollectionLayoutHelper *)layoutHelper
{
    MessyStackCardCollectionLayoutHelper *helper = [MessyStackCardCollectionLayoutHelper layout];
    helper.revealed = !self.isDrawPile;
    return helper;
}
@end
