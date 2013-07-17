//
//  DHMessyStackCollectionLayout.m
//  DHCards
//
//  Created by Derrick Hathaway on 7/25/12.
//  Copyright (c) 2012 Derrick J. Hathaway. All rights reserved.
//

#import "MessyStackCardCollectionLayoutHelper.h"
#import "CardLayoutAttributes.h"

@implementation MessyStackCardCollectionLayoutHelper

- (CardLayoutAttributes *)layoutAttributesForCardAtIndexPath:(NSIndexPath *)index ofNTotalCards:(NSInteger)n whileDraggingCardAtIndexPath:(NSIndexPath *)indexPath dragLocation:(CGPoint)p
{
  if (n > 5 && index.item < (n - 5))
  {
    return nil;
  }
  
  CardLayoutAttributes *cardLayout = [CardLayoutAttributes layoutAttributesForCellWithIndexPath:index];
    CGSize cardSize = CGSizeMake(96, 140);
  CGPoint disheveledness = CGPointMake((rand()%2001/100.f) - 10.f, (rand()%2001/100.f) - 10.f);
    cardLayout.size = cardSize;
    cardLayout.center = CGPointMake(self.position.x + disheveledness.x, self.position.y + disheveledness.y);
  cardLayout.transform3D = CATransform3DMakeRotation((rand()%51)/100.f - 0.25f, 0.f, 0.f, 1.f);
  cardLayout.zIndex = index.item;
  cardLayout.revealed = self.isRevealed;
    cardLayout.zIndex = index.item;

    return cardLayout;
}

@end
