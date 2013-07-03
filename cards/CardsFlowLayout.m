//
//  CardsFlowLayout.m
//  cards
//
//  Created by derrick on 7/2/13.
//  Copyright (c) 2013 derrh. All rights reserved.
//

#import "CardsFlowLayout.h"
#import "CardLayoutAttributes.h"
#import "CardLayoutDelegate.h"

@implementation CardsFlowLayout

+ (Class)layoutAttributesClass
{
    return [CardLayoutAttributes class];
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *allAttributes = [super layoutAttributesForElementsInRect:rect];
    for (CardLayoutAttributes *attributes in allAttributes) {
        if ([attributes isKindOfClass:[CardLayoutAttributes class]]) {
            attributes.revealed = [((id<CardLayoutDelegate>)self.collectionView.delegate) collectionView:self.collectionView layout:self cardIsRevealedAtIndexPath:attributes.indexPath];
        }
    }
    
    return allAttributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CardLayoutAttributes *attributes = (CardLayoutAttributes *)[super layoutAttributesForItemAtIndexPath:indexPath];
    if ([attributes isKindOfClass:[CardLayoutAttributes class]]) {
        attributes.revealed = [((id<CardLayoutDelegate>)self.collectionView.delegate) collectionView:self.collectionView layout:self cardIsRevealedAtIndexPath:attributes.indexPath];
    }
    return attributes;
}

@end
