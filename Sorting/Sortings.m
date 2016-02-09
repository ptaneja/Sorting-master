//
//  Sortings.m
//  Sorting
//
//  Created by Tringapps Inc on 6/29/14.
//  Copyright (c) 2014 TringApps. All rights reserved.
//

#import "Sortings.h"

@implementation Sortings

#pragma mark bubbleSortApproach

// n2
- (NSMutableArray *)bubbleSortApproach:(NSMutableArray *) iUnsortedArray {
    NSInteger numberOfIterations = iUnsortedArray.count - 1;
    NSInteger bubleSortIterations = 1;
    
    NSInteger complexity = 0;
    
    while (bubleSortIterations <= numberOfIterations) {
        // iterations n
        complexity++;
        for (NSInteger iIndex = 1; iIndex < iUnsortedArray.count; iIndex++) {
            // iterations n-1
            complexity++;
            if ([[iUnsortedArray objectAtIndex:iIndex - 1] integerValue] > [[iUnsortedArray objectAtIndex:iIndex] integerValue]) {
                [iUnsortedArray exchangeObjectAtIndex:iIndex withObjectAtIndex:iIndex - 1];
            }
        }
        // n + ((n - 1) * n)
        // n + n * n -n
        // n * n
        bubleSortIterations++;
    }
    NSLog(@"Number of Items %d", [iUnsortedArray count]);
    NSLog(@"Complexity %d", complexity);
    return iUnsortedArray;
}

#pragma mark selectionSortApproach

// n2
- (NSMutableArray *)selectionSortApproach:(NSMutableArray *)iUnsortedArray {
    NSInteger pointer;
    NSInteger complexity = 0;
    
    for (NSInteger index = 0; index < iUnsortedArray.count; index++) {
        pointer = index;
        complexity++;
        
        for (NSInteger innerLoopIndex = index + 1; innerLoopIndex < iUnsortedArray.count; innerLoopIndex++) {
            complexity++;
            if ([[iUnsortedArray objectAtIndex:innerLoopIndex] integerValue] < [[iUnsortedArray objectAtIndex:pointer] integerValue]) {
                pointer = innerLoopIndex;
            }
        }
        
        if (pointer != index) {
            [iUnsortedArray exchangeObjectAtIndex:index withObjectAtIndex:pointer];
        }
    }
    return iUnsortedArray;
}

#pragma mark insertionSortApproach

// n2
- (NSMutableArray *)insertionSortApproach:(NSMutableArray *)iUnsortedArray {
    for (NSInteger index = 1; index < iUnsortedArray.count; index++) {
        NSInteger innerIndex = index;
        
        while (innerIndex > 0) {
            if ([[iUnsortedArray objectAtIndex:innerIndex - 1] integerValue] > [[iUnsortedArray objectAtIndex:innerIndex] integerValue]) {
                [iUnsortedArray exchangeObjectAtIndex:innerIndex - 1 withObjectAtIndex:innerIndex];
            }
            innerIndex--;
        }
    }
    return iUnsortedArray;
}

#pragma mark quickSortApproach

// n(logn)
- (NSMutableArray *)quickSortApproach:(NSMutableArray *)iUnsortedArray startIndex:(NSInteger)iStartIndex endIndex:(NSInteger)iEndIndex {
    NSInteger partitionIndex = iStartIndex;
    
    if (iStartIndex <= iEndIndex) {
        partitionIndex = [self partition:iUnsortedArray startIndex:iStartIndex endIndex:iEndIndex];
        [self quickSortApproach:iUnsortedArray startIndex:iStartIndex endIndex:partitionIndex - 1];
        [self quickSortApproach:iUnsortedArray startIndex:partitionIndex + 1 endIndex:iEndIndex];
    }
    return iUnsortedArray;
}

- (NSInteger)partition:(NSMutableArray *)iUnsortedArray startIndex:(NSInteger)iStartIndex endIndex:(NSInteger)iEndIndex {
    NSInteger pivot = iEndIndex;
    NSInteger partitionIndex = iStartIndex;
    
    if (iStartIndex <= iEndIndex) {
        for (NSInteger startIndex = iStartIndex; startIndex <= iEndIndex - 1; startIndex++) {
            if ([[iUnsortedArray objectAtIndex:startIndex] integerValue] <= [[iUnsortedArray objectAtIndex:pivot] integerValue]) {
                [iUnsortedArray exchangeObjectAtIndex:partitionIndex withObjectAtIndex:startIndex];
                partitionIndex++;
            }
        }
        [iUnsortedArray exchangeObjectAtIndex:partitionIndex withObjectAtIndex:iEndIndex];
    }
    return partitionIndex;
}

#pragma mark mergeSortApporach

- (NSArray *)mergeSortApporach:(NSArray *)iUnsortedArray {
    if (iUnsortedArray.count < 2) {
        return iUnsortedArray;
    }
    NSInteger midIndex = iUnsortedArray.count/2;
    NSArray *leftArray = [iUnsortedArray subarrayWithRange:NSMakeRange(0, midIndex)];
    NSArray *rightArray = [iUnsortedArray subarrayWithRange:NSMakeRange(midIndex, ([iUnsortedArray count] - midIndex))];
    return [self mergeLeft:[self mergeSortApporach:leftArray] andRight:[self mergeSortApporach:rightArray]];
}

- (NSMutableArray *)mergeLeft:(NSArray *)iLeftArray andRight:(NSArray *)iRightArray {
    NSMutableArray *sortedArray = [NSMutableArray array];
    NSInteger leftArrayPointer = 0;
    NSInteger rightArrayPointer = 0;
    
    while (leftArrayPointer < [iLeftArray count] && rightArrayPointer < [iRightArray count]) {
        if ([[iLeftArray objectAtIndex:leftArrayPointer] intValue] < [[iRightArray objectAtIndex:rightArrayPointer] intValue]) {
            [sortedArray addObject:[iLeftArray objectAtIndex:leftArrayPointer]];
            leftArrayPointer++;
        } else {
            [sortedArray addObject:[iRightArray objectAtIndex:rightArrayPointer]];
            rightArrayPointer++;
        }
    }
    NSArray *leftArray = [iLeftArray subarrayWithRange:NSMakeRange(leftArrayPointer, iLeftArray.count - leftArrayPointer)];
    NSArray *rightArray = [iRightArray subarrayWithRange:NSMakeRange(rightArrayPointer, iRightArray.count - rightArrayPointer)];
    [sortedArray addObjectsFromArray:leftArray];
    [sortedArray addObjectsFromArray:rightArray];
    return sortedArray;
}

#pragma mark fibonnaciSeries

static NSMutableArray *aSeries = nil;

- (NSMutableArray *)fibonnaciSeriesForFirst:(NSInteger)iFirstRandomNumber andSecond:(NSInteger)iSecondRandomNumber upto:(NSInteger)iLimit {
    
    if (!aSeries) {
        aSeries = [NSMutableArray array];
        
        [aSeries addObject:[NSString stringWithFormat:@"%d", iFirstRandomNumber]];
        [aSeries addObject:[NSString stringWithFormat:@"%d", iSecondRandomNumber]];
    }
    [aSeries addObject:[NSString stringWithFormat:@"%d", (iFirstRandomNumber + iSecondRandomNumber)]];
    
    iSecondRandomNumber = iFirstRandomNumber + iSecondRandomNumber;
    iFirstRandomNumber = iSecondRandomNumber - iFirstRandomNumber;
    
    if ((iFirstRandomNumber + iSecondRandomNumber) <= iLimit) {
        [self fibonnaciSeriesForFirst:iFirstRandomNumber andSecond:iSecondRandomNumber upto:iLimit];
    }
    return aSeries;
}

#pragma mark factorial

- (void)factorial:(NSInteger)iInput {
    if (iInput == 1 || iInput == 0 || iInput > 10000) {
        return;
    }
    NSLog(@"%d", iInput * iInput);
    [self factorial:iInput * iInput];
}

@end
