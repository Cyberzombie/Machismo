//
//  SetDeck.m
//  Machismo
//
//  Created by Robert Hannah on 2/15/13.
//  Copyright (c) 2013 Llanfar Studios. All rights reserved.
//

#import "SetDeck.h"
#import "SetCard.h"

@implementation SetDeck
- (id) init {
	self = [super init];

	if (self) {
		for (int openIndex = 0; openIndex <= 1; openIndex++) {
			for (int colorIndex = Red; colorIndex <= Blue; colorIndex++) {
				for (int countIndex = 1; countIndex <= 3; countIndex++) {
					for (NSString *symbol in [SetCard validSymbols]) {
						SetCard *card = [[SetCard alloc] init];
						card.open = openIndex == 0;
						card.color = colorIndex;
						card.count = countIndex;
						card.symbol = [symbol stringByPaddingToLength:countIndex withString:symbol startingAtIndex:0];
						[self addCard:card atTop:YES];
					}
				}
			}
		}
	}
	return self;
}
@end
