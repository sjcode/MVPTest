//
//  HomeViewController.m
//  MVPTest
//
//  Created by sujian on 2018/3/28.
//  Copyright © 2018年 sujian. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTableViewCell.h"
#import "HomePresenter.h"

@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource, HomeViewProtocol>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;
@property (strong, nonatomic) HomePresenter *presenter;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.presenter = [[HomePresenter alloc]initWithAttachView:self];
    
    [self.tableView registerNib:[UINib nibWithNibName:kHomeTableViewCell bundle:nil] forCellReuseIdentifier:kHomeTableViewCell];
    
    [self refresh:nil];
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kHomeTableViewCell forIndexPath:indexPath];
    [self.presenter configWithCell:cell forIndexPath:indexPath];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.presenter.dataList.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.presenter fetchData];
}

- (IBAction)refresh:(id)sender {
    [self.presenter fetchData];
}
#pragma mark - HomeViewProtocol
- (void)receiveData {
    [self.tableView reloadData];
}

- (void)presentAlertMessage {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"MVPTest" message:@"presentAlertMessage" preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:alertController animated:YES completion: nil];
}

- (void)refreshBegin {
    [self.activityIndicatorView startAnimating];
    [UIView animateWithDuration:0.3 animations:^{
        self.tableView.alpha = 0;
    }];
}

- (void)refreshEnd {
    [self.activityIndicatorView stopAnimating];
    [UIView animateWithDuration:0.3 animations:^{
        self.tableView.alpha = 1;
    }];
    
}

@end
