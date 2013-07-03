//
//  DHPlayersHandCollectionLayout.m
//  DHCards
//
//  Created by Derrick Hathaway on 10/30/12.
//  Copyright (c) 2012 Derrick J. Hathaway. All rights reserved.
//

#import "PlayersHandCardCollectionLayoutHelper.h"
#import "CardLayoutAttributes.h"

@implementation PlayersHandCardCollectionLayoutHelper
- (CardLayoutAttributes *)layoutAttributesForCardAtIndexPath:(NSIndexPath *)index ofNTotalCards:(NSInteger)n whileDraggingCardAtIndexPath:(NSIndexPath *)indexPath dragLocation:(CGPoint)p
{
  CardLayoutAttributes *attributes = [self layoutAttributesForCardAtIndexPath:index ofNTotalCards:n withScaleFactor:1.f];
  attributes.revealed = YES;
  return attributes;
}
@end
