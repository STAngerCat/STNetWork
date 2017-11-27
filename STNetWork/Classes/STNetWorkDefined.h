//
//  STNetWorkDefined.h
//  STNetWork
//
//  Created by Mapleiny on 2017/11/25.
//


@class STNResponse;
@class STNRequest;

typedef NSDictionary<NSString*, NSString *> STNHeaders;

typedef struct progress {
    CGFloat totalBytes;
    CGFloat receiveBytes;
    CGFloat progress;
    BOOL isFinished;
} STNProgress;

typedef NS_ENUM(NSUInteger, STNRequestMethod) {
    STNRequestMethodGet,
    STNRequestMethodPost,
    STNRequestMethodHead,
};


typedef void(^STNRequestComplete)(STNResponse *response);
typedef void(^STNProgressBlock)(STNRequest *request, STNProgress progress);

