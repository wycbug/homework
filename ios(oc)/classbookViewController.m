//
//  classbookViewController.m
//  ios(oc)
//
//  Created by 王一成 on 2018/5/26.
//  Copyright © 2018年 wyc. All rights reserved.
//

#import "classbookViewController.h"

@interface classbookViewController ()

@end

@implementation classbookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarItem.title = @"课表";
    self.tabBarItem.image = [UIImage imageNamed:@"课表图标.png"];
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
