//
//  CardCollection.h
//  cards
//
//  Created by derrick on 7/1/13.
//  Copyright (c) 2013 derrh. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Card;
@interface CardCollection : NSObject
@property (nonatomic, readonly) NSArray *cards;

- (void)pushCard:(Card *)card;
- (void)pushCards:(NSArray *)cards;
- (Card *)popCard;
@end
