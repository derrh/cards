//
//  CardGameLayout.m
//  cards
//
//  Created by derrick on 7/2/13.
//  Copyright (c) 2013 derrh. All rights reserved.
//

#import "CardGameLayout.h"
#import "CardCollectionLayoutHelper.h"
#import "CardLayoutDelegate.h"
#import "CardLayoutAttributes.h"

static const CGFloat HeightForCollection = 240;

@implementation CardGameLayout

+ (Class)layoutAttributesClass
{
    return [CardLayoutAttributes class];
}

- (void)prepareLayout
{
    
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *allLayoutAttributes = [NSMutableArray arrayWithCapacity:57];
    
    NSInteger sectionCount = [self.collectionView numberOfSections];
    CGFloat verticalCenter = self.collectionView.bounds.size.width / 2.f;
    for (NSInteger section = 0; section < sectionCount; ++ section) {
        CardCollectionLayoutHelper *helper = [(id<CardLayoutDelegate>)self.collectionView.delegate collectionView:self.collectionView layout:self layoutHelperForCardCollectionSection:section];
        helper.position = CGPointMake(verticalCenter, HeightForCollection / 2. + HeightForCollection * section);

        NSInteger cardCount = [self.collectionView numberOfItemsInSection:section];
        for (NSInteger card = 0; card < cardCount; ++card) {
            CardLayoutAttributes *attributes = [helper layoutAttributesForCardAtIndexPath:[NSIndexPath indexPathForItem:card inSection:section] ofNTotalCards:cardCount whileDraggingCardAtIndexPath:nil dragLocation:CGPointZero];
            if (attributes) {
                [allLayoutAttributes addObject:attributes];
            }
        }
    }
    return allLayoutAttributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CardCollectionLayoutHelper *helper = [(id<CardLayoutDelegate>)self.collectionView.delegate collectionView:self.collectionView layout:self layoutHelperForCardCollectionSection:indexPath.section];
    CGFloat verticalCenter = self.collectionView.bounds.size.width / 2.f;
    NSInteger cardCount = [self.collectionView numberOfItemsInSection:indexPath.section];
    
    helper.position = CGPointMake(verticalCenter, HeightForCollection / 2. + HeightForCollection * indexPath.section);

    return [helper layoutAttributesForCardAtIndexPath:indexPath ofNTotalCards:cardCount whileDraggingCardAtIndexPath:nil dragLocation:CGPointZero];
}

- (CGSize)collectionViewContentSize {
    return CGSizeMake(self.collectionView.bounds.size.width, [self.collectionView numberOfSections] * HeightForCollection);
}


- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return NO;
}

@end
