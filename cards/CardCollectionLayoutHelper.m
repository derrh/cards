//
//  DHCollectionLayout.m
//  DHCards
//
//  Created by Derrick Hathaway on 7/14/12.
//  Copyright (c) 2012 Derrick J. Hathaway. All rights reserved.
//

#import "CardCollectionLayoutHelper.h"
#import "CardLayoutAttributes.h"

@implementation CardCollectionLayoutHelper
@synthesize position, revealed;

+ (instancetype)layout
{
  CardCollectionLayoutHelper *layout = [[self alloc] init];
  layout.position = CGPointZero;
  return layout;
}

- (CardLayoutAttributes *)layoutAttributesForCardAtIndexPath:(NSIndexPath *)index
                                                 ofNTotalCards:(NSInteger)n
                                  whileDraggingCardAtIndexPath:(NSIndexPath *)indexPath
                                                  dragLocation:(CGPoint)p
{
    
    // should not be called this class is ABSTRACT!
    [self doesNotRecognizeSelector:_cmd];
  return nil;
}

@end
