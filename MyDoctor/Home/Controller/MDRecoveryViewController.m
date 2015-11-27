//
//  MDRecoveryViewController.m
//  MyDoctor
//
//  Created by 巫筠 on 15/11/26.
//  Copyright © 2015年 com.mingxing. All rights reserved.
//

#import "MDRecoveryViewController.h"

@interface MDRecoveryViewController ()

@end

@implementation MDRecoveryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"术后康复";
    
    [self setText];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setText
{
    UILabel * requirLab = [[UILabel alloc] init];
    requirLab.text = @"服务需求:";
    requirLab.textAlignment = NSTextAlignmentLeft;
    requirLab.font = [UIFont systemFontOfSize:14];
    requirLab.textColor = ColorWithRGB(97, 103, 111, 1);
    requirLab.numberOfLines = 0;
    //    [introduceLab sizeToFit];
    [self.scrollView addSubview:requirLab];
    [requirLab mas_makeConstraints:^(MX_MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.equalTo(self.scrollView.mas_top).with.offset(0);
        make.left.equalTo(self.scrollView.mas_left).with.offset(0);
        make.right.equalTo(self.scrollView.mas_right).with.offset(0);
        
    }];
    
    UILabel * priceLab = [[UILabel alloc] init];
    priceLab.text = @"每次价格:300元";
    priceLab.textColor = ColorWithRGB(97, 103, 111, 1);
    priceLab.textAlignment = NSTextAlignmentLeft;
    priceLab.font = [UIFont systemFontOfSize:14];
    [self.scrollView addSubview:priceLab];
    
    [priceLab mas_makeConstraints:^(MX_MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.equalTo(requirLab.mas_bottom).with.offset(15);
        make.left.equalTo(self.scrollView.mas_left).with.offset(0);
        make.right.equalTo(self.scrollView.mas_right).with.offset(0);
    }];
    
    UILabel * remarkLab = [[UILabel alloc] init];
    remarkLab.text = @"备注:视客户评估而定，价格以估计师实际评";
    remarkLab.textColor = ColorWithRGB(97, 103, 111, 1);
    remarkLab.textAlignment = NSTextAlignmentLeft;
    remarkLab.numberOfLines = 0;
    remarkLab.font = [UIFont systemFontOfSize:14];
    [self.scrollView addSubview:remarkLab];
    
    [remarkLab mas_makeConstraints:^(MX_MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.equalTo(priceLab.mas_bottom).with.offset(40);
        make.left.equalTo(self.scrollView.mas_left).with.offset(0);
        make.right.equalTo(self.scrollView.mas_right).with.offset(0);
    }];



}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
