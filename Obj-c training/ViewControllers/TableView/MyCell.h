//
//  MyCell.h
//  Obj-c training
//
//  Created by Sergei Veretennikov on 16.06.2024.
//

#import <UIKit/UIKit.h>
#import "SomeCellValue.h"
#import "Breed.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyCell : UITableViewCell
@property (nonatomic, nullable) void (^onDidTap)(Breed * cell);

- (void) initWithCellData:(Breed *)cellData onDidTap:(void(^)(Breed * cell))onDidTap;
@end

NS_ASSUME_NONNULL_END
