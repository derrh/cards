//
//  CardLayoutDelegate.h
//  cards
//
//  Created by derrick on 7/2/13.
//  Copyright (c) 2013 derrh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CardCollectionLayoutHelper;
@protocol CardLayoutDelegate <UICollectionViewDelegate>
- (BOOL)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)cardLayout isCardRevealedAtIndexPath:(NSIndexPath *)indexPath;
- (CardCollectionLayoutHelper *)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)cardLayout layoutHelperForCardCollectionSection:(NSInteger)section;
@end
