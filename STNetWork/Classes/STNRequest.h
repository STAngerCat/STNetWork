//
//  STNRequest.h
//  STNetWork
//
//  Created by Mapleiny on 2017/11/25.
//

#import <Foundation/Foundation.h>
#import "STNetWorkDefined.h"

NS_ASSUME_NONNULL_BEGIN

@interface STNRequest : NSObject

@property (nonatomic, strong, readonly) NSURLRequest *urlRequest;
@property (nonatomic, assign, readonly) STNRequestMethod method;
@property (nonatomic, strong, readonly, nullable) STNHeaders *headers;
@property (nonatomic, assign, readonly) NSTimeInterval timeoutInterval;
@property (nonatomic, strong, readonly, nullable) NSData *HTTPBody;


+ (nullable STNHeaders *)globelHeaders;
+ (void)setupGlobelHeaders:(STNHeaders *)HTTPHeaders;
+ (void)setupGlobelHeadersValue:(id)value key:(NSString *)key;


#pragma mark - HEAD

+ (instancetype)head:(NSString *)urlString
              params:(nullable NSDictionary *)params
       completeBlock:(nullable STNRequestComplete)complete;


#pragma mark - GET

+ (instancetype)get:(NSString *)urlString
              params:(nullable NSDictionary *)params
       completeBlock:(nullable STNRequestComplete)complete;

#pragma mark - POST

+ (instancetype)post:(NSString *)urlString
              params:(nullable NSDictionary *)params
       completeBlock:(nullable STNRequestComplete)complete;

+ (instancetype)post:(NSString *)urlString
             rawData:(nullable NSData *)data
       completeBlock:(nullable STNRequestComplete)complete;

- (instancetype)initWithRequest:(NSURLRequest *)request;

- (void)start;
- (void)cancel;

@end


NS_ASSUME_NONNULL_END
