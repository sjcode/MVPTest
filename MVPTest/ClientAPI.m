//
//  ClientAPI.m
//  MVPTest
//
//  Created by sujian on 2018/3/28.
//  Copyright © 2018年 sujian. All rights reserved.
//

#import "ClientAPI.h"

@implementation ClientAPI

+ (instancetype)sharedClient {
    static dispatch_once_t onceToken;
    static ClientAPI *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[ClientAPI alloc]init];
    });
    return instance;
}

- (void)fetchMessageWithParamts:(NSDictionary *)params
                        success:(void (^)(NSDictionary *response))success
                        failure:(void (^)(NSError *error))failure {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSString *filename = [[NSBundle mainBundle]pathForResource:@"ItemList" ofType:@"plist"];
        NSDictionary *dict = [[NSDictionary alloc]initWithContentsOfFile:filename];
        success(dict);
    });
}
@end
