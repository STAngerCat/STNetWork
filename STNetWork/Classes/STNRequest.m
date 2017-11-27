//
//  STNRequest.m
//  STNetWork
//
//  Created by Mapleiny on 2017/11/25.
//

#import "STNRequest.h"
#import <STNetWork/STNetWork-Swift.h>


@interface STNRequest()<AlamofireWrapperDelegate>

// public
@property (nonatomic, strong) NSURLRequest *request;
@property (nonatomic, assign) STNRequestMethod method;
@property (nonatomic, strong) STNHeaders *headers;
@property (nonatomic, assign) NSTimeInterval timeout;
@property (nonatomic, strong) id data;

// private
@property (nonatomic, strong) AlamofireWrapper *wrapper;
@property (nonatomic, strong) STNRequestComplete completeBlock;

@end

@implementation STNRequest

#pragma mark - ClassMethod

#pragma mark - HEAD

+ (instancetype)head:(NSString *)urlString
              params:(NSDictionary *)params
       completeBlock:(STNRequestComplete)complete {
    NSURL *url = [NSURL URLWithString:urlString];

    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    STNRequest *nrequest = [[self alloc] initWithRequest:request];
    nrequest.method = STNRequestMethodHead;
    nrequest.completeBlock = ^(STNResponse *response) {
        complete(response);
    };
    [nrequest start];
    return nrequest;
}

#pragma mark - GET

+ (instancetype)get:(NSString *)urlString
             params:(NSDictionary *)params
      completeBlock:(STNRequestComplete)complete {
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    STNRequest *nrequest = [[self alloc] initWithRequest:request];
    nrequest.method = STNRequestMethodGet;
    nrequest.completeBlock = ^(STNResponse *response) {
        complete(response);
    };
    [nrequest start];
    return nrequest;
}

#pragma mark - POST

+ (instancetype)post:(NSString *)urlString
              params:(NSDictionary *)params
       completeBlock:(STNRequestComplete)complete {
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    STNRequest *nrequest = [[self alloc] initWithRequest:request];
    nrequest.method = STNRequestMethodPost;
    nrequest.completeBlock = ^(STNResponse *response) {
        complete(response);
    };
    [nrequest start];
    return nrequest;
}

#pragma mark - Init

- (instancetype)initWithRequest:(NSURLRequest *)request {
    self = [super init];
    if (self) {
        _request = request;
        _method = [self methodFromString:request.HTTPMethod];
        _wrapper = [[AlamofireWrapper alloc] initWithRequest:self];
        _wrapper.delegate = self;
    }
    return self;
}

- (void)start {
    [self.wrapper start];
}
- (void)cancel {
    [self.wrapper cancel];
}


#pragma mark - Private

- (STNRequestMethod)methodFromString:(NSString *)methodString {
    STNRequestMethod method;
    if ([methodString isEqualToString:@"GET"]) {
        method = STNRequestMethodGet;
    } else if ([methodString isEqualToString:@"POST"]) {
        method = STNRequestMethodPost;
    } else {
        method = STNRequestMethodHead;
    }
    
    return method;
}

#pragma mark - AlamofireWrapperDelegate

- (void)didRecieveData:(STNResponse *)response {
    if (self.completeBlock) {
        self.completeBlock(response);
        self.completeBlock = nil;
    }
}

@end
