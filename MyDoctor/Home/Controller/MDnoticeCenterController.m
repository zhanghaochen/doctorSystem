//
//  MDnoticeCenterController.m
//  MyDoctor
//
//  Created by 巫筠 on 15/11/25.
//  Copyright © 2015年 com.mingxing. All rights reserved.
//

#import "MDnoticeCenterController.h"
#import "MDnoticeCenterCell.h"
#import "MDNurseRootViewController.h"

@interface MDnoticeCenterController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView * _tableView;
}

@property(nonatomic,strong) NSMutableArray * dataSource;

@end

@implementation MDnoticeCenterController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"通知公告";
    
    [self setNavigationBarWithrightBtn:nil leftBtn:@"navigationbar_back"];
    //返回按钮点击
    [self.leftBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self createTableView];
    // Do any additional setup after loading the view.
}

-(void)backBtnClick
{
    [self.navigationController popViewControllerAnimated:YES
     ];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createTableView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(21, TOPHEIGHT, appWidth - 42, appHeight - TOPHEIGHT) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];

}

#pragma mark - TableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return _tableView.width/4;
}

//填充每个cell间距的view，使之透明
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * view = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * iden = @"iden";
    MDnoticeCenterCell * cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (cell == nil) {
        cell = [[MDnoticeCenterCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:iden];
    }
    cell.backgroundColor=ColorWithRGB(255, 255, 255, 0.7);
    for (UIView *item in cell.contentView.subviews) {
        [item removeFromSuperview];
    }
//    if ([_dataSource count]>0) {
//        MDDrugVO * service=dataArray[indexPath.row];
//        cell.name=service.Namedrug;
//        cell.number=service.numberDrug;
//        cell.money=service.moneyDrug;
//    }
//
    cell.title = @"标题";
    cell.time = @"2015-09-08";
    cell.detail = @"内容:从健康的四大基石（合理膳食、适量运动、戒烟";
    
    [cell drawCell];

    
       return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MDNurseRootViewController * noticeDetail = [[MDNurseRootViewController alloc] init];
    noticeDetail.titleLab = @"通知公告";
    noticeDetail.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:noticeDetail animated:YES];
    
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
