//
//  NetWork.h
//  ios(oc)
//
//  Created by 王一成 on 2018/5/26.
//  Copyright © 2018年 wyc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NetWork : UIViewController
@property (strong, nonatomic) NSDictionary *LoginData;
- (void) verifyLogin:(NSString *) account passwd:(NSString *)passwd;

@end
