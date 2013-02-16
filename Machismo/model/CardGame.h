//
//  CardGame.h
//  Machismo
//
//  Created by Robert Hannah on 2/15/13.
//  Copyright (c) 2013 Llanfar Studios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardGame : NSObject
- (id)initWithCardCount:(NSUInteger) cardCount
			  usingDeck:(Deck *) deck;

- (void)flipCardAtIndex:(NSUInteger) index;

- (Card *)cardAtIndex:(NSUInteger) index;

- (void)shuffle:(Deck *) deck withCardCount:(NSUInteger) cardCount withMatchCount:(NSUInteger) matchCount;

@property (nonatomic) int score;
@property (nonatomic) NSString *playResult;

@end
