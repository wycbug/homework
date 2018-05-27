//
//  NetWork.m
//  ios(oc)
//
//  Created by 王一成 on 2018/5/26.
//  Copyright © 2018年 wyc. All rights reserved.
//

#import "NetWork.h"

@interface NetWork ()
@property (strong, nonatomic)NSDictionary *tempData;

@end

@implementation NetWork


- (void) verifyLogin:(NSString *) account passwd:(NSString *)passwd;
{
    //NSURL *url = [NSURL URLWithString:@"https://wx.idsbllp.cn/api/verify"];
    //NSDictionary *parametersDict = @{@"stuNum":account,@"idNum":passwd};
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
            
            // 如果请求成功，则解析数据。
            NSDictionary *object = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
            // 11、判断是否解析成功
            if (error) {
                
                NSLog(@"post error :%@",error.localizedDescription);
            }else {
                [self saveLoginData:object];
                
                if (![[self->_LoginData valueForKey:@"status"]   isEqual: @200]) {
                    
                    NSLog(@"%@",@"登陆失败");
                    NSLog(@"%@",[self->_LoginData valueForKey:@"status"]);
                    NSLog(@"%@",self->_LoginData);
                    
                }
                else {
                    
                    NSLog(@"%@",@"登陆成功");
                    NSLog(@"%@",[self->_LoginData valueForKey:@"status"]);
                    NSLog(@"%@",self->_LoginData);
                    
                }
                
                // 解析成功，处理数据，通过GCD获取主队列，在主线程中刷新界面。
                
                //                dispatch_async(dispatch_get_main_queue(), ^{
                //
                //
                //                });
            }
        }
        
    }];
    // 9、执行任务
    [task resume];
    
}
// [self postRequest:url requestbody:parametersDict];
//NSLog(@"%@",_LoginData);



-(void)tempData:(NSDictionary *) tempData{
    _tempData = tempData;
    //NSLog(@"%@",_tempData);
}
-(void)saveLoginData:(NSDictionary *) dit1{
    _LoginData = dit1;
    NSLog(@"%@",_LoginData);
}

-(void)getClassBook:(NSString *) account{
    NSURL *url = [NSURL URLWithString:@"https://wx.idsbllp.cn/api/kebiao"];
    NSDictionary *parametersDict = @{@"stuNum":account};
    [self postRequest:url requestbody:parametersDict];
    
}

-(void)postRequest:(NSURL *)url requestbody:(NSDictionary *)parametersDict {
    // 1、创建URL资源地址
    //NSURL *url = [NSURL URLWithString:@"https://wx.idsbllp.cn/api/verify"];
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
    //NSDictionary *parametersDict = @{@"stuNum":account,@"idNum":passwd};
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
            
            // 如果请求成功，则解析数据。
            NSDictionary *object = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
            // 11、判断是否解析成功
            if (error) {
                
                NSLog(@"post error :%@",error.localizedDescription);
            }else {
                //                if (![[object objectForKey:@"status"]  isEqual: @"200"]) {
                //
                //                    [self alert];
                //
                //
                //                }
                //                else {
                //                    haveLoginViewController *vc1 = [haveLoginViewController new];
                //
                //                    [self presentViewController:vc1 animated:YES completion:nil];
                //                    //[self presentModalViewController:vc1 animated:YES];
                //
                //                }
                // 解析成功，处理数据，通过GCD获取主队列，在主线程中刷新界面。
                //NSLog(@"post success :%@",object);
                [self saveLoginData:object];
                //return object;
                
                //                dispatch_async(dispatch_get_main_queue(), ^{
                //
                //
                //                });
            }
        }
        
    }];
    // 9、执行任务
    [task resume];
    
}
//- (void)alert {
//    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"登陆失败" message:@"请检查账号或密码是否正确" preferredStyle:UIAlertControllerStyleAlert];
//    
//    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
//    
//    [alertController addAction:okAction];
//    [self presentViewController:alertController animated:YES completion:nil];
//    
//    
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
