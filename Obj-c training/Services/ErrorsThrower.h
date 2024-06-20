//
//  ErrorsThrower.h
//  Obj-c training
//
//  Created by Sergei Veretennikov on 20.06.2024.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface ErrorsThrower : NSObject
- (NSString * _Nullable)methodWithError:(NSError ** _Nullable)error shouldThrow:(BOOL)shouldThrow;
- (NSString * _Nullable)methodWithException:(BOOL)shouldThrow;
@end
NS_ASSUME_NONNULL_END
