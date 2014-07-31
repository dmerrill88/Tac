//
//  TTTouchSpot.m
//  Tac
//
//  Created by Daniel Merrill on 7/29/14.
//  Copyright (c) 2014 Daniel Merrill. All rights reserved.
//

#import "TTTouchSpot.h"

@implementation TTTouchSpot
{
    UIImageView * imageView;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        //add a UI Image View
        //         [linkbutton setBackgroundImage:[UIImage imageNamed:@"profileArrow"] forState:UIControlStateNormal];

        imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:imageView];
    }
    
    return self;
}


///////Player setter method will change image

-(void)setPlayer:(int)player
{
    _player = player;
    
    switch (player) {
        case 0:
            imageView.image = [UIImage imageNamed:@"spot"];
            break;
            case 1:
            imageView.image = [UIImage imageNamed:@"x"];
            break;
        case 2:
            imageView.image = [UIImage imageNamed:@"circle"];
            break;
            
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
