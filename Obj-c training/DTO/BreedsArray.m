//
//  BreedsArray.m
//  Obj-c training
//
//  Created by Sergei Veretennikov on 17.06.2024.
//

#import <Foundation/Foundation.h>
#import "BreedsArray.h"

@implementation BreedsArray 
- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _currentPage = dictionary[@"currentPage"];
        NSError * error = [[NSError alloc] init];
        NSMutableArray<Breed *> * breeds = [NSMutableArray array];
        for (NSDictionary * breed in dictionary[@"data"]) {
            NSData * data = [NSJSONSerialization dataWithJSONObject:breed options:NSJSONReadingMutableContainers error:&error];
            Breed * breed = [Breed initFromData:data error:error];
            [breeds addObject:breed];
        }
        _data = breeds;
    }
    return self;
}

+ (instancetype)initFromData:(NSData *)data error:(NSError *)error {
    NSDictionary * json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if (error) {
        return nil;
    }
    return [[BreedsArray alloc] initWithDictionary: json];
}

@end
