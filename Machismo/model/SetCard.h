//
//  SetCard.h
//  Machismo
//
//  Created by Robert Hannah on 2/10/13.
//  Copyright (c) 2013 Llanfar Studios. All rights reserved.
//

#import "Card.h"

typedef enum {
	Red = 0,
	Green,
	Blue
} SetColor;

typedef enum {
	Circle = 0,
	Square,
	Triangle
} SymbolType;

@interface SetCard : Card
@property (nonatomic) int count;
@property (nonatomic) NSString *symbol;
@property (nonatomic) SetColor color;
@property (nonatomic, getter = isOpen) BOOL open;

+ (NSArray *)validSymbols;
@end
