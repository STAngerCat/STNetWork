//
//  STNRequest+Private.h
//  Alamofire
//
//  Created by Maple Yin on 2017/11/28.
//

#import <STNetWork/STNetWork.h>
#import <STNetWork/STNetWork-Swift.h>

@interface STNRequest()<AlamofireWrapperDelegate>

// public
@property (nonatomic, strong) NSURLRequest *urlRequest;
@property (nonatomic, assign) STNRequestMethod method;
@property (nonatomic, strong) STNHeaders *headers;
@property (nonatomic, assign) NSTimeInterval timeout;
@property (nonatomic, strong) id data;

// private
@property (nonatomic, strong) AlamofireWrapper *wrapper;
@property (nonatomic, strong) STNRequestComplete completeBlock;

@end
