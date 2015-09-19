//
//  FavoriteViewController.m
//  Recipe App
//
//  Created by Brock Oberhansley on 9/17/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

#import "FavoriteViewController.h"
#import "recipes.h"
#import "DetailViewController.h"

static NSString * const cellID = @"cellID";

//add UITableViewDataSource protocol provides data source for the tabel view
@interface FavoriteViewController ()<UITableViewDataSource, UITableViewDelegate>


@end

@implementation FavoriteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //make tabel view and set the frame size
    UITableView *tableView = [UITableView new];
    tableView.frame = self.view.frame;
    
    
    //setting the data source
    tableView.dataSource = self;
    
    //setting the delegate
    tableView.delegate = self;
    
    //adding the tabelVeiw to the view.
    [self.view addSubview:tableView];
    
    // register cell in tabel view to be reused after dequeued;
    [tableView registerClass:[UITableViewCell class]  forCellReuseIdentifier:cellID];
    
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    //dequeuing cell in tabel view
    [tableView dequeueReusableCellWithIdentifier:cellID];
    
    return [recipes count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // creating table view cell and adding a subtitle to it.
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    
    
    // setting the title and subtitles in the cell.
    cell.textLabel.text = [recipes titleAtIndex:indexPath.row];
    cell.detailTextLabel.text = [recipes descriptionAtIndex:indexPath.row];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DetailViewController *detailView = [DetailViewController new];
    
    detailView.name = [recipes titleAtIndex:indexPath.row];
    
    
    
    //push to the detail view
    [self.navigationController pushViewController:detailView animated:YES];
    
    

    
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
