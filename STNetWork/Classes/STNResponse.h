//
//  STNResponse.h
//  STNetWork
//
//  Created by Mapleiny on 2017/11/25.
//

#import <Foundation/Foundation.h>

@class STNRequest;
@class STNResult;

NS_ASSUME_NONNULL_BEGIN

@interface STNResponse : NSObject

@property (nonatomic, assign, readonly) NSInteger code;
@property (nonatomic, strong, readonly) STNRequest *request;
@property (nonatomic, strong, readonly, nullable) STNResult *result;
@property (nonatomic, strong, readonly, nullable) NSError *error;


- (instancetype)initWithRequest:(STNRequest *)request
                       response:(nullable NSHTTPURLResponse *)response
                           data:(nullable NSData *)data
                          error:(nullable NSError *)error;

@end

NS_ASSUME_NONNULL_END
