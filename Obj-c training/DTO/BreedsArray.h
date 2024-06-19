//
//  BreedsArray.h
//  Obj-c training
//
//  Created by Sergei Veretennikov on 17.06.2024.
//

#ifndef BreedsArray_h
#define BreedsArray_h
#import "Breed.h"

#pragma mark - Object interfaces

@interface BreedsArray : NSObject
@property (nonatomic, assign)         NSInteger currentPage;
@property (nonatomic, copy)           NSArray<Breed *> *data;
//@property (nonatomic, copy)           NSString *firstPageURL;
//@property (nonatomic, assign)         NSInteger from;
//@property (nonatomic, assign)         NSInteger lastPage;
//@property (nonatomic, copy)           NSString *lastPageURL;
//@property (nonatomic, copy)           NSArray<QTLink *> *links;
//@property (nonatomic, copy)           NSString *nextPageURL;
//@property (nonatomic, copy)           NSString *path;
//@property (nonatomic, assign)         NSInteger perPage;
//@property (nonatomic, nullable, copy) id prevPageURL;
//@property (nonatomic, assign)         NSInteger to;
//@property (nonatomic, assign)         NSInteger total;

//+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
//+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;
//- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
//- (NSData *_Nullable)toData:(NSError *_Nullable *)error;

- (instancetype) initWithDictionary:(NSDictionary *)dictionary;
+ (instancetype) initWithData:(NSData *)data error:(NSError *)error;

@end

//@interface QTLink : NSObject
//@property (nonatomic, nullable, copy) NSString *url;
//@property (nonatomic, copy)           NSString *label;
//@property (nonatomic, assign)         BOOL isActive;
//@end

#endif /* BreedsArray_h */
