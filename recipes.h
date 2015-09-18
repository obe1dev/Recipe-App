//
//  recipes.h
//  Recipe App
//
//  Created by Brock Oberhansley on 9/18/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

@interface recipes : NSObject

+ (NSInteger)count;

+ (NSDictionary *)recipeAtIndex:(NSInteger)index;

+ (NSString *)titleAtIndex:(NSInteger)index;

+ (NSString *)descriptionAtIndex:(NSInteger)index;

+ (NSInteger)ingredientCountAtIndex:(NSInteger)index;

+ (NSString *)ingredientTypeAtIndex:(NSInteger)ingIndex inRecipeAtIndex:(NSInteger)recIndex;

+ (NSString *)ingredientVolumeAtIndex:(NSInteger)ingIndex inRecipeAtIndex:(NSInteger)recIndex;

@end