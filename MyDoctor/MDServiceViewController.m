//
//  MDServiceViewController.m
//  MyDoctor
//
//  Created by 张昊辰 on 15/11/24.
//  Copyright (c) 2015年 com.mingxing. All rights reserved.
//

#import "MDServiceViewController.h"
#import "WBToolBar.h"
#import "MDAllServiceViewController.h"
#import "MDPaymentViewController.h"
#import "MDOngoingViewController.h"
#import "MDOrderDetailsViewController.h"
#import "MDNoPaymentViewController.h"

@interface MDServiceViewController ()

@end

@implementation MDServiceViewController
{
    WBToolBar *bar;
    MDAllServiceViewController * asvc;
    MDPaymentViewController * pvc;
    MDOngoingViewController *ovc;
    int firstShow;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    firstShow=1;
    self.navigationItem.title=@"服务记录";
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushViewInParent:) name:@"pushViewInParent" object:nil];
    
    
    if (!bar) {
        bar = [[WBToolBar alloc] initWithFrame:CGRectMake(0, 64, appWidth, 40)];
        bar.dataSource = [[NSArray alloc] initWithObjects:@"全部",@"待付款",@"进行中", nil];
        bar.delegate = self;
        [bar drawFristRect:CGRectMake(0, 64, appWidth, 40)];
        [self.view addSubview:bar];
    }
    [self draw];
    
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"pushViewInParent" object:nil];
    
    
}
-(void)draw
{
    if(!asvc){
        asvc=[[MDAllServiceViewController alloc] init];
        [self.view addSubview:asvc.view];
    }
    asvc.view.hidden=NO;
    pvc.view.hidden=YES;
    ovc.view.hidden=YES;
    if(firstShow==1){
        [self.view bringSubviewToFront:asvc.view];
        [self.view bringSubviewToFront:bar];
        firstShow=0;
    }
    
}


//标签选择后调用
-(void) elementSelected:(int)index toolBar:(WBToolBar*)toolBar
{
    if (index == 0) {
        if(!asvc){
            asvc=[[MDAllServiceViewController alloc] init];
            [self.view addSubview:asvc.view];
        }
        asvc.view.hidden=NO;
        pvc.view.hidden=YES;
        ovc.view.hidden=YES;
        [self.view bringSubviewToFront:asvc.view];
        [self.view bringSubviewToFront:bar];
    }else if (index==1){
        if (!pvc) {
            pvc=[[MDPaymentViewController alloc] init];
            [self.view addSubview:pvc.view];
        }
        asvc.view.hidden=YES;
        pvc.view.hidden=NO;
        ovc.view.hidden=YES;
        [self.view bringSubviewToFront:pvc.view];
        [self.view bringSubviewToFront:bar];
        
    }else if (index==2){
        if (!ovc) {
            ovc=[[MDOngoingViewController alloc] init];
            [self.view addSubview:ovc.view];
        }
        asvc.view.hidden=YES;
        pvc.view.hidden=YES;
        ovc.view.hidden=NO;
        [self.view bringSubviewToFront:ovc.view];
        [self.view bringSubviewToFront:bar];
    }
}
-(void)pushViewInParent:(id)sender
{
    
    NSString * text= [[sender userInfo] objectForKey:@"text"];
    if ([text isEqualToString:@"12"]) {
        MDNoPaymentViewController * ndvc=[[MDNoPaymentViewController alloc] init];
        ndvc.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:ndvc animated:YES];

    }else{
    MDOrderDetailsViewController * odvc=[[MDOrderDetailsViewController alloc] init];
    odvc.hidesBottomBarWhenPushed=YES;
    
    [self.navigationController pushViewController:odvc animated:YES];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
}





@end