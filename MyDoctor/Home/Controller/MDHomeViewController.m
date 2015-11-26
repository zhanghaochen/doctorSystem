//
//  MDHomeViewController.m
//  MyDoctor
//
//  Created by 张昊辰 on 15/11/24.
//  Copyright (c) 2015年 com.mingxing. All rights reserved.
//

#import "MDHomeViewController.h"
#import "MX_MASConstraintMaker.h"
#import "View+MASAdditions.h"
#import "MDnoticeCenterController.h"
#import "MDHospitalViewController.h"
#import "MDConsultDrupViewController.h"
#import "MDNurseViewController.h"
#import "MDActivityViewController.h"

@interface MDHomeViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    UITableView * _tableView;
    NSMutableArray * _listArray;
    UIScrollView * _headerView;
    int currentPage;
}

@end

@implementation MDHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    currentPage = 0;
    self.navigationItem.title=@"寻医问药";
    
    [self createView];
    
    [self setHeaderView];
    
    [self setNavigationBarWithrightBtn:@"通知" leftBtn:nil];
    
    //通知按钮点击
    [self.rightBtn addTarget:self action:@selector(noticeClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//通知按钮点击
-(void)noticeClick
{
    MDnoticeCenterController * notice = [[MDnoticeCenterController alloc] init];
    [self.navigationController pushViewController:notice animated:YES];
    self.tabBarController.tabBar.hidden = YES;
}

-(void)createView
{
    NSArray * group0 = @[@"greenlogo",@"寻医"];
    NSArray * group1 = @[@"purplelogo",@"问药"];
    NSArray * group2 = @[@"bluelogo",@"照护"];
    NSArray * group3 = @[@"greenlogo",@"活动"];
    
    if (_listArray == nil) {
        _listArray = [NSMutableArray arrayWithObjects:group0,group1,group2,group3, nil];
    }
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(21, 18, SCREENWIDTH - 42, self.view.frame.size.height - 18) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.bounces = YES;
    _tableView.showsHorizontalScrollIndicator = NO;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    [self.view addSubview:_tableView];
}

-(void)setHeaderView
{
    _headerView = [[UIScrollView alloc] initWithFrame:CGRectMake(21, 18, SCREENWIDTH - 42, (SCREENWIDTH - 42)*0.42)];
    CGFloat width = SCREENWIDTH - 42;
    _headerView.contentSize = CGSizeMake(width*3, width*0.42);
    _headerView.bounces = NO;
    _headerView.pagingEnabled = YES;
    _headerView.showsHorizontalScrollIndicator = NO;
    _headerView.delegate = self;
    [self.view addSubview:_headerView];
    
    NSMutableArray * imageArr = [[NSMutableArray alloc] initWithObjects:@"background",@"topImg",@"greenlogo", nil];
    
    for (int i = 0; i < imageArr.count; i ++) {
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(width * i, 0, width, width*0.42)];
        imageView.image = [UIImage imageNamed:imageArr[i]];
        [_headerView addSubview:imageView];
    }
    
    //UIpageController设置
    UIPageControl * pageController = [[UIPageControl alloc] initWithFrame:CGRectMake(_headerView.frame.size.width - 60, _headerView.frame.size.height - 15, 40, 10)];
    pageController.backgroundColor = [UIColor clearColor];
    pageController.numberOfPages = imageArr.count;
    pageController.currentPage = 0;
    pageController.pageIndicatorTintColor = [UIColor whiteColor];
    pageController.currentPageIndicatorTintColor = [UIColor colorWithRed:65.0/255.0 green:65.0/255.0 blue:65.0/255.0 alpha:1.0];
    pageController.center = CGPointMake(_headerView.frame.size.width - 40,  _headerView.frame.size.height - 10);
    [pageController addTarget:self action:@selector(pageController:) forControlEvents:UIControlEventValueChanged];
    pageController.tag = 100;
    [_tableView addSubview:pageController];
    
    [NSTimer scheduledTimerWithTimeInterval:2.5 target:self selector:@selector(timeChange:) userInfo:nil repeats:YES];
}

//自动滚动
-(void)timeChange:(NSTimer *)timer
{
    UIPageControl *pageControl = (UIPageControl *)[self.view viewWithTag:100];

    [UIView animateWithDuration:0.5 animations:^{
        _headerView.contentOffset = CGPointMake((SCREENWIDTH - 42)*currentPage, 0);

    }];
    if (_headerView.contentOffset.x > (SCREENWIDTH - 42)*2) {
            _headerView.contentOffset = CGPointMake(0, 0);
            currentPage = 0;
    }
    pageControl.currentPage = currentPage;
    currentPage ++;
}

#pragma mark - pageControl的方法
- (void)pageController:(UIPageControl *)pageControl
{
    currentPage = (int)pageControl.currentPage;
    [UIView animateWithDuration:0.5 animations:^{
        _headerView.contentOffset = CGPointMake((SCREENWIDTH - 42)*currentPage, 0);
    }];
    
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //由tag值找到pageControl
    UIPageControl *pageControl = (UIPageControl *)[self.view viewWithTag:100];
    //找到当前scrollView的偏移量
    CGPoint point = scrollView.contentOffset;
    //找到目前是第几页
    currentPage = point.x / (SCREENWIDTH - 42);
    //将页数赋给UIPageControl
    pageControl.currentPage = currentPage;
}

#pragma mark 协议方法

-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    _tableView.tableHeaderView = _headerView;
    [_tableView sendSubviewToBack:_headerView];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _listArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * iden = @"iden";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
    }
    
    cell.imageView.image = [UIImage imageNamed:_listArray[indexPath.section][0]];
    cell.textLabel.text = _listArray[indexPath.section][1];
    cell.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.7];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return (SCREENWIDTH - 42)/4;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15;
}

//填充每个cell间距的view，使之透明
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * view = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MDHospitalViewController * hospitalVC = [[MDHospitalViewController alloc] init];
    MDConsultDrupViewController * consultDrupVC = [[MDConsultDrupViewController alloc] init];
    MDNurseViewController * nurseVC = [[MDNurseViewController alloc] init];
    MDActivityViewController * activityVC = [[MDActivityViewController alloc] init];
    
    NSArray * controllers = @[hospitalVC,consultDrupVC,nurseVC,activityVC];
    [self.navigationController pushViewController:controllers[indexPath.section] animated:YES];
    self.tabBarController.tabBar.hidden = YES;
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
