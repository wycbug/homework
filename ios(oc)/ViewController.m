//
//  ViewController.m
//  ios(oc)
//
//  Created by 王一成 on 2018/5/25.
//  Copyright © 2018年 wyc. All rights reserved.
//

#import "ViewController.h"
#import "haveLoginViewController.h"
#import "NetWork.h"

//#import "Login.h"

@interface ViewController ()
@property (assign, nonatomic) int loginStatus;


@property (strong, nonatomic) IBOutlet UITextField *account;
@property (strong, nonatomic) IBOutlet UITextField *password;
//@property (strong,nonatomic) NSString *account;
//@property (strong,nonatomic) NSString *password;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarItem.title = @"课表";
    self.tabBarItem.image = [UIImage imageNamed:@"课表图标.png"];
    
//    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"登陆页.png"]];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)login:(UIButton *)sender {
    
    NetWork *a1= [[NetWork alloc]init];
    
    [a1 verifyLogin:_account.text passwd:_password.text];
   
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)alert {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"登陆失败" message:@"请检查账号或密码是否正确" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
    
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
    
    
}


//- (void)savedata{
//    NSURLCache *cache = [NSURLCache sharedURLCache];  // 获取全局缓存对象
//
//}
//-(void)setMemoryCapacity:(NSUInteger)memoryCapacity;  // 设置内存缓存最大容量(默认为512kb)
//-(void)setDiskCapacity:(NSUInteger)diskCapacity;  // 设置硬盘缓存最大空间(默认10M)



@end
