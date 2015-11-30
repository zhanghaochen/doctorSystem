//
//  MDAddressTableViewCell.m
//  MyDoctor
//
//  Created by 张昊辰 on 15/11/30.
//  Copyright (c) 2015年 com.mingxing. All rights reserved.
//

#import "MDAddressTableViewCell.h"
#import "MDConst.h"
@implementation MDAddressTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)drawCell
{
    UIView * backView=[[UIView alloc] initWithFrame:CGRectMake(20, 5, appWidth-40, 80-10)];
    backView.backgroundColor=[UIColor clearColor];
    [self addSubview:backView];
    
    UIView * white= [[UIView alloc] initWithFrame:CGRectMake(0, 0, appWidth-40, 80-10)];
    white.backgroundColor=[UIColor whiteColor];
    white.alpha=0.6;
    [backView addSubview:white];
    
    UILabel * userName=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 80, 25)];
    userName.text=_userName;
    userName.font=[UIFont systemFontOfSize:16];
    [backView addSubview:userName];
    
    UILabel * phone=[[UILabel alloc] initWithFrame:CGRectMake(70, 10, 150, 25)];
    phone.text=_phone;
    phone.font=[UIFont systemFontOfSize:16];
    [backView addSubview:phone];
    
    UILabel * address=[[UILabel alloc] initWithFrame:CGRectMake(20, 35, appWidth-40-40, 25)];
    address.text=_address;
    address.numberOfLines=2;
    address.font=[UIFont systemFontOfSize:15];
    [backView addSubview:address];
}
@end
