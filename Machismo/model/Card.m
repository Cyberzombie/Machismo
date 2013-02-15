//
//  Card.m
//  Machismo
//
//  Created by Robert Hannah on 1/30/13.
//  Copyright (c) 2013 Llanfar Studios. All rights reserved.
//

#import "Card.h"

@interface Card()

@end

@implementation Card

- (int) match:(NSArray *)otherCards {
	int score = 0;
	for (Card *card in otherCards) {
		if ([card.contents isEqualToString:self.contents]) {
			score = 1;
		}
	}
	return score;
}

@end
