//
//  DetailViewController.h
//  Recipe App
//
//  Created by Brock Oberhansley on 9/19/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (nonatomic, weak) NSString * name;
@property (nonatomic, assign) NSInteger recipeIndex;

@end
