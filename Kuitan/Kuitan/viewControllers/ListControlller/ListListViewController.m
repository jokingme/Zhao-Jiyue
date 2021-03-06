//
//  ListListViewController.m
//  Kuitan
//
//  Created by lanouhn on 15/10/16.
//  Copyright (c) 2015年 S&G. All rights reserved.
//

#import "ListListViewController.h"
#import "Model1.h"
#import "DetailViewController.h"
#import "MainNavigationController.h"

@interface ListListViewController ()

@end

@implementation ListListViewController

- (void)dealloc {
    self.text = nil;
    self.listArray = nil;
    [super dealloc];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setPrivateNaviBar];
    //设置不显示竖直滚动条
    self.tableView.showsVerticalScrollIndicator = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

/**
 *  设置导航栏的私有属性
 */
- (void)setPrivateNaviBar {
    self.navigationItem.title = self.text;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.listArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    Model1 *model1 = self.listArray[indexPath.section];
    cell.textLabel.text = model1.Name;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailViewController *detailVC = [[DetailViewController alloc] init];
    Model1 *model1 = self.listArray[indexPath.section];
    detailVC.Id = model1.Id;
    detailVC.text = model1.Name;
    detailVC.flag = 1;
    [self.navigationController pushViewController:detailVC animated:YES];
    [detailVC release];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
