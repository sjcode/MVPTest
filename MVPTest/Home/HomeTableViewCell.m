//
//  HomeTableViewCell.m
//  MVPTest
//
//  Created by sujian on 2018/3/28.
//  Copyright © 2018年 sujian. All rights reserved.
//

#import "HomeTableViewCell.h"

NSString *const kHomeTableViewCell = @"HomeTableViewCell";

@implementation HomeTableViewCell


- (void)displayWithName:(NSString *)name {
    self.textLabel.text = name;
}


@end
