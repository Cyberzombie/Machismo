//
//  CardGameViewController.m
//  Machismo
//
//  Created by Robert Hannah on 1/30/13.
//  Copyright (c) 2013 Llanfar Studios. All rights reserved.
//

#import "CardGameViewController.h"
#import "Deck.h"
#import "CardGame.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (nonatomic) CardGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *playResult;
@end

@implementation CardGameViewController
@synthesize cardButtons = _cardButtons;

- (void) viewDidLoad {
	[super viewDidLoad];
	self.playResult.text = @"";
}

- (CardGame *) game {
	if (!_game) {
		_game = [self createGame: self.cardButtons.count];
	}
	return _game;
}

- (CardGame *) createGame: (NSUInteger) cardCount {
	return [[CardGame alloc] initWithCardCount:self.cardButtons.count
									 usingDeck:[[Deck alloc] init]];
}

- (IBAction)deal {
	int matchCount = 3;
	[self.game shuffle:[[Deck alloc] init] withCardCount:self.cardButtons.count withMatchCount:matchCount];
	self.flipCount = 0;
	[self updateUI];
}

-(NSArray *)cardButtons {
	return _cardButtons;
}

- (void)setCardButtons:(NSArray *)cardButtons {
	_cardButtons = cardButtons;
	[self updateUI];
}

- (void)setFlipCount:(int)flipCount {
	_flipCount = flipCount;
	self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

- (IBAction)flipCard:(UIButton *)sender {
	[self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
	self.flipCount++;
	[self updateUI];
}

- (void) updateUI {
	for (UIButton *cardButton in self.cardButtons) {
		Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
		[cardButton setTitle:card.contents
					forState:UIControlStateSelected];
		[cardButton setTitle:card.contents
					forState:UIControlStateSelected|UIControlStateDisabled];
		cardButton.selected = card.isFaceUp;
		cardButton.enabled = card.isPlayable;
		cardButton.alpha = cardButton.isEnabled ? 1.0 : 0.3;
	}
	self.playResult.text = self.game.playResult;
	self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
}
@end
