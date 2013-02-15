//
//  CardMatchingGame.h
//  Machismo
//
//  Created by Robert Hannah on 2/2/13.
//  Copyright (c) 2013 Llanfar Studios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject
- (id)initWithCardCount:(NSUInteger) cardCount
			  usingDeck:(Deck *) deck;

- (void)flipCardAtIndex:(NSUInteger) index;

- (Card *)cardAtIndex:(NSUInteger) index;

- (void)shuffle:(Deck *) deck withCardCount:(NSUInteger) cardCount withMatchCount:(NSUInteger) matchCount;

@property (nonatomic,readonly) int score;
@property (nonatomic,readonly) NSString *playResult;
@end
