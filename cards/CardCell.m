//
//  CardCell.m
//  cards
//
//  Created by derrick on 7/1/13.
//  Copyright (c) 2013 derrh. All rights reserved.
//

#import "CardCell.h"
#import "Card.h"
#import "CardLayoutAttributes.h"

#import <QuartzCore/QuartzCore.h>

@interface CardCell ()
@property (nonatomic) IBOutlet UIView *backView;
@property (nonatomic) IBOutlet UIView *fardFaceView;
@property (nonatomic) IBOutlet UILabel *bigNumberLabel;
@property (nonatomic) IBOutlet UILabel *littleNumberLabel;
@end

@implementation CardCell

- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.fardFaceView.layer.doubleSided = NO;
    self.fardFaceView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.fardFaceView.layer.borderWidth = .5f;
    self.backView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"back_patter.png"]];
    self.backView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.backView.layer.borderWidth = .5f;

    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
    self.layer.shouldRasterize = YES;
}

- (void)setCard:(Card *)card
{
    self.fardFaceView.backgroundColor = [card suitColor];
    if (card.suit == CardSuitWild) {
        self.littleNumberLabel.text = self.bigNumberLabel.text = @"W";
    } else {
        self.littleNumberLabel.text = self.bigNumberLabel.text = [NSString stringWithFormat:@"%u", card.faceValue];
    }
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
    [super applyLayoutAttributes:layoutAttributes];

    BOOL shown = ((CardLayoutAttributes *)layoutAttributes).revealed;
    self.fardFaceView.hidden = !shown;
    self.backView.hidden = shown;
}

@end
