//
//  Deck.h
//  Machismo
//
//  Created by Robert Hannah on 2/2/13.
//  Copyright (c) 2013 Llanfar Studios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;

- (Card *)drawRandomCard;

@end
