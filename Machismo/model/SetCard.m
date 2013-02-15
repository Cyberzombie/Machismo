//
//  SetCard.m
//  Machismo
//
//  Created by Robert Hannah on 2/10/13.
//  Copyright (c) 2013 Llanfar Studios. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

- (NSString *) contents {
	NSArray *ranks = [self.class rankStrings];
	NSString *result = [ranks[self.rank] stringByAppendingString:self.suit];
	return result;
}

+ (NSArray *) symbolStrings {
	return @[@"?",@""];
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
