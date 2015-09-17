//
//  FavoriteViewController.m
//  Recipe App
//
//  Created by Brock Oberhansley on 9/17/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

#import "FavoriteViewController.h"

@interface FavoriteViewController ()<UITableViewDataSource>

@end

@implementation FavoriteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITableView *tabelView = [[UITableView alloc]initWithFrame:self.view.frame];
    tabelView.dataSource = self;
    
    
    [self.view addSubview:tabelView];
    
    
    
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [UITableViewCell new];
    cell.textLabel.text = [self favoriteThings][indexPath.row];
    
    //register cell
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell Id"]
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    //dequeue the cell
    [tableView dequeueReusableCellWithIdentifier:@"Cell Id"];
    
    return [self favoriteThings].count;
}

-(NSArray *) favoriteThings{
    return @[@"Family",@"computers",@"cars",@"outside",@"money"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
