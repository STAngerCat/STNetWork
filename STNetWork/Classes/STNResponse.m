//
//  STNResponse.m
//  STNetWork
//
//  Created by Mapleiny on 2017/11/25.
//

#import "STNResponse.h"
#import "STNResult.h"

@interface STNResponse ()

@property (nonatomic, assign) NSInteger code;
@property (nonatomic, strong) STNRequest *request;
@property (nonatomic, strong, nullable) STNResult *result;
@property (nonatomic, strong, nullable) NSError *error;

@end

@implementation STNResponse

- (instancetype)initWithRequest:(STNRequest *)request
                       response:(nullable NSHTTPURLResponse *)response
                           data:(nullable NSData *)data
                          error:(nullable NSError *)error {
    self = [super init];
    if (self) {
        _request = request;
        _code = response.statusCode;
        _result = [STNResult resultWithData:data];
        _error = error;
    }
    return self;
}

@end
