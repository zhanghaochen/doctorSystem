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
    UILabel * introduceLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, appWidth - 48*2, 0)];
    introduceLab.text = @"    社区全科医生金季带着“移动随访包”上门随访体检，在完成血压、血糖、血脂等指标快速检测后，数据直接通过包内的IPAD上传到健康档案管理系统，在区域内实现互联共享";
    introduceLab.textAlignment = NSTextAlignmentLeft;
    introduceLab.font = [UIFont systemFontOfSize:14];
    introduceLab.textColor = ColorWithRGB(97, 103, 111, 1);
    introduceLab.numberOfLines = 0;
    [introduceLab sizeToFit];
    [self.scrollView addSubview:introduceLab];
    
    UILabel * priceLab = [[UILabel alloc] initWithFrame:CGRectMake(0, introduceLab.frame.origin.y+introduceLab.frame.size.height+50, appWidth - 48*2, 0)];
    priceLab.text = @"每次价格:9.9元";
    [priceLab sizeToFit];

        priceLab.textColor = ColorWithRGB(97, 103, 111, 1);
        priceLab.textAlignment = NSTextAlignmentLeft;
        priceLab.font = [UIFont systemFontOfSize:14];
        [self.scrollView addSubview:priceLab];
    
    //设置scrollView内容物大小
    CGFloat scrollViewHeight = 0.0;
    for (UIView* view in self.scrollView.subviews)
    {
        scrollViewHeight += view.frame.size.height;
    }
    [self.scrollView setContentSize:(CGSizeMake(0, scrollViewHeight+50))];

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
