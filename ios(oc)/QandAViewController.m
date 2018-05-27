//
//  QandAViewController.m
//  ios(oc)
//
//  Created by 王一成 on 2018/5/26.
//  Copyright © 2018年 wyc. All rights reserved.
//

#import "QandAViewController.h"

@interface QandAViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *background;

@end

@implementation QandAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarItem.title = @"邮问";
    self.tabBarItem.image = [UIImage imageNamed:@"邮问.png"];
    //self.background.image = [UIImage imageNamed:@"问答首页.png"];
    
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
