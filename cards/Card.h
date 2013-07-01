//
//  Card.h
//  cards
//
//  Created by derrick on 7/1/13.
//  Copyright (c) 2013 derrh. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, CardSuit) {
    CardSuitRed,
    CardSuitGreen,
    CardSuitYellow,
    CardSuitBlack,
    CardSuitWild
};

@interface Card : NSObject

- (id)initWithFaceValue:(NSUInteger)face suit:(CardSuit)suit;

@property (nonatomic, readonly) NSUInteger faceValue;
@property (nonatomic, readonly) CardSuit suit;

@property (nonatomic, readonly) UIColor *suitColor;

@end
