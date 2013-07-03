//
//  CardHand.m
//  cards
//
//  Created by derrick on 7/1/13.
//  Copyright (c) 2013 derrh. All rights reserved.
//

#import "CardHand.h"
#import "PlayersHandCardCollectionLayoutHelper.h"

@implementation CardHand

- (CardCollectionLayoutHelper *)layoutHelper
{
    if (self.isMe) {
        return [PlayersHandCardCollectionLayoutHelper layout];
    } else {
        return [FanCardCollectionLayoutHelper layout];
    }
}

@end
