//
//  CardGame.m
//  Machismo
//
//  Created by Robert Hannah on 2/15/13.
//  Copyright (c) 2013 Llanfar Studios. All rights reserved.
//

#import "CardGame.h"

@interface CardGame()
@end

@implementation CardGame
- (NSString *)playResult {
	if (!_playResult) {
		_playResult = @"";
	}
	return _playResult;
}

- (id)initWithCardCount:(NSUInteger) cardCount
			  usingDeck:(Deck *) deck {
	return nil;
}

- (void)flipCardAtIndex:(NSUInteger) index {
	// override me
}

- (Card *)cardAtIndex:(NSUInteger) index {
	return nil;
}

- (void)shuffle:(Deck *) deck withCardCount:(NSUInteger) cardCount
 withMatchCount:(NSUInteger) matchCount {
	// override me
}
@end
