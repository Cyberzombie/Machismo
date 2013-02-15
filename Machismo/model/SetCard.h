//
//  SetCard.h
//  Machismo
//
//  Created by Robert Hannah on 2/10/13.
//  Copyright (c) 2013 Llanfar Studios. All rights reserved.
//

#import "Card.h"

enum SetColor {
	Red = 0,
	Green = 1,
	Blue = 3
	};

@interface SetCard : Card
@property (nonatomic) int count;
@property (nonatomic) enum SetColor color;
@property (nonatomic, getter = isOpen) BOOL open;
@end
