//
//  MDRequestModel.m
//  MyDoctor
//
//  Created by 巫筠 on 15/12/4.
//  Copyright © 2015年 com.mingxing. All rights reserved.
//

#import "MDRequestModel.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
//#import "AFNetworkReachabilityManager.h"
//#import "AFHTTPRequestOperationManager.h"
#import "MDConst.h"
#import "GTMBase64.h"


@implementation MDRequestModel

-(void)starRequest
{
    
//    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
//    //data Get请求如此设置
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    
//    [manager POST:self.path parameters:self.parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSString * str = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
//        //回馈数据
//        NSLog(@"%@", str);
//        
//        NSArray *array = [str componentsSeparatedByString:@","];
//        NSArray *success=[array[0] componentsSeparatedByString:@":"];
//        
//        if ([success[1] isEqualToString:@"true"]) {
//            [[NSNotificationCenter defaultCenter]
//             postNotificationName:@"showBRSMainView" object:self];
//           
//        }
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"%@", error);
//    }];
//    
//    
    
    
    
    
//    self.ContentType = @"application/json";//设置请求数据类型
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
//    manager.requestSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:self.ContentType];
    [manager POST:self.path parameters:self.parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        if([responseObject isKindOfClass:[NSDictionary class]])
//        {
//            response = [[NSMutableDictionary alloc] initWithDictionary:responseObject];
//        }
//        else if ([responseObject isKindOfClass:[NSArray class]])
//        {
//            response = [[NSMutableArray alloc] initWithArray:responseObject];
//
//        }
        
        [self.delegate sendInfoFromRequest:responseObject andPath:self.path];

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        MDLog(@"%@",error.description);
    }];
}
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

@end











