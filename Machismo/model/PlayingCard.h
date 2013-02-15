//
//  PlayingCard.h
//  Machismo
//
//  Created by Robert Hannah on 2/2/13.
//  Copyright (c) 2013 Llanfar Studios. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card
@property (nonatomic) NSString *suit;
@property (nonatomic) NSInteger rank;
+ (NSArray *) validSuits;
+ (NSInteger) maxRank;
@end
