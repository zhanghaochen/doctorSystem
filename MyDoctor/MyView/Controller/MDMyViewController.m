//
//  MDMyViewController.m
//  MyDoctor
//
//  Created by 巫筠 on 15/11/25.
//  Copyright © 2015年 com.mingxing. All rights reserved.
//

#import "MDMyViewController.h"
#import "MDMyViewItem.h"
#import "MX_MASConstraintMaker.h"
#import "View+MASAdditions.h"

@interface MDMyViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView * _tableView;

}

@property (nonatomic,strong) NSMutableArray * dataList;

@end

@implementation MDMyViewController

//对列表数据进行懒加载
-(NSMutableArray *)dataList
{
    if (_dataList == nil) {
        _dataList = [[NSMutableArray alloc] init];
        
        MDMyViewItem * group0 = [MDMyViewItem itemsWithIcon:@"mydoctor" andTitle:@"我的医生" andRightImage:@"arrow"];
        
        MDMyViewItem * group1 = [MDMyViewItem itemsWithIcon:@"notes" andTitle:@"服务记录" andRightImage:@"arrow"];
        MDMyViewItem * group2 = [MDMyViewItem itemsWithIcon:@"feedback" andTitle:@"意见反馈" andRightImage:@"arrow"];
        
        [_dataList addObject:group0];
        [_dataList addObject:group1];
        [_dataList addObject:group2];
        
    }
    return _dataList;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"个人信息";
    
    [self setNavigationBarWithrightBtn:@"设置" leftBtn:nil];
    
    [self createView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createView
{
    UIImageView * headerView = [[UIImageView alloc] init];
    headerView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:headerView];
    
    UIView * nameView = [[UIView alloc] init];
    nameView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:nameView];
    
    [headerView mas_makeConstraints:^(MX_MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(21);
        make.top.equalTo(self.view.mas_top).with.offset(18+TOPHEIGHT);
        make.size.mas_equalTo(CGSizeMake(167.0/750.0*SCREENWIDTH, 167.0/750.0*SCREENWIDTH));
    }];
    
    [nameView mas_makeConstraints:^(MX_MASConstraintMaker *make) {
        make.left.equalTo(headerView.mas_right).with.offset(8);
        make.right.equalTo(self.view.mas_right).with.offset(-21);
        make.height.equalTo(headerView.mas_height);
        make.top.equalTo(self.view.mas_top).with.offset(18+TOPHEIGHT);
    }];
    
    _tableView = [[UITableView alloc] init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.bounces = NO;
    //去掉下面多余的线
    _tableView.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:_tableView];
    
    [_tableView mas_makeConstraints:^(MX_MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.equalTo(headerView.mas_bottom).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(SCREENWIDTH - 42, 400));

    }];
}

#pragma mark - 代理方法

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataList.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 8;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return (SCREENWIDTH-16*2)/(687.0/92.0);
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString * iden = @"iden";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
    }
    MDMyViewItem * item = _dataList[indexPath.section];
    cell.textLabel.text = item.title;
    cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:item.rightImg]];
    cell.imageView.image = [UIImage imageNamed:item.icon];
    cell.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.7];
        return cell;
}

//填充每个cell间距的view，使之透明
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * view = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    return view;
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
