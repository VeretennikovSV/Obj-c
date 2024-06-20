//
//  ErrorsThrower.m
//  Obj-c training
//
//  Created by Sergei Veretennikov on 20.06.2024.
//

#import <Foundation/Foundation.h>
#import "ErrorsThrower.h"

@implementation ErrorsThrower
- (NSString * _Nullable)methodWithError:(NSError ** _Nullable)error shouldThrow:(BOOL)shouldThrow {
    if (shouldThrow) {
        *error = [[NSError alloc] initWithDomain:NSItemProviderErrorDomain code:228 userInfo:@{}];
        return nil;
    } else {
        return @"Good";
    }
}

- (NSString * _Nullable)methodWithException:(BOOL)shouldThrow {
    if (shouldThrow) {
        @throw [[NSException alloc] initWithName:@"MyExc" reason:@"Check exc" userInfo:@{}];
    } else {
        return @"Hello. Here's no exceptions.";
    }
}

@end
