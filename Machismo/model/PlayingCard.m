//
//  PlayingCard.m
//  Machismo
//
//  Created by Robert Hannah on 2/2/13.
//  Copyright (c) 2013 Llanfar Studios. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard
@synthesize suit = _suit;

- (NSString *)suit {
	if (!_suit) {
		_suit = @"?";
	}
	return _suit;
}

- (void)setSuit:(NSString *)suit {
	if ([[self.class validSuits] containsObject:suit]) {
		_suit = suit;
	}
}

- (void)setRank:(NSInteger)rank {
	if (rank > 0 && rank <= [self.class maxRank]) {
		_rank = rank;
	}
}

+ (NSArray *) validSuits {
	return @[@"♣",@"♦",@"♥",@"♠"];
}

- (NSString *) contents {
	NSArray *ranks = [self.class rankStrings];
	NSString *result = [ranks[self.rank] stringByAppendingString:self.suit];
	return result;
}

+ (NSArray *) rankStrings {
	return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSInteger) maxRank {
	return [self.class rankStrings].count - 1;
}

#define SUIT_MATCH 1
#define RANK_MATCH 4

-(int) match:(NSArray *)otherCards {
	int score = 0;
	bool isRankMatch = YES;
	bool isSuitMatch = YES;
	for (PlayingCard *otherCard in otherCards) {
		if (isRankMatch && self.rank == otherCard.rank) {
			isSuitMatch = NO;
			score += RANK_MATCH;
		} else if (isSuitMatch && self.suit == otherCard.suit) {
			isRankMatch = NO;
			score += SUIT_MATCH;
		} else {
			score = 0;
			break;
		}
	}
	return score;
}
@end
