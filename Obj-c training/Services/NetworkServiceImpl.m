//
//  NetworkServiceImpl.m
//  Obj-c training
//
//  Created by Sergei Veretennikov on 17.06.2024.
//

#import <Foundation/Foundation.h>
#import "NetworkServiceImpl.h"
#import "BreedsArray.h"
#import "Obj_c_training-Swift.h"

@implementation NetworkServiceImpl

- (void) fetchDataForClass:(Class<Decodable>)type urlString:(NSString *)urlString completion:(void (^)(id model))completion {
    NSURL * url = [[NSURL alloc] initWithString:urlString];
    NSURLRequest * request = [[NSURLRequest alloc] initWithURL:url];
    NSURLSessionDataTask * dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
        if (data) {
            id result = [type initFromData: data error:error];
            completion(result);
        }
    }];
    [dataTask resume];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"Networking init");
    }
    return self;
}

@end
