//
//  STNResult.m
//  STNetWork
//
//  Created by Mapleiny on 2017/11/25.
//

#import "STNResult.h"

@interface STNResult()

@property (nonatomic, strong) NSData* rawData;

@end

@implementation STNResult

- (NSString *)rawString {
    return @"";
}

- (id)jsonObject {
    return [NSJSONSerialization JSONObjectWithData:self.rawData options:NSJSONReadingAllowFragments error:nil];
}

@end
