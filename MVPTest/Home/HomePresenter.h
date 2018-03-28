//
//  HomePresenter.h
//  MVPTest
//
//  Created by sujian on 2018/3/28.
//  Copyright © 2018年 sujian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol HomeTableViewCellView
- (void)displayWithName:(NSString*)name;
@end

@protocol HomeViewProtocol
- (void)refreshBegin;
- (void)refreshEnd;
- (void)receiveData;
- (void)presentAlertMessage;

@end

@protocol HomePresenterProtocol
- (void)configWithCell:(id<HomeTableViewCellView>)cellView forIndexPath:(NSIndexPath *)indexPath;
@end

@interface HomePresenter : NSObject<HomePresenterProtocol>
- (instancetype)initWithAttachView:(id<HomeViewProtocol>)view;
- (void)fetchData;
@property (strong, nonatomic) NSMutableArray *dataList;
@end
