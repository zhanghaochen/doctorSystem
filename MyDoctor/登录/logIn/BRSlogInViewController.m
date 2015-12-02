//
//  BRSlogInViewController.m
//  BRSClient
//
//  Created by 张昊辰 on 15/3/10.
//  Copyright (c) 2015年 minxing. All rights reserved.
//

#import "BRSlogInViewController.h"
#import "BRSSignInViewController.h"
#import "BRSTextField.h"
#import "MX_MASConstraintMaker.h"
#import "View+MASAdditions.h"
#import "MDConst.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "GTMBase64.h"

@interface BRSlogInViewController ()

@end

@implementation BRSlogInViewController
{
    BRSTextField * logInField;
    BRSTextField * password;
    UIView * view1;
    UIButton * button;
    //下载进度
    NSProgress * _progress;
    NSURLSessionDownloadTask * _task;

}
#define autoSizeScaleX  (appWidth>320?appWidth/320:1)
#define autoSizeScaleY  (appHeight>568?appHeight/568:1)
#define T4FontSize (15*autoSizeScaleX)
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    CGRect rx = [ UIScreen mainScreen ].bounds;
    
    UIImage * draw = [UIImage imageNamed:@"首页图标"];
    UIImageView *drawView = [[UIImageView alloc]initWithImage:draw];
    [self.view addSubview:drawView];
    
    [drawView mas_makeConstraints:^(MX_MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.view.mas_top).with.offset(90);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];

//    self.view.backgroundColor=[UIColor colorWithRed:226/255.0 green:226/255.0 blue:226/255.0 alpha:1];
    UITapGestureRecognizer*tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Actiondo)];
    [self.view addGestureRecognizer:tapGesture];
    [self logInView];
    
    //1.检测网络状态
    [self monitorNetworkType];
    //5.post请求
    [self jsonGetRequest];

    
}
- (void)monitorNetworkType
{
    //AFNetWorking通过发送网络请求的方式判断当前网络状态，需要选择一个请求。推荐使用门户网站网址
    //请求队列的管理员
    AFHTTPRequestOperationManager  * manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:@"www.baidu.com"]];
    
    //    void (^block)(AFNetworkReachabilityStatus status);
    //    block = ^(AFNetworkReachabilityStatus status){
    //
    //    };
    
    //监控网络状态
    [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status){
        //这是一个代码块，是rootviewcontroller的代码块，但是由manager.reachabilityManager 调用
        //status是manager.reachabilityManager传过来的参数，也就是说，发送方通过这个参数，将网络状态发过来了。
        if (status == AFNetworkReachabilityStatusReachableViaWiFi) {
            NSLog(@"WiFi");
        } else if (status == AFNetworkReachabilityStatusReachableViaWWAN) {
            NSLog(@"GPRS/3G");
        } else if (status == AFNetworkReachabilityStatusNotReachable){
            NSLog(@"网络未连接");
        }
        
    }];
    
    //启动网络监控
    [manager.reachabilityManager startMonitoring];
    //当发生网络状态变化，回调block
    
}

#pragma mark - GET请求 JSON数据
- (void)jsonGetRequest
{
    //创建urlString
    NSString * urlString = @"http://rmabcdef001:8080/CommunityWs/servlet/ShequServlet?b=";
    
    NSString * nameAndPassword=@"10002@`zhanghaochen@`111111";
    nameAndPassword=[self GTMEncodeTest:nameAndPassword];
    
    urlString=[NSString stringWithFormat:@"%@%@",urlString,nameAndPassword];
    
    //数据请求的队列管理器，单例
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    
    
    //解析json时出现问题，需要设置文件的内容
    //如此设置就会进行JSON解析
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    
    
    //发起get请求，第一个参数是请求的url字符串，第二个参数在get中传nil
    //后两个block，意思是成功调用block，失败调用block
    [manager GET:urlString parameters:nil success:
     ^(AFHTTPRequestOperation * operation, id responseObject){
         
         //JSON数据已经解析过了
         NSLog(@"%@", responseObject);
         //接下来要做的就是将数据从字典中取出放入数据源
         //在这里写填充数据源，可以调一个函数完成
     }
         failure:
     ^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"%@", error);
     }];
    
    
}
#pragma mark - POST请求
- (void)postRequest
{
    NSString * url = @"http://rmabcdef001:8080/CommunityWs/servlet/ShequServlet?b=";
    
    
//    NSString* encodeStr = @"MTAwMDFAYDFAYDJAYDNAYDRAYDVAYHpoYW5nc2FuQGAxMzgwMDAwMTExMUBgMTIzNDU2QGA5QGAxMEBgMTE";
    
//    NSString* encodeStr = @"MTAwMDJAYDFAYDJAYDNAYDRAYDVAYGxpeWFuZzFAYDEyMzQ1Ng==";
//    
//    NSString* decodeResult = nil;
//    
//    NSData* encodeData = [encodeStr dataUsingEncoding:NSUTF8StringEncoding];
//    
//    NSData* decodeData = [GTMBase64 decodeData:encodeData];
//    
//    decodeResult = [[NSString alloc] initWithData:decodeData encoding:NSUTF8StringEncoding];
//    
//    NSLog(@"%@",decodeResult);
    
    
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    
    //data Get请求如此设置
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //post键值对
    NSDictionary * dict = @{@"username":@"John", @"password":@"89091", @"message":@"hahahahaha"};
    
    [manager POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString * str = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        //回馈数据
        NSLog(@"%@", str);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
    }];
    
}

-(void)logInView
{
    view1=[[UIView alloc] init];
    view1.backgroundColor=[UIColor clearColor];
    logInField = [[BRSTextField alloc] init];
//    logInField=[[BRSTextField alloc] initWithFrame:CGRectMake(0, 0, 240, 30) Icon:image];
    [logInField setBorderStyle:UITextBorderStyleRoundedRect]; //外框类型
    logInField.backgroundColor=[UIColor whiteColor];
//    logInField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter; //设置居中输入
//    logInField.textAlignment = NSTextAlignmentLeft;
    logInField.placeholder = @"请输入手机号"; //默认显示的字
    [logInField setValue:[UIFont boldSystemFontOfSize:(15*(appWidth>320?appWidth/320:1))] forKeyPath:@"_placeholderLabel.font"];

    logInField.returnKeyType = UIReturnKeyNext;  //键盘返回类型
    logInField.delegate = self;
    logInField.keyboardType = UIKeyboardTypeNumberPad;//键盘显示类型
    logInField.layer.backgroundColor=(__bridge CGColorRef)([UIColor colorWithRed:222/255.0 green:222/255.0 blue:222/255.0 alpha:1]);
    UIImageView *image=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"登录-框-图标1"]];
    logInField.leftView=image;
    logInField.leftViewMode = UITextFieldViewModeAlways;
    logInField.tag=1;
    
    password = [[BRSTextField alloc] init];
    [password setBorderStyle:UITextBorderStyleRoundedRect]; //外框类型
    password.secureTextEntry = YES; //是否以密码形式显示
    password.placeholder = @"密码"; //默认显示的字
    password.returnKeyType = UIReturnKeyGo;  //键盘返回类型
    password.delegate = self;
    [password setValue:[UIFont boldSystemFontOfSize:T4FontSize] forKeyPath:@"_placeholderLabel.font"];
    password.keyboardType = UIKeyboardTypeDefault;//键盘显示类型
    password.layer.backgroundColor=(__bridge CGColorRef)([UIColor colorWithRed:222/255.0 green:222/255.0 blue:222/255.0 alpha:1]);
    UIImageView *image1=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"登录-框-图标2"]];
    password.leftView=image1;
    password.leftViewMode = UITextFieldViewModeAlways;
    password.tag=2;
    
    UIButton * button11=[[UIButton alloc] init];
    [button11 setBackgroundColor:[UIColor clearColor]];
    [button11 setTitle:[NSString stringWithFormat:@"忘记密码?"] forState:UIControlStateNormal];
    button11.titleLabel.font=[UIFont systemFontOfSize:13*autoSizeScaleX];
    [button11 setTitleColor:[UIColor colorWithRed:50/255.0 green:119/255.0 blue:154/255.0 alpha:1] forState:UIControlStateNormal];
    [button11 addTarget:self action:@selector(forget:) forControlEvents:UIControlEventTouchUpInside];
    
    button=[[UIButton alloc] init];
//    [button setBackgroundImage:[UIImage imageNamed:@"按钮"] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor clearColor];
    button.layer.borderColor = [[UIColor whiteColor] CGColor];
    button.layer.borderWidth = 2;
    button.layer.cornerRadius = 6;
    button.layer.masksToBounds = YES;
    [button setTitle:[NSString stringWithFormat:@"登录"] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRed:50/255.0 green:119/255.0 blue:154/255.0 alpha:1] forState:UIControlStateNormal];

    [button addTarget:self action:@selector(tunch:) forControlEvents:UIControlEventTouchUpInside];
    button.enabled=NO;
    
    [self.view addSubview:view1];
    [view1 addSubview:logInField];
    [view1 addSubview:password];
    [view1 addSubview:button11];
    [view1 addSubview:button];
    CGRect rx = [ UIScreen mainScreen ].bounds;
    [view1 mas_makeConstraints:^(MX_MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        if (appHeight==480) {
            make.top.equalTo(self.view.mas_top).with.offset(rx.size.height/2+18-(90*autoSizeScaleY));
        }else{
            make.top.equalTo(self.view.mas_top).with.offset(rx.size.height/2-(90*autoSizeScaleY));
        }
        make.size.mas_equalTo(CGSizeMake(rx.size.width, 240));
    }];
    
    [logInField mas_makeConstraints:^(MX_MASConstraintMaker *make) {
        make.centerX.equalTo(view1.mas_centerX);
        make.top.equalTo(view1.mas_top).with.offset(20*autoSizeScaleY);
        make.left.equalTo(view1.mas_left).with.offset(18*autoSizeScaleX);
        make.right.equalTo(view1.mas_right).with.offset(-18*autoSizeScaleX);
        make.height.mas_equalTo(44*autoSizeScaleY);
    }];
    NSLog(@"%f,%f,%f",logInField.frame.origin.x,logInField.frame.origin.y,logInField.frame.size.width);
    [password mas_makeConstraints:^(MX_MASConstraintMaker *make) {
        make.centerX.equalTo(view1.mas_centerX);
        make.top.equalTo(view1.mas_top).with.offset(70*autoSizeScaleY);
        make.left.equalTo(view1.mas_left).with.offset(18*autoSizeScaleX);
        make.right.equalTo(view1.mas_right).with.offset(-18*autoSizeScaleX);
        make.height.mas_equalTo(44*autoSizeScaleY);
    }];
    [button11 mas_makeConstraints:^(MX_MASConstraintMaker *make) {
        make.top.equalTo(view1.mas_top).with.offset(116*autoSizeScaleY);
        make.right.equalTo(view1.mas_right).with.offset(-26*autoSizeScaleX);
        make.size.mas_equalTo(CGSizeMake(80, 20));
    }];
    [button mas_makeConstraints:^(MX_MASConstraintMaker *make) {
        make.centerX.equalTo(view1.mas_centerX);
        make.top.equalTo(view1.mas_top).with.offset(138*autoSizeScaleY);
        make.left.equalTo(view1.mas_left).with.offset(18*autoSizeScaleX);
        make.right.equalTo(view1.mas_right).with.offset(-18*autoSizeScaleX);
        make.height.mas_equalTo(42*autoSizeScaleY);
    }];
    UIButton * button1=[[UIButton alloc] init];
//    button1.layer.cornerRadius = 4;
//    button1.layer.masksToBounds = YES;
//    button1.layer.borderWidth = 1;
//    button1.layer.borderColor = [[UIColor colorWithRed:222/255.0 green:222/255.0 blue:222/255.0 alpha:1]CGColor];
    [button1 setTitleColor:[UIColor colorWithRed:50/255.0 green:119/255.0 blue:154/255.0 alpha:1] forState:UIControlStateNormal];
    button1.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"注册按钮"]];
    [button1 addTarget:self action:@selector(tunch1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    button1.frame = CGRectMake(appWidth/2-68/2, appHeight-55, 68, 25);
    NSUserDefaults * stdDefault = [NSUserDefaults standardUserDefaults];
    NSString * str=[stdDefault objectForKey:@"user_name"];
    logInField.text=str;
    
    
    UIButton * back=[[UIButton alloc] init];
    [back addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    back.layer.borderColor = [[UIColor colorWithRed:228/255.0 green:71/255.0 blue:78/255.0 alpha:1] CGColor];
    back.layer.borderWidth = 1;
    back.layer.cornerRadius = 5;
    [back setBackgroundColor:[UIColor clearColor]];
    back.titleLabel.font=[UIFont systemFontOfSize:15];
    [back setTitle:@"返回" forState:UIControlStateNormal];
    [back setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:back];
    [back mas_makeConstraints:^(MX_MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(30*autoSizeScaleY);
        make.left.equalTo(self.view.mas_left).with.offset(20);
        make.size.mas_equalTo(CGSizeMake(50,25));
    }];
}
-(void)back:(UIButton *)button
{
    [self dismissViewControllerAnimated:YES completion:^{
        
        NSLog(@"back");
    }];

    [[NSNotificationCenter defaultCenter] postNotificationName:@"backselected1" object:self];
    
}
-(void)tunch:(UIButton *)tunch
{
    button.enabled = NO;
//    MXKit *MXObj = [MXKit shareMXKit];
//    [MXObj init:MX_URL withPort:MX_PORT withMqttUrl:MX_IM_URL withMqttPort:MX_IM_PORT];
//    [MXObj login:logInField.text withPassword:password.text withCallback:^(id result, MXError *error){
//        //login success
//        NSLog(@"result==%@",result);
//        NSLog(@"error==%@",error);
//        if(result && !error) {
        [[NSNotificationCenter defaultCenter]
     postNotificationName:@"showBRSMainView" object:self];
            NSUserDefaults *stdDefault = [NSUserDefaults standardUserDefaults];
            [stdDefault setObject:logInField.text forKey:@"user_name"];
//        }else{
//            NSString * str=[NSString stringWithFormat:@"%@",error];
//            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提醒" message:str delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
//                alert.delegate =self;
//                [alert setTag:999];
//                [alert show];
//            button.enabled = NO;
//        }
//    }];
//
    
    [self dismissViewControllerAnimated:YES completion:^{
        
        NSLog(@"back");
    }];

    
}
-(void)tunch1:(UIButton *)tunch
{
    BRSSignInViewController * sic=[[BRSSignInViewController alloc] init];
    sic.navigationItem.title=@"注册";
    sic.type=0;
    [self.navigationController pushViewController:sic animated:YES];
}
-(void)forget:(UIButton *)forget
{
    BRSSignInViewController * sic=[[BRSSignInViewController alloc] init];
    sic.navigationItem.title=@"手机号验证";
    sic.type=1;
    sic.loseNumber=logInField.text;
    [self.navigationController pushViewController:sic animated:YES];
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{

    [view1 mas_updateConstraints:^(MX_MASConstraintMaker *make) {
        CGRect rx = [ UIScreen mainScreen ].bounds;
        make.top.equalTo(self.view.mas_top).with.offset(rx.size.height/2-165);
    }];
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [view1 mas_updateConstraints:^(MX_MASConstraintMaker *make) {
        CGRect rx = [ UIScreen mainScreen ].bounds;
        if (appHeight==480) {
            make.top.equalTo(self.view.mas_top).with.offset(rx.size.height/2+18-(90*autoSizeScaleY));
        }else{
            make.top.equalTo(self.view.mas_top).with.offset(rx.size.height/2-(90*autoSizeScaleY));
        }
    }];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField.tag==1)
    {
        UITextField * textField2=(id)[self.view viewWithTag:2];
        [textField2 becomeFirstResponder];
    }else{
        [textField resignFirstResponder];
        [self tunch:nil];
    }
    return YES;
}
//textfield被改变
- (BOOL)textField:(UITextField*)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([logInField.text length]==11) {
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.enabled=YES;
    }else{
        [button setTitleColor:[UIColor colorWithRed:194.0/255.0 green:224.0/255.0 blue:239.0/255.0 alpha:1]forState:UIControlStateNormal];
        button.enabled=NO;
    }
    return YES;
}
-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)Actiondo
{
    [logInField resignFirstResponder];
    [password resignFirstResponder];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//转吗
-(NSString *)GTMEncodeTest:(NSString *)text

{
    
    NSString* originStr = text;
    
    NSString* encodeResult = nil;
    
    NSData* originData = [originStr dataUsingEncoding:NSUTF8StringEncoding];
    
    NSData* encodeData = [GTMBase64 encodeData:originData];
    
    encodeResult = [[NSString alloc] initWithData:encodeData encoding:NSUTF8StringEncoding];
    
    return encodeResult;
}


/**
 
 * GTM 解码
 
 */

-(NSString *)GMTDecodeTest:(NSString *)text

{
    
    NSString* encodeStr = text;
    
    NSString* decodeResult = nil;
    
    NSData* encodeData = [encodeStr dataUsingEncoding:NSUTF8StringEncoding];
    
    NSData* decodeData = [GTMBase64 decodeData:encodeData];
    
    decodeResult = [[NSString alloc] initWithData:decodeData encoding:NSUTF8StringEncoding];
    
    return decodeResult;
}


@end
