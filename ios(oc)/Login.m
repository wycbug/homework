//
//  Login.m
//  ios(oc)
//
//  Created by 王一成 on 2018/5/25.
//  Copyright © 2018年 wyc. All rights reserved.
//

#import "Login.h"

@implementation Login
- (void) verifyLogin:(NSString *) account passwd:(NSString *)passwd;
{
    // 1、创建URL资源地址
    NSURL *url = [NSURL URLWithString:@"https://wx.idsbllp.cn/api/verify"];
    // 2、创建Reuest请求
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    // 3、配置Request
    // 设置请求超时
    [request setTimeoutInterval:10.0];
    // 设置请求方法
    [request setHTTPMethod:@"POST"];
    // 设置头部参数
    //[request addValue:@"gzip" forHTTPHeaderField:@"Content-Encoding"];
    // 4、构造请求参数
    // 4.1、创建字典参数，将参数放入字典中，可防止程序员在主观意识上犯错误，即参数写错。
    NSDictionary *parametersDict = @{@"stuNum":account,@"idNum":passwd};
    // 4.2、遍历字典，以“key=value&”的方式创建参数字符串。
    NSMutableString *parameterString = [[NSMutableString alloc]init];
    int pos =0;
    
    for (NSString *key in parametersDict.allKeys) {
        // 拼接字符串
        [parameterString appendFormat:@"%@=%@", key, parametersDict[key]];
        if(pos<parametersDict.allKeys.count-1){
            [parameterString appendString:@"&"];
        }
        pos++;
    }
    // 4.3、NSString转成NSData数据类型。
    NSData *parametersData = [parameterString dataUsingEncoding:NSUTF8StringEncoding];
    // 5、设置请求报文
    [request setHTTPBody:parametersData];
    // 6、构造NSURLSessionConfiguration
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    // 7、创建网络会话
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    // 8、创建会话任务
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        // 10、判断是否请求成功
        if (error) {
           
            NSLog(@"post error :%@",error.localizedDescription);
           
           
        }else {
            [self getStatusSuccessful];
            // 如果请求成功，则解析数据。
            NSDictionary *object = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
            // 11、判断是否解析成功
            if (error) {
                
                NSLog(@"post error :%@",error.localizedDescription);
            }else {
                if ([[object valueForKey:@"status"] isEqual:@"200"]) {
                    [self getStatusSuccessful];
                    
                    
                }
                
                else{
                    [self getStatusErrot];
                    NSLog(@"字典不包含key:name");
                    
                }
                // 解析成功，处理数据，通过GCD获取主队列，在主线程中刷新界面。
                NSLog(@"post success :%@",object);
                
//                                    dispatch_async(dispatch_get_main_queue(), ^{
//
//                                    });
            }
        }
        
    }];
    // 9、执行任务
    [task resume];
}
- (void) getStatusErrot{
    _loginStatus = 1;
}
- (void) getStatusSuccessful{
    _loginStatus = 0;
}

@end
