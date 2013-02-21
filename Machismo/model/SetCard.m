//
//  SetCard.m
//  Machismo
//
//  Created by Robert Hannah on 2/10/13.
//  Copyright (c) 2013 Llanfar Studios. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard
@synthesize symbol = _symbol;

- (NSString *) contents {
	NSString *contents = @"";
	for (int count = 0; count < self.count; count++) {
		contents = [contents stringByAppendingString:self.symbol];
	}
	return contents;
}

- (void)count:(int) count {
	if (count > 0 && count < 4) {
		_count = count;
	}
}

- (NSString *)symbol {
	if (!_symbol) {
		_symbol = @"?";
	}
	return _symbol;
}

- (void)symbol:(NSString *) symbol {
	if ([[self.class validSymbols] containsObject:symbol]) {
		_symbol = symbol;
	}
}

+ (NSArray *) validSymbols {
	return @[@"▲",@"●",@"◼"];
}

#define MATCH 5

- (int)match:(NSArray *) otherCards {
	if (otherCards.count != 2) {
		return 0;
	}
	BOOL openMatches = TRUE;
	BOOL countMatches = TRUE;
	BOOL colorMatches = TRUE;

	for (SetCard *otherCard in otherCards) {
		if (otherCard.isOpen != self.isOpen) {
			openMatches = FALSE;
		}
		if (otherCard.count != self.count) {
			countMatches = FALSE;
		}
		if (otherCard.color != self.color) {
			colorMatches = FALSE;
		}
	}

	int score = 0;
	if (openMatches) {
		score += MATCH;
	}
	if (countMatches) {
		score += MATCH;
	}
	if (colorMatches) {
		score += MATCH;
	}
	return score;
}
@end
