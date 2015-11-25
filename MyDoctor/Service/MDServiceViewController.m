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
#import "MDEvaluationViewController.h"

@interface MDServiceViewController ()

@end

@implementation MDServiceViewController
{
    WBToolBar *bar;
    MDAllServiceViewController * asvc;
    MDPaymentViewController * pvc;
    MDOngoingViewController *ovc;
    MDEvaluationViewController * evc;
    int firstShow;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    firstShow=1;
    self.navigationItem.title=@"服务记录";
    if (!bar) {
        bar = [[WBToolBar alloc] initWithFrame:CGRectMake(0, 64, appWidth, 30)];
        bar.dataSource = [[NSArray alloc] initWithObjects:@"全部",@"待付款",@"进行中",@"待评价", nil];
        bar.delegate = self;
        [bar drawFristRect:CGRectMake(0, 64, appWidth, 30)];
        [self.view addSubview:bar];
    }
    [self draw];

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
    evc.view.hidden=YES;
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
        evc.view.hidden=YES;
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
        evc.view.hidden=YES;
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
        evc.view.hidden=YES;
        [self.view bringSubviewToFront:ovc.view];
        [self.view bringSubviewToFront:bar];
    }else if (index==3){
        if (!evc) {
            evc=[[MDEvaluationViewController alloc] init];
            [self.view addSubview:evc.view];
        }
        asvc.view.hidden=YES;
        pvc.view.hidden=YES;
        ovc.view.hidden=YES;
        evc.view.hidden=NO;
        [self.view bringSubviewToFront:evc.view];
        [self.view bringSubviewToFront:bar];
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];


}





@end
