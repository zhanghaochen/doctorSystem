//
//  MDNurseRootViewController.m
//  MyDoctor
//
//  Created by 巫筠 on 15/11/26.
//  Copyright © 2015年 com.mingxing. All rights reserved.
//

#import "MDNurseRootViewController.h"

@interface MDNurseRootViewController ()

@end

@implementation MDNurseRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavigationBarWithrightBtn:nil leftBtn:@"navigationbar_back"];
    //返回按钮点击
    [self.leftBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self createView];

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
    self.tabBarController.tabBar.hidden = NO;
    
}

-(void)createView
{
    UIImageView * topImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"topImg"]];
    [self.view addSubview:topImageView];
    [topImageView mas_makeConstraints:^(MX_MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.equalTo(self.view.mas_top).with.offset(TOPHEIGHT+18);
        make.left.equalTo(self.view.mas_left).with.offset(15);
        
    }];
    
    //下方两个按钮设置
    UIButton * consultBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    consultBtn.layer.cornerRadius = 5.0;
    consultBtn.layer.masksToBounds = YES;
    [consultBtn setTitle:@"电话咨询" forState:UIControlStateNormal];
    [consultBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [consultBtn setBackgroundColor:RedColor];
    [self.view addSubview:consultBtn];
    
    UIButton * callBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [callBtn setBackgroundColor:RedColor];
    callBtn.layer.cornerRadius = 5.0;
    callBtn.layer.masksToBounds = YES;
    [callBtn setTitle:@"立即订购" forState:UIControlStateNormal];
    [callBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:callBtn];
    
    [consultBtn mas_makeConstraints:^(MX_MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(36);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-110.0/1333.0*appHeight);
        make.right.equalTo(callBtn.mas_left).with.offset(-33);
        make.width.equalTo(callBtn.mas_width);
        make.height.equalTo(callBtn.mas_height);
    }];
    
    [callBtn mas_makeConstraints:^(MX_MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right).with.offset(-36);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-110.0/1333.0*appHeight);
        make.left.equalTo(callBtn.mas_right).with.offset(33);
        make.width.equalTo(callBtn.mas_width);
        make.height.equalTo(callBtn.mas_height);
    }];

    //下方空白view
    _whiteView = [[UIView alloc] init];
    _whiteView.userInteractionEnabled = YES;
    [self.view addSubview:_whiteView];
    _whiteView.backgroundColor = ColorWithRGB(255, 255, 255, 0.7);
    [_whiteView mas_makeConstraints:^(MX_MASConstraintMaker *make) {
        make.top.equalTo(topImageView.mas_bottom).with.offset(0);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.width.equalTo(topImageView.mas_width);
        make.bottom.equalTo(callBtn.mas_top).with.offset(-15);
    }];
//文字设置
    UILabel * topLab = [[UILabel alloc] init];
    topLab.text = @"产品介绍";
    topLab.textAlignment = NSTextAlignmentCenter;
    topLab.backgroundColor = [UIColor clearColor];
    topLab.font = [UIFont systemFontOfSize:12];
    topLab.textColor = RedColor;
    [topLab sizeToFit];
    [_whiteView addSubview:topLab];
    
    [topLab mas_makeConstraints:^(MX_MASConstraintMaker *make) {
        make.top.equalTo(topImageView.mas_bottom).with.offset(15);
        make.centerX.mas_equalTo(self.view.mas_centerX);
    }];
    
    //分割线
    UIView * wireViewLeft = [[UIView alloc] init];
    wireViewLeft.backgroundColor = RedColor;
    UIView * wireViewRirght = [[UIView alloc] init];
    wireViewRirght.backgroundColor = RedColor;
    [_whiteView addSubview:wireViewLeft];
    [_whiteView addSubview:wireViewRirght];

    [wireViewLeft mas_makeConstraints:^(MX_MASConstraintMaker *make) {
        make.left.equalTo(_whiteView.mas_left).with.offset(40);
        make.right.equalTo(topLab.mas_left).with.offset(-25);
        make.centerY.mas_equalTo(topLab.mas_centerY);
        make.height.equalTo(@1);
    }];
    
    [wireViewRirght mas_makeConstraints:^(MX_MASConstraintMaker *make) {
        make.right.equalTo(_whiteView.mas_right).with.offset(-40);
        make.left.equalTo(topLab.mas_right).with.offset(25);
        make.centerY.mas_equalTo(topLab.mas_centerY);
        make.height.equalTo(@1);
    }];
    
    self.scrollView = [[UIScrollView alloc] init];
    _scrollView.userInteractionEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
//    UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"topImg"]];
    [_whiteView addSubview:_scrollView];
//    [_scrollView addSubview:imageView];
    
//    UIImageView * imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"topImg"]];
//    [_scrollView addSubview:imageView2];
    
    [_scrollView mas_makeConstraints:^(MX_MASConstraintMaker *make) {
        make.top.equalTo(topLab.mas_bottom).with.offset(15);
        make.left.equalTo(wireViewLeft.mas_left).with.offset(0);
        make.right.equalTo(wireViewRirght.mas_right).with.offset(0);
        make.bottom.equalTo(_whiteView.mas_bottom).with.offset(0);

    }];
    
//    [imageView2 mas_makeConstraints:^(MX_MASConstraintMaker *make) {
//        make.top.equalTo(imageView.mas_bottom).with.offset(10);
//    }];
    
    //设置scrollView内容物大小
    CGFloat scrollViewHeight = 0.0;
    for (UIView* view in _scrollView.subviews)
    { scrollViewHeight += view.frame.size.height;}
    [_scrollView setContentSize:(CGSizeMake(0, scrollViewHeight+10))];
    
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
