//
//  Breed.m
//  Obj-c training
//
//  Created by Sergei Veretennikov on 17.06.2024.
//

#import <Foundation/Foundation.h>
#import "Breed.h"

@implementation Breed

- (NSString *)description
{
    return [NSString stringWithFormat:@"Coat - %@\nPattern - %@\nOrigin - %@\nCountry - %@\nBreed - %@", self.coat, self.pattern, self.origin, self.country, self.breed];
}

+ (instancetype)initFromData:(NSData *)data error:(NSError *)error {
    Breed * breed = [[Breed alloc] init];
    NSDictionary * json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if (error) {

    }
    [breed setValuesForKeysWithDictionary:json];
    return breed;
}

@end
