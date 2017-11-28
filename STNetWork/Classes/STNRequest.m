//
//  STNRequest.m
//  STNetWork
//
//  Created by Mapleiny on 2017/11/25.
//

#import "STNRequest.h"
#import "STNRequest+Private.h"

NSMutableDictionary *globleHTTPHeaders;

@implementation STNRequest

#pragma mark - ClassMethod

+ (nullable STNHeaders *)globelHeaders {
    return [globleHTTPHeaders copy];
}

+ (void)setupGlobelHeaders:(STNHeaders *)HTTPHeaders {
    globleHTTPHeaders = [NSMutableDictionary dictionaryWithDictionary:HTTPHeaders];
}

+ (void)setupGlobelHeadersValue:(id)value key:(NSString *)key {
    if (!globleHTTPHeaders) {
        globleHTTPHeaders = @{}.mutableCopy;
    }
    globleHTTPHeaders[key] = value;
}

#pragma mark - HEAD

+ (instancetype)head:(NSString *)urlString
              params:(NSDictionary *)params
       completeBlock:(STNRequestComplete)complete {
    NSURL *url = [NSURL URLWithString:urlString];

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"HEAD";
    STNRequest *nrequest = [[self alloc] initWithRequest:request];
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
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"GET";
    STNRequest *nrequest = [[self alloc] initWithRequest:request];
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
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    STNRequest *nrequest = [[self alloc] initWithRequest:request];
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
        NSMutableURLRequest *mutableRequest = [request mutableCopy];
        
        NSMutableDictionary *allHeaders = @{}.mutableCopy;
        [allHeaders addEntriesFromDictionary:globleHTTPHeaders];
        [allHeaders addEntriesFromDictionary:mutableRequest.allHTTPHeaderFields];
        mutableRequest.allHTTPHeaderFields = [allHeaders copy];
        
        request = [mutableRequest copy];
        _urlRequest = request;
        _method = [self methodFromString:request.HTTPMethod];
        _wrapper = [[AlamofireWrapper alloc] initWithRequest:self];
    }
    return self;
}

- (void)start {
    [self.wrapper start];
}
- (void)cancel {
    [self.wrapper cancel];
}

#pragma Getter && Setter

#pragma mark - Private

- (NSString *)stringFromMethod:(STNRequestMethod)method {
    NSString *string;
    switch (method) {
        case STNRequestMethodGet:
            string = @"GET";
            break;
        case STNRequestMethodPost:
            string = @"POST";
            break;
        case STNRequestMethodHead:
            string = @"HEAD";
            break;
        default:
            break;
    }
    
    return string;
}

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
