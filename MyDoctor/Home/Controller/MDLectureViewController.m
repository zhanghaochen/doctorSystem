//
//  MDLectureViewController.m
//  MyDoctor
//
//  Created by 巫筠 on 15/11/27.
//  Copyright © 2015年 com.mingxing. All rights reserved.
//

#import "MDLectureViewController.h"

@interface MDLectureViewController ()

@end

@implementation MDLectureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"专题讲座";
    [self setNavigationBarWithrightBtn:nil leftBtn:@"navigationbar_back"];
    //返回按钮点击
    [self.leftBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.titleLab.text = @"讲座内容";
    
    [self.leftBtn setTitle:@"电话咨询" forState:UIControlStateNormal];
    [self.rightBtn setTitle:@"立即预约" forState:UIControlStateNormal];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)backBtnClick
{
    [self.navigationController popViewControllerAnimated:YES
     ];
    
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
