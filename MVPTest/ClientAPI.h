//
//  ClientAPI.h
//  MVPTest
//
//  Created by sujian on 2018/3/28.
//  Copyright © 2018年 sujian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClientAPI : NSObject
+ (instancetype)sharedClient;
- (void)fetchMessageWithParamts:(NSDictionary *)params
                        success:(void (^)(NSDictionary *response))success
                        failure:(void (^)(NSError *error))failure;
@end
