//
//  MDAddressTableViewCell.h
//  MyDoctor
//
//  Created by 张昊辰 on 15/11/30.
//  Copyright (c) 2015年 com.mingxing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDAddressTableViewCell : UITableViewCell

@property (nonatomic, strong) NSString * userName;
@property (nonatomic, strong) NSString * phone;
@property (nonatomic, strong) NSString * address;
-(void)drawCell;


@end
