//
//  MDFeedBackViewController.m
//  MyDoctor
//
//  Created by 巫筠 on 15/12/1.
//  Copyright © 2015年 com.mingxing. All rights reserved.
//

#import "MDFeedBackViewController.h"

@interface MDFeedBackViewController ()

@end

@implementation MDFeedBackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"意见反馈";
    [self setNavigationBarWithrightBtn:nil leftBtn:@"navigationbar_back"];
    [self.leftBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];

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
