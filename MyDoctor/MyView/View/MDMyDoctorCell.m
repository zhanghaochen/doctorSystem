//
//  MDMyDoctorCell.m
//  MyDoctor
//
//  Created by 巫筠 on 15/11/30.
//  Copyright © 2015年 com.mingxing. All rights reserved.
//

#import "MDMyDoctorCell.h"

@implementation MDMyDoctorCell

- (void)awakeFromNib {

    // Initialization code
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



- (IBAction)zanClick:(id)sender {

    if (_zanBtn.selected == NO) {
        _zanBtn.selected = YES;
        [_zanBtn setTitle:[NSString stringWithFormat:@"%d",[_zanBtn.titleLabel.text intValue]+1] forState:0];
    }
   
    
    else {
        [_zanBtn setTitle:[NSString stringWithFormat:@"%d",[_zanBtn.titleLabel.text intValue]-1] forState:0];
        _zanBtn.selected = NO;
    }
    
    
}
@end
