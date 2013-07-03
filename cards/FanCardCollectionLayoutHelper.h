//
//  DHFanCollectionLayout.h
//  DHCards
//
//  Created by Derrick Hathaway on 7/25/12.
//  Copyright (c) 2012 Derrick J. Hathaway. All rights reserved.
//

#import "CardCollectionLayoutHelper.h"

@interface FanCardCollectionLayoutHelper : CardCollectionLayoutHelper
- (CardLayoutAttributes *)layoutAttributesForCardAtIndexPath:(NSIndexPath *)index ofNTotalCards:(NSInteger)n withScaleFactor:(CGFloat)scaleFactor;
@end
