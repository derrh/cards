//
//  CardHand.h
//  cards
//
//  Created by derrick on 7/1/13.
//  Copyright (c) 2013 derrh. All rights reserved.
//

#import "CardCollection.h"

@interface CardHand : CardCollection
@property (nonatomic) NSString *playerName;
@property (nonatomic, getter = isMe) BOOL me;
@end
