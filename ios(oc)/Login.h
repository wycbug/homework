//
//  Login.h
//  ios(oc)
//
//  Created by 王一成 on 2018/5/25.
//  Copyright © 2018年 wyc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Login : NSObject
@property (assign, nonatomic) int loginStatus;

- (void) verifyLogin:(NSString *) account passwd:(NSString *)passwd;

@end
