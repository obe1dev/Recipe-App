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
    scrollView.frame = self.view.bounds;
    [self.view addSubview:scrollView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = [recipes titleAtIndex:self.recipeIndex];
    
    CGFloat topMargin = 20;
    
    CGFloat heightForDescription = [self heightForDescription:[recipes descriptionAtIndex:self.recipeIndex]];
    
    UILabel *descriptionLabel = [UILabel new];
    descriptionLabel.frame = CGRectMake(margin, topMargin, self.view.frame.size.width - 2 * margin, heightForDescription);
    
    descriptionLabel.text = [recipes descriptionAtIndex:self.recipeIndex];
    descriptionLabel.numberOfLines = 0;
    
    
    [scrollView addSubview:descriptionLabel];
    
    
    
    CGFloat top = topMargin + heightForDescription + margin * 2;
    
    UILabel *ingredientsLabel = [UILabel new];
    ingredientsLabel.frame = CGRectMake(margin, top, self.view.frame.size.width - 2 * margin, 20);
    
    ingredientsLabel.text = @"Ingredients";
    ingredientsLabel.font = [UIFont boldSystemFontOfSize:17];
    [scrollView addSubview:ingredientsLabel];
    
    top += 20 + margin;
    
    
    for (int i = 0; i < [recipes ingredientCountAtIndex:self.recipeIndex]; i++) {
        
        // I set the width of the volume to 1/4 of the screen (less margins). You can set it to whatever width you want. The best thing to do would be to find the maximum width of all ingredient volumes.
        
        UILabel *volume = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, (self.view.frame.size.width - 2 * margin) / 4, 20)];
        volume.font = [UIFont boldSystemFontOfSize:17];
        volume.text = [recipes ingredientVolumeAtIndex:i inRecipeAtIndex:self.recipeIndex];
        [scrollView addSubview:volume];
        
        // The width of the type is just the remaining space. It's possible that this get's truncated, because I'm not wrapping text here.
        
        UILabel *type = [[UILabel alloc] initWithFrame:CGRectMake(margin + (self.view.frame.size.width - 2 * margin) / 4, top, (self.view.frame.size.width - 2 * margin) * 3 / 4, 20)];
        type.numberOfLines = 0;
        type.font = [UIFont systemFontOfSize:15];
        type.text = [recipes ingredientTypeAtIndex:i inRecipeAtIndex:self.recipeIndex];
        [scrollView addSubview:type];
        
        // Volume and type are on the same line, so we only update the top margin after they are added to the scrollview
        
        top += (20 + margin);
        
    }
    
    
    top += margin;
    
    
    UILabel *directionsLabel = [UILabel new];
    directionsLabel.frame = CGRectMake(margin, top, self.view.frame.size.width - 2 * margin, 20);
    directionsLabel.text = @"Directions";
    directionsLabel.font = [UIFont boldSystemFontOfSize:17];
    [scrollView addSubview:directionsLabel];
    
    
    top += 20 + margin;
    
    
    for (int i = 0; i < [[recipes directionsAtIndex:self.recipeIndex] count]; i++) {
        
        CGFloat height = [self heightForDirections:[recipes directionsAtIndex:self.recipeIndex][i]];
        
        UILabel *count = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, 30, 20)];
        count.font = [UIFont boldSystemFontOfSize:17];
        count.text = [NSString stringWithFormat:@"%d", i + 1];
        [scrollView addSubview:count];
        
        UILabel *direction = [[UILabel alloc] initWithFrame:CGRectMake(margin + 30, top, (self.view.frame.size.width - 2 * margin - 40), height)];
        direction.numberOfLines = 0;
        direction.text = [recipes directionsAtIndex:self.recipeIndex][i];
        
        [scrollView addSubview:direction];
        
        top += (height + margin);
        
    }
    
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, top + margin);

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
