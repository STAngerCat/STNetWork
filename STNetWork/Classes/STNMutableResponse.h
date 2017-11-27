//
//  STNMutableResponse.h
//  STNetWork
//
//  Created by Mapleiny on 2017/11/26.
//

#import "STNResponse.h"

NS_ASSUME_NONNULL_BEGIN

@interface STNMutableResponse : STNResponse

@property (nonatomic, assign) NSInteger code;
@property (nonatomic, strong) STNRequest *request;
@property (nonatomic, strong, nullable) STNResult *result;
@property (nonatomic, strong, nullable) NSError *error;

@end

NS_ASSUME_NONNULL_END
