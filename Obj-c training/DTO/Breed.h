//
//  Breed.h
//  Obj-c training
//
//  Created by Sergei Veretennikov on 17.06.2024.
//

@interface Breed : NSObject
@property (nonatomic, copy) NSString *breed;
@property (nonatomic, copy) NSString *country;
@property (nonatomic, copy) NSString *origin;
@property (nonatomic, copy) NSString *coat;
@property (nonatomic, copy) NSString *pattern;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
+ (NSArray<Breed *> *)breedsFromJSONArray:(NSArray *)jsonArray;

@end
