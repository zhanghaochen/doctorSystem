//
//  MDExaminationViewController.m
//  MyDoctor
//
//  Created by 巫筠 on 15/11/26.
//  Copyright © 2015年 com.mingxing. All rights reserved.
//

#import "MDExaminationViewController.h"

@interface MDExaminationViewController ()

@end

@implementation MDExaminationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"上门体检";
    [self setText];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setText
{
    UILabel * introduceLab = [[UILabel alloc] init];
//    introduceLab.userInteractionEnabled = YES;
    introduceLab.text = @"    社区全科医生金季带着“移动随访包”上门随访体检，在完成血压、血糖、血脂等指标快速检测后，数据直接通过包内的IPAD上传到健康档案管理系统，在区域内实现互联共享    社区全科医生金季带着“移动随访包”上门随访体检，在完成血压、血糖、血脂等指标快速检测后，数据直接通过包内的IPAD上传到健康档案管理系统，在区域内实现互联共享    社区全科医生金季带着“移动随访包”上门随访体检，在完成血压、血糖、血脂等指标快速检测后，数据直接通过包内的IPAD上传到健康档案管理系统，在区域内实现互联共享    社区全科医生金季带着“移动随访包”上门随访体检，在完成血压、血糖、血脂等指标快速检测后，数据直接通过包内的IPAD上传到健康档案管理系统，在区域内实现互联共享";
    introduceLab.textAlignment = NSTextAlignmentLeft;
    introduceLab.font = [UIFont systemFontOfSize:14];
    introduceLab.textColor = ColorWithRGB(97, 103, 111, 1);
    introduceLab.numberOfLines = 0;
//    introduceLab.backgroundColor = [UIColor grayColor];
    //    [introduceLab sizeToFit];
    [self.scrollView addSubview:introduceLab];
    [introduceLab mas_makeConstraints:^(MX_MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.equalTo(self.scrollView.mas_top).with.offset(0);
        make.left.equalTo(self.scrollView.mas_left).with.offset(0);
        make.right.equalTo(self.scrollView.mas_right).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(30, 50));
        
    }];
    
    UILabel * priceLab = [[UILabel alloc] init];
    priceLab.text = @"每次价格:9.9元";
    priceLab.textColor = ColorWithRGB(97, 103, 111, 1);
    priceLab.textAlignment = NSTextAlignmentLeft;
    priceLab.font = [UIFont systemFontOfSize:14];
    [self.scrollView addSubview:priceLab];
    
    [priceLab mas_makeConstraints:^(MX_MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.equalTo(introduceLab.mas_bottom).with.offset(75);
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
