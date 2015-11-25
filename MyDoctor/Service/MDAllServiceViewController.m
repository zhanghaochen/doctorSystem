//
//  MDAllServiceViewController.m
//  MyDoctor
//
//  Created by 张昊辰 on 15/11/24.
//  Copyright (c) 2015年 com.mingxing. All rights reserved.
//

#import "MDAllServiceViewController.h"

@interface MDAllServiceViewController ()

@end

@implementation MDAllServiceViewController

@synthesize tableView = _tableView;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self dataArray];
    [self TableView];
   
   

}

-(void)dataArray
{
    
}

-(void)TableView
{
    _tableView=[[UITableView alloc] initWithFrame:CGRectMake(0,0, appWidth, appHeight-64) style:UITableViewStylePlain];
    _tableView.separatorColor = [UIColor colorWithRed:223.0f/255.0f green:223.0f/255.0f blue:223.0f/255.0f alpha:1];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    _tableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    _tableView.allowsMultipleSelectionDuringEditing = YES;
    [self.view addSubview:_tableView];
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
