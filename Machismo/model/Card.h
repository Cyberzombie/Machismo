//
//  Card.h
//  Machismo
//
//  Created by Robert Hannah on 1/30/13.
//  Copyright (c) 2013 Llanfar Studios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject
@property (strong,nonatomic) NSString *contents;
@property (nonatomic,getter=isFaceUp) BOOL faceUp;
@property (nonatomic, getter=isPlayable) BOOL playable;

- (int)match:(NSArray *)otherCards;
@end
