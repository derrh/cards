//
//  DHCollectionLayout.h
//  DHCards
//
//  Created by Derrick Hathaway on 7/14/12.
//  Copyright (c) 2012 Derrick J. Hathaway. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CardLayoutAttributes;

@interface CardCollectionLayoutHelper : NSObject
@property (nonatomic, assign) CGPoint position;
@property (nonatomic, assign, getter = isRevealed) BOOL revealed;

+ (instancetype)layout;
- (CardLayoutAttributes *)layoutAttributesForCardAtIndexPath:(NSIndexPath *)index
                                                 ofNTotalCards:(NSInteger)n
                                  whileDraggingCardAtIndexPath:(NSIndexPath *)indexPath
                                                  dragLocation:(CGPoint)p;

@end
