//
//  CardMatchingGame.m
//  Machismo
//
//  Created by Robert Hannah on 2/2/13.
//  Copyright (c) 2013 Llanfar Studios. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic) NSMutableArray *cards;
@property (nonatomic) int matchCount;
@property (nonatomic) int matchScore;
@end

@implementation CardMatchingGame
- (NSMutableArray *) cards {
	if (!_cards) {
		_cards = [[NSMutableArray alloc] init];
	}
	return _cards;
}

- (void)shuffle:(Deck *) deck
  withCardCount:(NSUInteger) cardCount
 withMatchCount:(NSUInteger) matchCount {
	self.cards = nil;
	self.playResult = nil;
	self.matchScore = 0;
	self.matchCount = matchCount;
	for (int index = 0; index < cardCount; index++) {
		Card *card = [deck drawRandomCard];
		if (card) {
			card.playable = YES;
			self.cards[index] = card;
		}
	}	
}

- (id)initWithCardCount:(NSUInteger) cardCount
			  usingDeck:(Deck *) deck {
	self = [super init];
	if (self) {
		[self shuffle:deck withCardCount:cardCount withMatchCount:2];
	}
	return self;
}

#define FLIP_COST 1
#define MISMATCH_PENALTY 2
#define MATCH_BONUS 4

- (void)flipCardAtIndex:(NSUInteger) index {
	if (index < self.cards.count) {
		Card *card = self.cards[index];
		self.playResult = @"";

		if (card.isPlayable) {
			self.matchScore -= FLIP_COST;
			if (!card.isFaceUp) {
				NSMutableArray *otherCards = [[NSMutableArray alloc] init];
				for (Card *otherCard in self.cards) {
					if (otherCard.isFaceUp && otherCard.isPlayable) {
						[otherCards addObject:otherCard];
					}
				}

				if (otherCards.count < self.matchCount - 1) {
					self.playResult = [@"Flipped up " stringByAppendingString:card.contents];
				} else {
					int matchScore = [card match:otherCards];
					NSString *text = [[NSString alloc] init];
					for (Card *otherCard in otherCards) {
						text = [text stringByAppendingFormat:@"%@, ", otherCard.contents];
					}
					text = [text substringToIndex:text.length - 2];
					if (matchScore == 0) {
						self.matchScore -= MISMATCH_PENALTY;
						self.playResult = [NSString stringWithFormat:@"%@ and %@ don't match! %d point penalty!",
										   text, card.contents, MISMATCH_PENALTY];
						for (Card *otherCard in otherCards) {
							otherCard.faceUp = NO;
						}
					} else {
						self.matchScore += matchScore * MATCH_BONUS;
						self.playResult = [NSString stringWithFormat:@"Matched %@ and %@ for %d points",
										   text, card.contents, matchScore * MATCH_BONUS];
						card.playable = NO;
						for (Card *otherCard in otherCards) {
							otherCard.playable = NO;
						}
					}
				}
			}
			card.faceUp = !card.isFaceUp;
		}
	}
}

- (Card *)cardAtIndex:(NSUInteger) index {
	if (index < self.cards.count) {
		return self.cards[index];
	}
	return nil;
}

- (int)score {
	return self.matchScore;
}
@end
