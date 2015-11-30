//
//  UIView+ViewExtension.m
//  XYWY2
//
//  Created by Mac on 15/11/11.
//  Copyright (c) 2015年 WHWY. All rights reserved.
//

#import "UIView+ViewExtension.h"

@implementation UIView (ViewExtension)

-(void)setX:(CGFloat)x
{
    CGRect fram = self.frame;
    fram.origin.x = x;
    self.frame = fram;
}
-(void)setY:(CGFloat)y
{
    CGRect fram = self.frame;
    fram.origin.y = y;
    self.frame = fram;
}

-(CGFloat)x
{
    
    return self.frame.origin.x;
}

-(CGFloat)y
{
    return self.frame.origin.y;
}

-(void)setWidth:(CGFloat)width
{
    CGRect fram = self.frame;
    fram.size.width = width;
    self.frame = fram;
}

-(void)setHeight:(CGFloat)height
{
    CGRect fram = self.frame;
    fram.size.height = height;
    self.frame = fram;
}

-(CGFloat)width
{
    return self.frame.size.width;
}

-(CGFloat)height
{
    return self.frame.size.height;
}

-(void)setSize:(CGSize)size
{
    CGRect fram = self.frame;
    fram.size = size;
    self.frame = fram;
}

-(void)setOrigin:(CGPoint)origin
{
    CGRect fram = self.frame;
    fram.origin = origin;
    self.frame = fram;
}

-(CGSize)size
{
    return self.frame.size;
}

-(CGPoint)origin
{
    return self.frame.origin;
}


@end
