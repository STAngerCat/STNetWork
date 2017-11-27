//
//  STNMutableRequest.h
//  STNetWork
//
//  Created by Mapleiny on 2017/11/26.
//

#import "STNRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface STNMutableRequest : STNRequest

@property (nonatomic, strong) NSURLRequest *urlRequest;
@property (nonatomic, assign) STNRequestMethod method;
@property (nonatomic, strong, nullable) STNHeaders *headers;
@property (nonatomic, assign) NSTimeInterval timeoutInterval;
@property (nonatomic, strong, nullable) NSData *HTTPBody;

@end


NS_ASSUME_NONNULL_END
