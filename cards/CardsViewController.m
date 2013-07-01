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

@interface CardsViewController ()
@property (nonatomic) NSArray *collections;
@end

@implementation CardsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIView *background = [[UIView alloc] init];
    background.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"retina_wood.png"]];
    self.collectionView.backgroundView = background;

    CardStack *drawPile = [CardStack shuffledDeck];
    CardStack *discardPile = [[CardStack alloc] init];
    
    NSArray *players = @[[[CardHand alloc] init],
                         [[CardHand alloc] init],
                         [[CardHand alloc] init],
                         [[CardHand alloc] init]];
    
    for (NSInteger cardCount = 0; cardCount < 5; ++cardCount) {
        for (CardHand *hand in players) {
            [hand pushCard:[drawPile popCard]];
        }
    }
    
    [discardPile pushCard:[drawPile popCard]];
    
    self.collections = [players arrayByAddingObjectsFromArray:@[drawPile, discardPile]];
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



@end
