//
//  MyCell.h
//  Obj-c training
//
//  Created by Sergei Veretennikov on 16.06.2024.
//

#import <UIKit/UIKit.h>
#import "SomeCellValue.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyCell : UITableViewCell
@property (nonatomic, nullable) void (^onDidTap)(SomeCellValue * cell);

- (void) initWithCellData:(SomeCellValue *)cellData onDidTap:(void(^)(SomeCellValue * cell))onDidTap;
@end

NS_ASSUME_NONNULL_END
