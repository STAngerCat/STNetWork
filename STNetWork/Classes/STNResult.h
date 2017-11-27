//
//  STNResult.h
//  STNetWork
//
//  Created by Mapleiny on 2017/11/25.
//

#import <Foundation/Foundation.h>

@interface STNResult : NSObject

@property (nonatomic, strong, readonly, nullable) NSData* rawData;

- (NSString *)rawString;
- (nullable id)jsonObject;

@end
