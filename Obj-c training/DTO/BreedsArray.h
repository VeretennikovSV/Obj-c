//
//  BreedsArray.h
//  Obj-c training
//
//  Created by Sergei Veretennikov on 17.06.2024.
//

#ifndef BreedsArray_h
#define BreedsArray_h
#import "Breed.h"
#import "Decodable.h"

#pragma mark - Object interfaces

@interface BreedsArray : NSObject <Decodable>
@property (nonatomic, assign)         NSInteger currentPage;
@property (nonatomic, copy)           NSArray<Breed *> *data;
@end


#endif /* BreedsArray_h */
