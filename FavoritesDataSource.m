//
//  FavoritesDataSource.m
//  Recipe App
//
//  Created by Brock Oberhansley on 9/17/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

#import "FavoritesDataSource.h"


@interface FavoritesDataSource ()<UITableViewDataSource>

@end

@implementation FavoritesDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [UITableViewCell new];
    cell.textLabel.text = @"Seperate data source";
    return cell;
}

@end
