//
//  ViewController.m
//  MyDoctor
//
//  Created by 张昊辰 on 15/11/23.
//  Copyright (c) 2015年 com.mingxing. All rights reserved.
//

#import "MDBaseViewController.h"

@interface MDBaseViewController ()

@end

@implementation MDBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //自定义title的字体
    NSMutableDictionary *titleBarAttributes = [NSMutableDictionary dictionaryWithDictionary: [[UINavigationBar appearance] titleTextAttributes]];
    [titleBarAttributes setValue:[UIFont fontWithName:@"Bold Heiti SC" size:18] forKey:NSFontAttributeName];
    [[UINavigationBar appearance] setTitleTextAttributes:titleBarAttributes];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}


@end
