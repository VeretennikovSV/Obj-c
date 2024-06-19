//
//  Breed.m
//  Obj-c training
//
//  Created by Sergei Veretennikov on 17.06.2024.
//

#import <Foundation/Foundation.h>
#import "Breed.h"

@implementation Breed

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dictionary];
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Coat - %@\nPattern - %@\nOrigin - %@\nCountry - %@\nBreed - %@", self.coat, self.pattern, self.origin, self.country, self.breed];
}

+ (NSArray<Breed *> *)breedsFromJSONArray:(NSArray *)jsonArray {
    NSMutableArray<Breed *> * breedsArray = [NSMutableArray array];

    for (NSDictionary *dict in jsonArray) {
        Breed * breed = [[Breed alloc] initWithDictionary:dict];
        [breedsArray addObject:breed];
    }
    return breedsArray;
}

@end
