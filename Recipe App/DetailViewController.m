//
//  DetailViewController.m
//  Recipe App
//
//  Created by Brock Oberhansley on 9/19/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

#import "DetailViewController.h"
#import "recipes.h"

static CGFloat margin = 15;

@interface DetailViewController ()


@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //add scroll View
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.frame = self.view.frame;
    [self.view addSubview:scrollView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = self.name;
    
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
