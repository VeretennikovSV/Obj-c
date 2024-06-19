//
//  BreedDetails.h
//  Obj-c training
//
//  Created by Sergei Veretennikov on 17.06.2024.
//

#import <UIKit/UIKit.h>
#import "Breed.h"

NS_ASSUME_NONNULL_BEGIN

@interface BreedDetails : UIViewController <UIScrollViewDelegate>
- (instancetype) initWithBreed:(Breed *)breed;
@end

NS_ASSUME_NONNULL_END
