//
//  TTT.m
//  Tac
//
//  Created by Daniel Merrill on 8/28/14.
//  Copyright (c) 2014 Daniel Merrill. All rights reserved.
//

#import "TTTGameData.h"
#import "TTTouchSpot.h"

@implementation TTTGameData
{
    NSArray * possibilities;
}

+ (TTTGameData *) mainData
{
    static dispatch_once_t onceToken;
    static TTTGameData * singleton = nil;
    
    dispatch_once(&onceToken, ^{
        
        singleton = [[TTTGameData alloc] init];
        
    });
    
    return singleton;
}

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        
        self.spots = [@[] mutableCopy];
        self.player1Turn = YES;
        
        possibilities = @[
                          @[@0,@1,@2],
                          @[@3,@4,@5],
                          @[@6,@7,@8],
                          @[@0,@3,@6],
                          @[@1,@4,@7],
                          @[@2,@5,@8],
                          @[@0,@4,@8],
                          @[@2,@4,@6],
                          ];
        
    }
    return self;
}

-(void)setPlayer1Turn:(BOOL)player1Turn
{
    _player1Turn = player1Turn;
    
    if (player1Turn == NO)
    {
        // run robot/ AI system
        
        //set a spot.player
        //change player turn
        //check for winner
        
        [self robotChooceSpot];
        
    }
}


-(void) robotChooceSpot
{
    if([self findWinningSpot])
    {
        self.player1Turn = !self.player1Turn;
    [self checkForWinner];
    return;
    }
    
    if([self findBlockingSpot])
    {
        self.player1Turn = !self.player1Turn;
    [self checkForWinner];
    return;
    
    }
    
    for (TTTouchSpot * spot in self.spots)
    {
        if (spot.player== 0)
        {
            spot.player = 2;
            
            self.player1Turn = !self.player1Turn;
            [self checkForWinner];
            
            return;
        }
    }
}

- (BOOL)findWinningSpot
{
    for (NSArray * possibility in possibilities)
    {
        if ([self checkForSpotWithSpots:possibility player:2]) return YES;
        
        NSArray * possibility2 = @[possibility[1],possibility[2],possibility[0]];
        if ([self checkForSpotWithSpots:possibility2 player:2]) return YES;
        
        
        NSArray * possibility3 = @[possibility[2],possibility[0],possibility[1]];
        if ([self checkForSpotWithSpots:possibility3 player:2]) return YES;

        
        
    
    }
    return NO;

}

- (BOOL)findBlockingSpot
{
    
    for (NSArray * possibility in possibilities)
    {
        if ([self checkForSpotWithSpots:possibility player:1]) return YES;
        
        NSArray * possibility2 = @[possibility[1],possibility[2],possibility[0]];
        if ([self checkForSpotWithSpots:possibility2 player:1]) return YES;
        
        
        NSArray * possibility3 = @[possibility[2],possibility[0],possibility[1]];
        if ([self checkForSpotWithSpots:possibility3 player:1]) return YES;
        
        
        
        
    }
    return NO;


}


- (BOOL)findRandomSpot
{
    for (NSArray * possibility in possibilities)
    {
        TTTouchSpot * spot0 = self.spots[[possibility[0] intValue]];
        TTTouchSpot * spot1 = self.spots[[possibility[1] intValue]];
        TTTouchSpot * spot2 = self.spots[[possibility[2] intValue]];
        
        if (spot0.player == 2 && spot1.player == 2 && spot2.player == 0)
        {
            spot2.player = 2;
            return YES;

        }
    }
    
    return NO;
}

-(bool)checkForSpotWithSpots:(NSArray *)spots player:(int)player
{
    TTTouchSpot * spot0 = self.spots[[spots[0] intValue]];
    TTTouchSpot * spot1 = self.spots[[spots[1] intValue]];
    TTTouchSpot * spot2 = self.spots[[spots[2] intValue]];

   if (spot0.player == player && spot1.player == player && spot2.player == 0)
   {
       spot2.player = 2;
       return YES;
   }
    
    return NO;
}

-(void) checkForWinner
{
    
    BOOL winner = NO;
    
    for (NSArray * possibility in possibilities) {
        TTTouchSpot * spot0 = self.spots[[possibility[0] intValue]];
        TTTouchSpot * spot1 = self.spots[[possibility[1] intValue]];
        TTTouchSpot * spot2 = self.spots[[possibility[2] intValue]];
        
        if (spot0.player == spot1.player && spot1.player == spot2.player && spot0.player != 0)
        {
            winner = YES;
            NSLog(@"player %d won", spot0.player);
            
            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Winner" message:[NSString stringWithFormat:@"Player %d won",spot0.player] delegate:self cancelButtonTitle:@"Start Over" otherButtonTitles: nil];
            [alert show];
            
        }
        
    }
    
    
    
    int emptySpots =0;
    
    for (TTTouchSpot * spot in self.spots)
    {
        if (spot.player == 0)
        {
            emptySpots++;
        }
    }
    
    if (emptySpots == 0 && !winner)
    {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Draw!" message:@"CONGRATULATIONS: You both suck" delegate:self cancelButtonTitle:@"Start Over" otherButtonTitles: nil];
        
        [alert show];
    }
    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    self.player1Turn = YES;
    
    for (TTTouchSpot * spot in self.spots)
    {
        spot.player = 0;
    }
}


@end
