//
//  NetworkServiceImpl.h
//  Obj-c training
//
//  Created by Sergei Veretennikov on 17.06.2024.
//

#import "NetworkService.h"
#import <UIKit/UIKit.h>
#import "Decodable.h"

#ifndef NetworkServiceImpl_h
#define NetworkServiceImpl_h

NS_ASSUME_NONNULL_BEGIN

@interface NetworkServiceImpl<Object> : NSObject
- (void) fetchDataForClass:(Class<Decodable>)type urlString:(NSString *)urlString completion:(void (^)(_Nullable Object model))completion;
- (instancetype) init;
@end

NS_ASSUME_NONNULL_END

#endif /* NetworkServiceImpl_h */
