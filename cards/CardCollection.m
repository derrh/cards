//
//  CardCollection.m
//  cards
//
//  Created by derrick on 7/1/13.
//  Copyright (c) 2013 derrh. All rights reserved.
//

#import "CardCollection.h"

@interface CardCollection ()
@end

@implementation CardCollection {
    NSMutableArray *_cards;
}

- (id)init
{
    self = [super init];
    if (self) {
        _cards = [NSMutableArray array];
    }
    return self;
}

- (void)pushCard:(Card *)card
{
    [_cards addObject:card];
}

- (void)pushCards:(NSArray *)cards
{
    [_cards addObjectsFromArray:cards];
}

- (Card *)popCard
{
    Card *c = [self.cards lastObject];
    [_cards removeLastObject];
    
    return c;
}


- (CardCollectionLayoutHelper *)layoutHelper
{
    return [CardCollectionLayoutHelper layout];
}

@end
