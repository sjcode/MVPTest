//
//  HomePresenter.m
//  MVPTest
//
//  Created by sujian on 2018/3/28.
//  Copyright © 2018年 sujian. All rights reserved.
//

#import "HomePresenter.h"
#import "ClientAPI.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HomePresenter()
@property (weak, nonatomic) id<HomeViewProtocol> attachView;

@end

@implementation HomePresenter

- (instancetype)initWithAttachView:(id<HomeViewProtocol>)view {
    self = [super init];
    if (self) {
        _attachView = view;
        _dataList = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)fetchData {
    [self.attachView refreshBegin];
    [[ClientAPI sharedClient]fetchMessageWithParamts:@{} success:^(NSDictionary *response) {
        
        [response enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            [self.dataList addObject:key];
        }];
        [self.attachView receiveData];
        [self.attachView refreshEnd];
    } failure:^(NSError *error) {
        
    }];
}

- (void)configWithCell:(id<HomeTableViewCellView>)cellView forIndexPath:(NSIndexPath *)indexPath {
    NSString *name = self.dataList[indexPath.row];
    [cellView displayWithName:name];
}
@end
