//
//  MatchViewController.m
//  Machismo
//
//  Created by Robert Hannah on 2/10/13.
//  Copyright (c) 2013 Llanfar Studios. All rights reserved.
//

#import "MatchViewController.h"
#import "CardMatchingGame.h"
#import "PlayingCardDeck.h"

@interface MatchViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (nonatomic) CardMatchingGame *game;
@end

@implementation MatchViewController
- (CardGame *) game {
	if (!_game) {
		_game = [[CardMatchingGame alloc] initWithCardCount:self.cardButtons.count
												  usingDeck:[[PlayingCardDeck alloc] init]];
	}
	return _game;
}
@end
