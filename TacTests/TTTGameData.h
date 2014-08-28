//
//  TTT.h
//  Tac
//
//  Created by Daniel Merrill on 8/28/14.
//  Copyright (c) 2014 Daniel Merrill. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTTGameData : NSObject

+ (TTTGameData *)mainData;

-(void)checkForWinner;

@property (nonatomic)  NSMutableArray * spots;

@property (nonatomic) BOOL player1Turn;



@end
