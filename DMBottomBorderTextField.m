//
//  DMBottomBorderTextField.m
//
//  Created by Lorenzo Santi on 02/09/14.
//  Copyright (c) 2014 Lorenzo Santi. All rights reserved.
//

#import "DMBottomBorderTextField.h"

@implementation DMBottomBorderTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupLine];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupLine];
    }
    return self;
}

-(id)init{
    self = [super init];
    if (self) {
        [self setupLine];
    }
    return self;
}

-(void)setupLine{
    _bottomLine = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height-1, self.frame.size.width, 1)];
    [_bottomLine setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_bottomLine setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.3]];
    [self addSubview:_bottomLine];
    
    [self addObserver:self forKeyPath:@"editing" options:NSKeyValueObservingOptionNew context:NULL];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didBeginEditing:) name:UITextFieldTextDidBeginEditingNotification object:self];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didEndEditing:) name:UITextFieldTextDidEndEditingNotification object:self];
}



-(void)didBeginEditing:(NSNotification *)notif{
    [_bottomLine setBackgroundColor:[UIColor whiteColor]];
}

-(void)didEndEditing:(NSNotification *)notif{
    [_bottomLine setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.3]];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
