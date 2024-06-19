//
//  BreedsArray.m
//  Obj-c training
//
//  Created by Sergei Veretennikov on 17.06.2024.
//

#import <Foundation/Foundation.h>
#import "BreedsArray.h"

@implementation BreedsArray 

+ (instancetype)initWithData:(NSData *)data error:(NSError *)error {
    NSDictionary * json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if (error) {
        return nil;
    }
    return [[BreedsArray alloc] initWithDictionary: json];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _currentPage = dictionary[@"currentPage"];
        _data = [Breed breedsFromJSONArray:dictionary[@"data"]];
    }
    return self;
}

@end
