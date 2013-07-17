//
//  ParallaxLayout.m
//  cards
//
//  Created by derrick on 7/16/13.
//  Copyright (c) 2013 derrh. All rights reserved.
//

#import "ParallaxLayout.h"
#import "CardLayoutAttributes.h"
#import "CardLayoutDelegate.h"

CGFloat randPlusOrMinusPoint5() {
    return (rand() % 1001) / 1000.0 - 0.5;
}

@interface ParallaxLayout ()
@property (nonatomic) NSMutableDictionary *cachedAttributes;
@end

@implementation ParallaxLayout

+ (Class)layoutAttributesClass
{
    return [CardLayoutAttributes class];
}

- (void)prepareLayout
{
    if (self.cachedAttributes) {
        return;
    }
    
    NSMutableDictionary *cache = [NSMutableDictionary dictionary];
    
    for (NSInteger section = 0; section < [self.collectionView numberOfSections]; ++section) {
        for (NSInteger item = 0; item < [self.collectionView numberOfItemsInSection:section]; ++item) {
            NSIndexPath *path = [NSIndexPath indexPathForItem:item inSection:section];
            
            CardLayoutAttributes *attributes = [CardLayoutAttributes layoutAttributesForCellWithIndexPath:path];
            
            attributes.center = CGPointMake(randPlusOrMinusPoint5(), randPlusOrMinusPoint5());
            attributes.zIndex = (randPlusOrMinusPoint5()) * 1000.0 + 0.5;
            attributes.size = CGSizeMake(192, 280.);
            attributes.alpha = M_PI_2 * randPlusOrMinusPoint5();
            
            cache[path] = attributes;
        }
    }
    self.cachedAttributes = cache;
}

- (CardLayoutAttributes *)layoutAttributesForNormalizeAttributes:(CardLayoutAttributes *)normalized inBounds:(CGRect)currentBounds;
{
    CGPoint center = normalized.center;
    CGSize contentSize = [self collectionViewContentSize];
    center.x *= contentSize.width;
    center.y *= contentSize.height;
    
    CardLayoutAttributes *attributes = [CardLayoutAttributes layoutAttributesForCellWithIndexPath:normalized.indexPath];
    
    // perspective transform
    CATransform3D tx = CATransform3DIdentity;
    tx.m34 = -1/1000.0;
    tx = CATransform3DTranslate(tx, center.x-currentBounds.origin.x + currentBounds.size.width/2.f, center.y-currentBounds.origin.y + currentBounds.size.height/2.f, normalized.zIndex);
    // using 1. 1. 0 as the rotation axis I think this get's normalized??
    tx = CATransform3DRotate(tx, normalized.alpha, 1., 1., 0);
    attributes.transform3D = tx;
    attributes.center = CGPointMake(CGRectGetMidX(currentBounds), CGRectGetMidY(currentBounds));
    attributes.size = normalized.size;
 
    attributes.revealed = [(id<CardLayoutDelegate>)self.collectionView.delegate collectionView:self.collectionView layout:self isCardRevealedAtIndexPath:attributes.indexPath];
    

    return attributes;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *all = [NSMutableArray arrayWithCapacity:[self.cachedAttributes count]];
    CGRect bounds = self.collectionView.bounds;
    
    for (CardLayoutAttributes *normalized in self.cachedAttributes.allValues) {
        [all addObject:[self layoutAttributesForNormalizeAttributes:normalized inBounds:bounds]];
    }
    
    return all;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [self layoutAttributesForNormalizeAttributes:self.cachedAttributes[indexPath] inBounds:self.collectionView.bounds];
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

- (CGSize)collectionViewContentSize
{
    CGSize boundSize = self.collectionView.bounds.size;
    boundSize.width *= 2;
    boundSize.height *= 2;
    return boundSize;
}

@end
