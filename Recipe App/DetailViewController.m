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
    
    CGFloat topMargin = 20;
    
    CGFloat heightForDescription = [self heightForDescription:[recipes descriptionAtIndex:(long)self.recipeIndex]];
    
    UILabel *descriptionLabel = [UILabel new];
    descriptionLabel.frame = CGRectMake(margin, topMargin, self.view.frame.size.width - 2 * margin, heightForDescription);
    
    [scrollView addSubview:descriptionLabel];
    
    CGFloat top = topMargin + heightForDescription + margin * 2;
    
    UILabel *ingredientsLabel = [UILabel new];
    ingredientsLabel.frame = CGRectMake(margin, top, self.view.frame.size.width - 2 * margin, 20);
    
    ingredientsLabel.text = @"Ingredients";
    ingredientsLabel.font = [UIFont boldSystemFontOfSize:17];
    [scrollView addSubview:ingredientsLabel];
    
    top += 20 + margin;
    
    UILabel *directionsLabel = [UILabel new];
    directionsLabel.frame = CGRectMake(margin, top, self.view.frame.size.width - 2 * margin, 20);
    directionsLabel.text = @"Directions";
    directionsLabel.font = [UIFont boldSystemFontOfSize:17];
    [scrollView addSubview:directionsLabel];

    [recipes di]
}




- (CGFloat)heightForDescription:(NSString *)description {
    
    CGRect bounding = [description boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 2 * margin, CGFLOAT_MAX)
                                                options:NSStringDrawingUsesLineFragmentOrigin
                                             attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]}
                                                context:nil];
    
    return bounding.size.height;
    
}

- (CGFloat)heightForDirections:(NSString *)description {
    
    CGRect bounding = [description boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 2 * margin - 40, CGFLOAT_MAX)
                                                options:NSStringDrawingUsesLineFragmentOrigin
                                             attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]}
                                                context:nil];
    
    return bounding.size.height;
    
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
