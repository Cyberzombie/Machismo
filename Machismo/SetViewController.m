//
//  SetViewController.m
//  Machismo
//
//  Created by Robert Hannah on 2/15/13.
//  Copyright (c) 2013 Llanfar Studios. All rights reserved.
//

#import "SetViewController.h"
#import "SetGame.h"
#import "CardMatchingGame.h"
#import "SetDeck.h"

@interface SetViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (nonatomic) SetGame *game;
@end

@implementation SetViewController
- (CardGame *) game {
	if (!_game) {
		_game = [[SetGame alloc] initWithCardCount:self.cardButtons.count
										 usingDeck:[[SetDeck alloc] init]];
	}
	return _game;
}
@end
