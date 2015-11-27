//
//  BRSSignIn2ViewController.m
//  BRSClient
//
//  Created by 张昊辰 on 15/3/10.
//  Copyright (c) 2015年 minxing. All rights reserved.
//

#import "BRSSignIn2ViewController.h"
//#import <MXKit/MXNetModel.h>
//#import "BRSConfig.h"
//#import "BRSConst.h"
//#import "BRSTokenVO.h"
//#import "BRSSysUtil.h"
//#import <MXKit/MXKit.h>
#import "MX_MASConstraintMaker.h"
#import "View+MASAdditions.h"
#import "MDConst.h"
#import "BRSEndSignlnViewController.h"

#define autoSizeScaleX  (appWidth>320?appWidth/320:1)
#define autoSizeScaleY  (appHeight>568?appHeight/568:1)
#define T4FontSize (15*autoSizeScaleX)
@interface BRSSignIn2ViewController ()

@end

@implementation BRSSignIn2ViewController
{
    UITextField * number;
    UITextField * password;
    UITextField * password2;
    UITextField * IdNumber;
    
    UITextField *sexField;
    UIButton *maleButton;
    UIButton *femaleButton;
    int sex;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor=[UIColor whiteColor];
    UITapGestureRecognizer*tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Actiondo2)];
    [self.view addGestureRecognizer:tapGesture];
    [self textfield];
   
    [self setNavigationBarWithrightBtn:nil leftBtn:@"navigationbar_back"];
    //返回按钮点击
    [self.leftBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.title=@"注册";
    sex = 1;
}
-(void)textfield
{
    number = [[UITextField alloc] init];
    [number setBorderStyle:UITextBorderStyleLine]; //外框类型
    
    number.returnKeyType = UIReturnKeyNext;  //键盘返回类型
    number.delegate = self;
    number.keyboardType = UIKeyboardTypeDefault;//键盘显示类型
    number.tag=1;
    number.layer.borderColor=[[UIColor colorWithRed:222/255.0 green:222/255.0 blue:222/255.0 alpha:1]CGColor];
    number.layer.borderWidth= 1.0f;
    number.placeholder=@"名字";
    number.leftViewMode = UITextFieldViewModeAlways;
    
    IdNumber = [[UITextField alloc] init];
    [IdNumber setBorderStyle:UITextBorderStyleLine]; //外框类型
    IdNumber.returnKeyType = UIReturnKeyNext;  //键盘返回类型
    IdNumber.delegate = self;
    IdNumber.keyboardType = UIKeyboardTypeNumberPad;//键盘显示类型
    IdNumber.tag=22;
    IdNumber.placeholder=@"身份证号";
    IdNumber.leftViewMode = UITextFieldViewModeAlways;
    IdNumber.layer.borderColor=[[UIColor colorWithRed:222/255.0 green:222/255.0 blue:222/255.0 alpha:1]CGColor];
    IdNumber.layer.borderWidth= 1.0f;
    
    password = [[UITextField alloc] init];
    [password setBorderStyle:UITextBorderStyleLine]; //外框类型
    password.secureTextEntry = YES; //是否以密码形式显示
    password.returnKeyType = UIReturnKeyNext;  //键盘返回类型
    password.delegate = self;
    password.keyboardType = UIKeyboardTypeDefault;//键盘显示类型
    password.tag=2;
    password.placeholder=@"密码";
    password.leftViewMode = UITextFieldViewModeAlways;
    password.layer.borderColor=[[UIColor colorWithRed:222/255.0 green:222/255.0 blue:222/255.0 alpha:1]CGColor];
    password.layer.borderWidth= 1.0f;
    password2 = [[UITextField alloc] init];
    [password2 setBorderStyle:UITextBorderStyleLine]; //外框类型
    password2.secureTextEntry = YES; //是否以密码形式显示
    password2.returnKeyType = UIReturnKeyGo;  //键盘返回类型
    password2.delegate = self;
    password2.keyboardType = UIKeyboardTypeDefault;//键盘显示类型
    password2.layer.borderColor=[[UIColor colorWithRed:222/255.0 green:222/255.0 blue:222/255.0 alpha:1]CGColor];
    password2.layer.borderWidth= 1.0f;
    password2.tag=3;
    password2.placeholder=@"再次输入密码";
    password2.leftViewMode = UITextFieldViewModeAlways;
    
    [self setNavigationBarWithrightBtn:@"下一步" leftBtn:nil];
    [self.rightBtn addTarget:self action:@selector(next:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:number];
    [self.view addSubview:IdNumber];
    [self.view addSubview:password];
    [self.view addSubview:password2];
    
    
    
    sexField = [[UITextField alloc] init];
    [sexField setBorderStyle:UITextBorderStyleLine]; //外框类型
    
    sexField.returnKeyType = UIReturnKeyNext;  //键盘返回类型
    sexField.delegate = self;
    sexField.keyboardType = UIKeyboardTypeDefault;//键盘显示类型
    sexField.tag=1;
    sexField.layer.borderColor=[[UIColor colorWithRed:222/255.0 green:222/255.0 blue:222/255.0 alpha:1]CGColor];
    sexField.layer.borderWidth= 1.0f;
    sexField.placeholder=@"性别";
    sexField.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:sexField];
    
    maleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [maleButton setImage:[UIImage imageNamed:@"绿色单选"] forState:UIControlStateNormal];
    [maleButton setTitle:@"男性" forState:UIControlStateNormal];
    [maleButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.view addSubview:maleButton];
    [maleButton addTarget:self action:@selector(maleSelect) forControlEvents:UIControlEventTouchUpInside];
    
    femaleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [femaleButton setImage:[UIImage imageNamed:@"灰色单选"] forState:UIControlStateNormal];
    [femaleButton setTitle:@"女性" forState:UIControlStateNormal];
    [femaleButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.view addSubview:femaleButton];
    [femaleButton addTarget:self action:@selector(femaleSelect) forControlEvents:UIControlEventTouchUpInside];

    [number mas_makeConstraints:^(MX_MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.view.mas_top).with.offset(85);
        make.left.equalTo(self.view.mas_left).with.offset(15);
        make.right.equalTo(self.view.mas_right).with.offset(-15);
        make.height.mas_equalTo(40);
    }];
    [sexField mas_makeConstraints:^(MX_MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(135);
        make.left.equalTo(self.view.mas_left).with.offset(15);
        make.right.equalTo(self.view.mas_right).with.offset(-15);
        make.height.mas_equalTo(40);
    }];
    
    [maleButton mas_makeConstraints:^(MX_MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(40+15);
        make.top.equalTo(self.view.mas_top).with.offset(135);
//        make.bottom.equalTo(sexField.mas_bottom).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(80, 40));
    }];
    
    [femaleButton mas_makeConstraints:^(MX_MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(120+15);
        make.size.mas_equalTo(CGSizeMake(80, 40));
        make.top.equalTo(self.view.mas_top).with.offset(135);
//        make.bottom.equalTo(sexField.mas_bottom).with.offset(0);
    }];
    
    
    [IdNumber mas_makeConstraints:^(MX_MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.view.mas_top).with.offset(185);
        make.left.equalTo(self.view.mas_left).with.offset(15);
        make.right.equalTo(self.view.mas_right).with.offset(-15);
        make.height.mas_equalTo(40);
    }];
    
    
    [password mas_makeConstraints:^(MX_MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.view.mas_top).with.offset(235);
        make.left.equalTo(self.view.mas_left).with.offset(15);
        make.right.equalTo(self.view.mas_right).with.offset(-15);
        make.height.mas_equalTo(40);
    }];
    
    [password2 mas_makeConstraints:^(MX_MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.view.mas_top).with.offset(285);
        make.left.equalTo(self.view.mas_left).with.offset(15);
        make.right.equalTo(self.view.mas_right).with.offset(-15);
        make.height.mas_equalTo(40);
    }];
    
 
}


-(void)maleSelect {
    sex = 1;
    [maleButton setImage:[UIImage imageNamed:@"绿色单选"] forState:UIControlStateNormal];
    [femaleButton setImage:[UIImage imageNamed:@"灰色单选"] forState:UIControlStateNormal];

}

-(void)femaleSelect {
    sex = 2;
    [femaleButton setImage:[UIImage imageNamed:@"绿色单选"] forState:UIControlStateNormal];
    [maleButton setImage:[UIImage imageNamed:@"灰色单选"] forState:UIControlStateNormal];


}

-(void)next:(UIButton *)tunch
{
    if(![number.text length]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提醒" message:@"请输入姓名" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        alert.delegate =self;
        [alert setTag:999];
        [alert show];
        return;
    }
    if (![password.text length]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提醒" message:@"请输入密码" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        alert.delegate =self;
        [alert setTag:999];
        [alert show];
        return;
    }
    
    if ([password.text isEqualToString:password2.text]&&[password.text length]>=6) {
        
//        MXNetModel *netModel = [MXNetModel shareNetModel];
//        NSString *tmpUrl = @"/connectors/regist_user";
//        NSString * url=[NSString stringWithFormat:@"%@:%@%@",MX_URL,MX_PORT,tmpUrl];
//        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
//        [dic setObject:self.login_name forKey:@"login_name"];
//        [dic setObject:self.auth_code forKey:@"auth_code"];
//        [dic setObject:password.text forKey:@"password"];
//        [dic setObject:number.text forKey:@"name"];
//        [dic setObject:client_id forKey:@"app_id"];
//        [dic setObject:client_secret forKey:@"app_secret"];
//        [dic setObject:@"password" forKey:@"grant_type"];
//        [dic setObject:[NSNumber numberWithInt:sex] forKey:@"sex"];
//        
//        [netModel startRequset:@"POST" withURL:url withParams:dic withAttachment:nil withIndicator:YES withCallback:^(id object, MXError *error) {
//            if(object && !error) {
//                BRSTokenVO *loginVO = [MTLJSONAdapter modelOfClass:[BRSTokenVO class] fromJSONDictionary:object error:nil];
//                [self cacheToken:loginVO];
                NSUserDefaults *stdDefault = [NSUserDefaults standardUserDefaults];
                [stdDefault setObject:self.login_name forKey:@"user_name"];
                [stdDefault setObject:number.text forKey:@"Name"];
//                NSLog(@"loginVO == %@", loginVO);
//                if (loginVO) {
                    BRSEndSignlnViewController * esv=[[BRSEndSignlnViewController alloc] init];

                    [self.navigationController pushViewController:esv animated:YES];
                    
//                    MXKit *MXObj = [MXKit shareMXKit];
//                    [MXObj init:MX_URL withPort:MX_PORT withMqttUrl:MX_IM_URL withMqttPort:MX_IM_PORT];
//                    [MXObj login:_login_name withPassword:password.text withCallback:^(id result, MXError *error){
//                    }];
//                }
//            } else {
//                NSString * str1=[NSString stringWithFormat:@"%@",error];
//                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提醒" message:str1 delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
//                alert.delegate =self;
//                [alert setTag:999];
//                [alert show];
//            }
//            NSLog(@"reply == %@", object);
//            NSLog(@"error==%@",error);
//        }];
//
    }else if (![password.text isEqualToString:password2.text]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提醒" message:@"密码不一致" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        alert.delegate =self;
        [alert setTag:999];
        [alert show];
    }else if ([password.text length]<6){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提醒" message:@"密码少于6位" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        alert.delegate =self;
        [alert setTag:999];
        [alert show];
    }
}
//

//-(void) cacheToken:(BRSTokenVO*)token {
//    if (token && token != tokenObject) {
//        tokenObject = token;
//        NSString *localPaths = NSHomeDirectory();
//        localPaths = [localPaths stringByAppendingPathComponent:@"Documents"];
//        NSString *filePath = [localPaths stringByAppendingPathComponent:@"token"];
//        [NSKeyedArchiver archiveRootObject:tokenObject toFile:filePath];
//    }
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField.tag==1)
    {
        UITextField * textField2=(id)[self.view viewWithTag:22];
        [textField2 becomeFirstResponder];
    }else if (textField.tag==22){
        UITextField * textField2=(id)[self.view viewWithTag:2];
        [textField2 becomeFirstResponder];
    }
    else if(textField.tag==2){
        UITextField * textField2=(id)[self.view viewWithTag:3];
        [textField2 becomeFirstResponder];
    }else{
        [textField resignFirstResponder];
    }
    return YES;
}
- (BOOL)textField:(UITextField*)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([password.text length]>0&&[number.text length]>0&&[number.text length]>0) {
        
    }
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if(textField == sexField) {
        return NO;
    }
    return YES;
}

-(void)back

{
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(void)Actiondo2
{
    [number resignFirstResponder];
    [password resignFirstResponder];
    [password2 resignFirstResponder];
    [IdNumber resignFirstResponder];
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
