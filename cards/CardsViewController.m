//
//  CardsViewController.m
//  cards
//
//  Created by derrick on 7/1/13.
//  Copyright (c) 2013 derrh. All rights reserved.
//

#import "CardsViewController.h"
#import "CardCollection.h"
#import "Card.h"
#import "CardCell.h"
#import "CardStack.h"
#import "CardHand.h"
#import "HeaderView.h"
#import "CardLayoutDelegate.h"
#import "CardGameLayout.h"

@interface CardsViewController () <CardLayoutDelegate>
@property (nonatomic) NSArray *collections;
@end

@implementation CardsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIView *background = [[UIView alloc] init];
    background.backgroundColor = [UIColor whiteColor];
    self.collectionView.backgroundView = background;

    CardStack *drawPile = [CardStack shuffledDeck];
    drawPile.isDrawPile = YES;
    CardStack *discardPile = [[CardStack alloc] init];
    
    NSArray *players = @[[[CardHand alloc] init],
                         [[CardHand alloc] init],
                         [[CardHand alloc] init],
                         [[CardHand alloc] init]];
    
    NSInteger playerIndex = 1;
    for (CardHand *hand in players) {
        hand.me = playerIndex == 1;
        hand.playerName = [NSString stringWithFormat:@"Player %d", playerIndex++];
    }
    
    for (NSInteger cardCount = 0; cardCount < 5; ++cardCount) {
        for (CardHand *hand in players) {
            [hand pushCard:[drawPile popCard]];
        }
    }
    
    [discardPile pushCard:[drawPile popCard]];
    
    self.collections = [players arrayByAddingObjectsFromArray:@[drawPile, discardPile]];
}

#pragma mark - Actions

- (IBAction)toggleLayouts:(id)sender {
    if ([self.collectionView.collectionViewLayout isKindOfClass:[UICollectionViewFlowLayout class]]) {
        self.collectionView.collectionViewLayout = [[CardGameLayout alloc] init];
    }
}



#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [self.collections count];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    CardCollection *collection = self.collections[section];
    return [collection.cards count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellReuseId = @"CardCell";
    CardCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellReuseId forIndexPath:indexPath];
    
    CardCollection *collection = self.collections[indexPath.section];
    Card *card = collection.cards[indexPath.row];
    
    cell.card = card;
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    HeaderView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
    
    CardCollection *collection = self.collections[indexPath.section];
    
    if ([collection isKindOfClass:[CardHand class]]) {
        header.titleLabel.text = [(CardHand *)collection playerName];
    } else if ([collection isKindOfClass:[CardStack class]]) {
        header.titleLabel.text = ([(CardStack *)collection isDrawPile]) ? @"Draw Pile" : @"Discard Pile";
    }
    return header;
}

- (BOOL)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)cardLayout cardIsRevealedAtIndexPath:(NSIndexPath *)indexPath
{
    CardCollection *collection = self.collections[indexPath.section];
    if ([collection isKindOfClass:[CardHand class]]) {
        return [(CardHand *)collection isMe];
    } else if ([collection isKindOfClass:[CardStack class]]) {
        return ![(CardStack *)collection isDrawPile];
    }
    return NO;
}

- (CardCollectionLayoutHelper *)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)cardLayout layoutHelperForCardCollectionSection:(NSInteger)section
{
    CardCollection *collection = self.collections[section];
    return [collection layoutHelper];
}

@end
