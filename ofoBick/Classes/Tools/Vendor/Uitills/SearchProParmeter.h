//
//  SearchProParmeter.h
//  Dutyfreestore
//
//  Created by wade on 15/12/8.
//  Copyright © 2015年 Fow Tech. All rights reserved.
//

#import "OrderedDictionary.h"

@class NSMutableDictionary;

@interface SearchProParmeter : OrderedDictionary

@property (nonatomic,copy) NSString *freeText;
@property (nonatomic,assign) int categoryId;
@property (nonatomic,assign) int subCategoryId;
@property (nonatomic,copy) NSString *order;
@property (nonatomic,assign) int pageIndex;
@property (nonatomic,assign) int pageSize;
@property (nonatomic,assign) int brandId;
@property (nonatomic,copy) NSString *minPrice;
@property (nonatomic,copy) NSString *maxPrice;
@property (nonatomic,assign) int ageGroupId;
@property (nonatomic,copy) NSString *tag;
@property (nonatomic,copy) NSString *origin;
@property (nonatomic) BOOL isRecommend;

@property (nonatomic,retain) NSString *categoryName;
@property (nonatomic,retain) NSString *subCategoryName;
@property (nonatomic,retain) NSString *brandName;
@end
