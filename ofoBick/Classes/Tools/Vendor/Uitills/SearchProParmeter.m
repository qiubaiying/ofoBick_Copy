//
//  SearchProParmeter.m
//  Dutyfreestore
//
//  Created by wade on 15/12/8.
//  Copyright © 2015年 Fow Tech. All rights reserved.
//

#import "SearchProParmeter.h"

@implementation SearchProParmeter

-(id)init
{
    if(self = [super init]) // 重新赋值了
    {
        [self setValue:@"0" forKey:@"pageIndex"];
        [self setValue:@"10" forKey:@"pageSize"];
    }
    return self;
}

-(void)setIsRecommend:(BOOL)isRecommend
{
    [self setValue:[NSNumber numberWithBool:isRecommend] forKey:@"isRecommend"];
}
-(BOOL)isRecommend
{
    return [[self objectForKey:@"isRecommend"] boolValue];
}
-(void)setFreeText:(NSString *)freeText
{
    [self setValue:freeText forKey:@"freeText"];
}
-(NSString *)freeText
{
    return [self objectForKey:@"freeText"];
}
-(void)setCategoryId:(int)categoryId
{
    [self setValue:[NSNumber numberWithInt:categoryId] forKey:@"categoryId"];
}
-(int)categoryId
{
    return [[self objectForKey:@"categoryId"] intValue];
}
-(void)setSubCategoryId:(int)subCategoryId
{
    [self setValue:[NSNumber numberWithInt:subCategoryId] forKey:@"subCategoryId"];
}
-(int)subCategoryId
{
    return [[self objectForKey:@"subCategoryId"] intValue];
}
-(void)setOrder:(NSString *)order
{
    [self setValue:order forKey:@"order"];
}
-(NSString *)order
{
    return [self objectForKey:@"order"];
}
-(void)setPageIndex:(int)pageIndex
{
    [self setValue:[NSNumber numberWithInt:pageIndex] forKey:@"pageIndex"];
}
-(int)pageIndex
{
    return [[self objectForKey:@"pageIndex"] intValue];
}
-(void)setPageSize:(int)pageSize
{
    [self setValue:[NSNumber numberWithInt:pageSize] forKey:@"pageSize"];
}
-(int)pageSize
{
    return [[self objectForKey:@"pageSize"] intValue];
}
-(void)setBrandId:(int)brandId
{
    [self setValue:[NSNumber numberWithInt:brandId] forKey:@"brandId"];
}
-(int)brandId
{
    return [[self objectForKey:@"brandId"] intValue];
}
-(void)setMinPrice:(NSString *)minPrice
{
    [self setValue:minPrice forKey:@"minPrice"];
}
-(NSString *)minPrice
{
    return [self objectForKey:@"minPrice"];
}
-(void)setMaxPrice:(NSString *)maxPrice
{
    [self setValue:maxPrice forKey:@"maxPrice"];
}
-(NSString *)maxPrice
{
    return [self objectForKey:@"maxPrice"];
}
-(void)setAgeGroupId:(int)ageGroupId
{
    [self setValue:[NSNumber numberWithInt:ageGroupId] forKey:@"ageGroupId"];
}
-(int)ageGroupId
{
    return [[self objectForKey:@"ageGroupId"] intValue];
}
-(void)setTag:(NSString *)tag
{
    [self setValue:tag forKey:@"tag"];
}
-(NSString *)tag
{
    return [self objectForKey:@"tag"];
}
-(void)setOrigin:(NSString *)origin
{
    [self setValue:origin forKey:@"origin"];
}
-(NSString *)origin
{
    return [self objectForKey:@"origin"];
}

-(void)setCategoryName:(NSString *)categoryName
{
    [self setValue:categoryName forKey:@"categoryName"];
}
-(NSString *)categoryName
{
    return [self objectForKey:@"categoryName"];
}

-(void)setSubCategoryName:(NSString *)subCategoryName
{
    [self setValue:subCategoryName forKey:@"subCategoryName"];
}
-(NSString *)subCategoryName
{
    return [self objectForKey:@"subCategoryName"];
}

-(void)setBrandName:(NSString *)brandName
{
    [self setValue:brandName forKey:@"brandName"];
}
-(NSString *)brandName
{
    return [self objectForKey:@"brandName"];
}






@end
