//
//  STNResult.h
//  STNetWork
//
//  Created by Mapleiny on 2017/11/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface STNResult : NSObject

@property (nonatomic, strong, readonly, nullable) NSData* rawData;

+ (instancetype)resultWithData:(nullable NSData *)data;

- (instancetype)initWithData:(nullable NSData *)data;

- (nullable NSString *)rawString;
- (nullable id)jsonObject;

@end


NS_ASSUME_NONNULL_END
