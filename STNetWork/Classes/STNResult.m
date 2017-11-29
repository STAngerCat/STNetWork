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

+ (instancetype)resultWithData:(NSData *)data {
    STNResult *result = [[STNResult alloc] initWithData:data];
    return result;
}

- (instancetype)initWithData:(NSData *)data {
    self = [super init];
    if (self) {
        _rawData = data;
    }
    return self;
}

- (NSString *)rawString {
    return [[NSString alloc] initWithData:self.rawData encoding:NSUTF8StringEncoding];
}

- (id)jsonObject {
    return [NSJSONSerialization JSONObjectWithData:self.rawData options:NSJSONReadingAllowFragments error:nil];
}

@end
