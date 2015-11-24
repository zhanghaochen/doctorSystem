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

@interface MDHomeViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView * _tableView;
    NSMutableArray * _listArray;
}

@end

@implementation MDHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"寻医问药";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createView];
    
//    UIView *view=[[UIView alloc] init];
//    view.backgroundColor=[UIColor redColor];
//    [self.view addSubview:view];
//    [view mas_makeConstraints:^(MX_MASConstraintMaker *make) {
//        make.top.equalTo(self.view.mas_top).with.offset(67);
//        make.left.equalTo(self.view.mas_left).with.offset(15);
//        make.size.mas_equalTo(CGSizeMake(80, 40));
//    }];
    
    /*
    UIView * scrollView = [[UIView alloc] init];
    scrollView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:scrollView];
    
    [scrollView mas_makeConstraints:^(MX_MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(TOPHEIGHT+18);
        make.left.equalTo(self.view.mas_left).with.offset(21);
        make.right.equalTo(self.view.mas_right).with.offset(-21);
        make.size.mas_equalTo(CGSizeMake(0, (SCREENWIDTH - 42)/(665.0/291.0)));
    }];
    
    
    UIButton * button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:button1];
    UIButton * button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:button2];
    UIButton * button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button3 setBackgroundColor:[UIColor redColor]];
    [self.view addSubview: button3];
    UIButton * button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button4 setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:button4];
    
    [button1 mas_makeConstraints:^(MX_MASConstraintMaker *make) {
        make.top.equalTo(scrollView.mas_bottom).with.offset(20);
        make.left.equalTo(self.view.mas_left).with.offset(21);
        make.right.equalTo(self.view.mas_right).with.offset(-21);
        make.height.equalTo(button2);
    }];
    
    
    [button2 mas_makeConstraints:^(MX_MASConstraintMaker *make) {
        make.top.equalTo(button1.mas_bottom).with.offset(14);
        make.left.equalTo(self.view.mas_left).with.offset(21);
        make.right.equalTo(self.view.mas_right).with.offset(-21);
        make.height.equalTo(button1);
    }];
    
    [button3 mas_makeConstraints:^(MX_MASConstraintMaker *make) {
        make.top.equalTo(button2.mas_bottom).with.offset(14);
        make.left.equalTo(self.view.mas_left).with.offset(21);
        make.right.equalTo(self.view.mas_right).with.offset(-21);
        make.height.equalTo(button1);
    }];
    
    [button4 mas_makeConstraints:^(MX_MASConstraintMaker *make) {
        make.top.equalTo(button3.mas_bottom).with.offset(14);
        make.left.equalTo(self.view.mas_left).with.offset(21);
        make.right.equalTo(self.view.mas_right).with.offset(-21);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-14-self.navigationController.navigationBar.frame.size.height);
        make.height.equalTo(button1);
    }];
    */
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)createView
{
    NSArray * group0 = @[@"greenlogo",@"询医"];
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
    [self.view addSubview:_tableView];
    
    UIView * headerView = [[UIView alloc] init];
//    (SCREENWIDTH - 42, (SCREENWIDTH - 42)*0.42)
    [headerView setFrame:CGRectMake(0, 0, SCREENWIDTH - 42, (SCREENWIDTH - 42)*0.42)];
    headerView.backgroundColor = [UIColor grayColor];
    _tableView.tableHeaderView = headerView;
    

}


#pragma mark 协议方法

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
    cell.backgroundColor = [UIColor colorWithRed:1 green:1 blue:0 alpha:0.95];
    
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
