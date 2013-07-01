//
//  CardCell.m
//  cards
//
//  Created by derrick on 7/1/13.
//  Copyright (c) 2013 derrh. All rights reserved.
//

#import "CardCell.h"
#import "Card.h"

@interface CardCell ()
@property (nonatomic) IBOutlet UIView *fardFaceView;
@property (nonatomic) IBOutlet UILabel *bigNumberLabel;
@property (nonatomic) IBOutlet UILabel *littleNumberLabel;
@end

@implementation CardCell

- (void)setCard:(Card *)card
{
    self.fardFaceView.backgroundColor = [card suitColor];
    if (card.suit == CardSuitWild) {
        self.littleNumberLabel.text = self.bigNumberLabel.text = @"W";
    } else {
        self.littleNumberLabel.text = self.bigNumberLabel.text = [NSString stringWithFormat:@"%u", card.faceValue];
    }
}

@end
