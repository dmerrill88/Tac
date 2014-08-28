//
//  TTTViewController.m
//  Tac
//
//  Created by Daniel Merrill on 7/29/14.
//  Copyright (c) 2014 Daniel Merrill. All rights reserved.
//

#import "TTTViewController.h"

#import "TTTouchSpot.h"

#import "TTTGameData.h"


@interface TTTViewController () <UIAlertViewDelegate>

@end

@implementation TTTViewController

{
   
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
//        spots = [@[] mutableCopy];
//        
//        player1Turn = YES;
//        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    int spotWH = 80;
    int padding = 20;
    
    int gridWH = (spotWH * 3) + (padding * 2);
    
    float spacingW = (SCREEN_WIDTH - gridWH) / 2;
    float spacingH = (SCREEN_HEIGHT - gridWH) / 2;
    
    
    
    for (int row = 0; row < 3; row++)
    {
        for (int col = 0; col < 3; col++)
        {
            
            int x = spacingW + (spotWH + padding) * col;
            
            int y = spacingH + (spotWH + padding)* row;
            
            
            TTTouchSpot * spot = [[TTTouchSpot alloc] initWithFrame:CGRectMake(x, y, spotWH, spotWH)];
            
           // spot.backgroundColor = [UIColor lightGrayColor];
           
            spot.player = 0;
            
            [self.view addSubview:spot];
            
            [[TTTGameData mainData].spots addObject:spot];
            
            //run for each row
            
            
        }
    }
}



-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // NSLog(@"touched");
    
    UITouch * touch = [touches allObjects] [0];
    
    //NSLog(@"%d",spots.count);
    
    int spotWH = 80;
    
    for (TTTouchSpot * spot in [TTTGameData mainData].spots)
    {
        CGPoint location = [touch locationInView:spot];
        
        // x >= 0
        // y <= 0
        
        // x < spotWH
        // y < spotWH
        
        if (location.x >=0 && location.y >=0)
        {
            if (location.x <= spotWH && location.y <=spotWH)
            {
                // change to spot player
                
                if (spot.player == 0)
                {
                    // spot touched
                    NSLog(@"%@",spot);
                   // UIColor * color = (player1Turn) ? [UIColor cyanColor] :
                    //[UIColor magentaColor];
                    
                    spot.player = ([TTTGameData mainData].player1Turn) ? 1 : 2;
                    
                    [TTTGameData mainData].player1Turn = ![TTTGameData mainData].player1Turn;
                    
                    [[TTTGameData mainData] checkForWinner];
                }
                
                
            }
            
        }
        
        
        
        // NSLog(@"x : %f y : %f" ,location.x,location.y);
        
    }
}
//-(void) checkForWinner
//{
//        NSArray * possibilities = @[
//                                @[@0,@1,@2],
//                                @[@3,@4,@5],
//                                @[@6,@7,@8],
//                                @[@0,@3,@6],
//                                @[@1,@4,@7],
//                                @[@2,@5,@8],
//                                @[@0,@4,@8],
//                                @[@2,@4,@6],
//                                ];
//    
//    BOOL winner = NO;
//    
//    for (NSArray * possibility in possibilities) {
//        TTTouchSpot * spot0 = spots[[possibility[0] intValue]];
//        TTTouchSpot * spot1 = spots[[possibility[1] intValue]];
//        TTTouchSpot * spot2 = spots[[possibility[2] intValue]];
//        
//        if (spot0.player == spot1.player && spot1.player == spot2.player && spot0.player != 0)
//        {
//            winner = YES;
//            NSLog(@"player %d won", spot0.player);
//            
//            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Winner" message:[NSString stringWithFormat:@"Player %d won",spot0.player] delegate:self cancelButtonTitle:@"Start Over" otherButtonTitles: nil];
//            [alert show];
//            
//        }
//        
//    }
//    
//    
//
//    int emptySpots =0;
//    
//    for (TTTouchSpot * spot in spots)
//    {
//        if (spot.player == 0)
//        {
//            emptySpots++;
//        }
//    }
//    
//    if (emptySpots == 0 && !winner)
//    {
//        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Draw!" message:@"CONGRATULATIONS: You both suck" delegate:self cancelButtonTitle:@"Start Over" otherButtonTitles: nil];
//        
//        [alert show];
//    }
//    

    // if 0,1,2 = same color... then color wins
    
    
//    UIView * spot3 = spots[3];
//    UIView * spot4 = spots[4];
//    UIView * spot5 = spots[5];
//    UIView * spot6 = spots[6];
//    UIView * spot7 = spots[7];
//    UIView * spot8 = spots[8];
//    
//    if ([spot0.backgroundColor isEqual:spot1.backgroundColor] && [spot1.backgroundColor isEqual:spot2.backgroundColor])
//    {
//        if ([spot0.backgroundColor isEqual:[UIColor cyanColor]]) {
//            //[ setBackgroundImage:[UIImage imageNamed:@"x"] forState:UIControlStateNormal];
//
//            // player 1 wins
//            NSLog(@"player 1 wins");
//            winner = YES;
//        } else if ([spot0.backgroundColor isEqual:[UIColor magentaColor]]){
//            NSLog(@"player2 wins");
//            winner = YES;
//
//        }
//    }
    
//    if ([spot3.backgroundColor isEqual:spot4.backgroundColor] && [spot4.backgroundColor isEqual:spot5.backgroundColor])
//    {
//        if ([spot3.backgroundColor isEqual:[UIColor cyanColor]]) {
//            // player 1 wins
//            NSLog(@"player 1 wins");
//            winner = YES;
//
//        } else if ([spot3.backgroundColor isEqual:[UIColor magentaColor]]){
//            NSLog(@"player2 wins");
//            winner = YES;
//
//            
//        }
//    }
//    
//    if ([spot6.backgroundColor isEqual:spot7.backgroundColor] && [spot7.backgroundColor isEqual:spot8.backgroundColor])
//    {
//        if ([spot6.backgroundColor isEqual:[UIColor cyanColor]]) {
//            // player 1 wins
//            NSLog(@"player 1 wins");
//            winner = YES;
//
//        } else if ([spot6.backgroundColor isEqual:[UIColor magentaColor]]){
//            NSLog(@"player2 wins");
//            winner = YES;
//
//            
//        }
//        
//    }
//  if ([spot0.backgroundColor isEqual:spot3.backgroundColor] && [spot3.backgroundColor isEqual:spot6.backgroundColor])
//    {
//        if ([spot0.backgroundColor isEqual:[UIColor cyanColor]]) {
//            // player 1 wins
//            NSLog(@"player 1 wins");
//            winner = YES;
//
//        } else if ([spot0.backgroundColor isEqual:[UIColor magentaColor]]){
//            NSLog(@"player2 wins");
//            winner = YES;
//
//            
//        }
//        
//    }
//    
//    if ([spot1.backgroundColor isEqual:spot4.backgroundColor] && [spot4.backgroundColor isEqual:spot7.backgroundColor])
//    {
//        if ([spot1.backgroundColor isEqual:[UIColor cyanColor]]) {
//            // player 1 wins
//            NSLog(@"player 1 wins");
//            winner = YES;
//
//        } else if ([spot1.backgroundColor isEqual:[UIColor magentaColor]]){
//            NSLog(@"player2 wins");
//            winner = YES;
//
//            
//        }
//    }
//    
//    if ([spot2.backgroundColor isEqual:spot5.backgroundColor] && [spot5.backgroundColor isEqual:spot8.backgroundColor])
//    {
//        if ([spot2.backgroundColor isEqual:[UIColor cyanColor]]) {
//            // player 1 wins
//            NSLog(@"player 1 wins");
//            winner = YES;
//
//        } else if ([spot2.backgroundColor isEqual:[UIColor magentaColor]]){
//            NSLog(@"player2 wins");
//            winner = YES;
//
//            
//        }
//    }
//    
//    if ([spot2.backgroundColor isEqual:spot4.backgroundColor] && [spot4.backgroundColor isEqual:spot6.backgroundColor])
//    {
//        if ([spot2.backgroundColor isEqual:[UIColor cyanColor]]) {
//            // player 1 wins
//            NSLog(@"player 1 wins");
//            winner = YES;
//
//        } else if ([spot2.backgroundColor isEqual:[UIColor magentaColor]]){
//            NSLog(@"player2 wins");
//            winner = YES;
//
//            
//        }
//        
//    }
//    
//    if ([spot0.backgroundColor isEqual:spot4.backgroundColor] && [spot4.backgroundColor isEqual:spot8.backgroundColor])
//    {
//        if ([spot0.backgroundColor isEqual:[UIColor cyanColor]]) {
//            // player 1 wins
//            NSLog(@"player 1 wins");
//            winner = YES;
//
//        } else if ([spot0.backgroundColor isEqual:[UIColor magentaColor]]){
//            NSLog(@"player2 wins");
//            winner = YES;

            
        //}

    // ui alertview for winner or draw
//    if (winner == YES) {
//        UIAlertView * winnerAlert = [[UIAlertView alloc] initWithTitle:@"Result" message:@"Winner" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
//        [winnerAlert show];
//    }

   
//^^make this work for every case
// 012
//354
//678
//036
//147
//258
//048
//246


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
