//
//  STNResponse+Private.h
//  Alamofire
//
//  Created by Maple Yin on 2017/11/28.
//

#import <STNetWork/STNetWork.h>

@interface STNResponse ()

@property (nonatomic, assign) NSInteger code;
@property (nonatomic, strong) STNRequest *request;
@property (nonatomic, strong, nullable) STNResult *result;
@property (nonatomic, strong, nullable) NSError *error;

@end
