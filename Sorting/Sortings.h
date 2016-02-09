//
//  Sortings.h
//  Sorting
//
//  Created by Tringapps Inc on 6/29/14.
//  Copyright (c) 2014 TringApps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sortings : NSObject

- (NSMutableArray *)bubbleSortApproach:(NSMutableArray *) iUnsortedArray;
- (NSMutableArray *)selectionSortApproach:(NSMutableArray *)iUnsortedArray;
- (NSMutableArray *)insertionSortApproach:(NSMutableArray *)iUnsortedArray;
- (NSMutableArray *)quickSortApproach:(NSMutableArray *)iUnsortedArray startIndex:(NSInteger)iStartIndex endIndex:(NSInteger)iEndIndex;
- (NSArray *)mergeSortApporach:(NSArray *)iUnsortedArray;
- (NSMutableArray *)fibonnaciSeriesForFirst:(NSInteger)iFirstRandomNumber andSecond:(NSInteger)iSecondRandomNumber upto:(NSInteger)iLimit;
- (void)factorial:(NSInteger)iInput;
@end
