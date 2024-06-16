//
//  TableViewDataSource.h
//  Obj-c training
//
//  Created by Sergei Veretennikov on 16.06.2024.
//

#import <UIKit/UIKit.h>
#import "SomeCellValue.h"

NS_ASSUME_NONNULL_BEGIN

@interface TableViewDataSource : NSObject <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, nullable) void (^onCellSelected)(SomeCellValue * cell);
- (instancetype _Nonnull) init;
@end

NS_ASSUME_NONNULL_END
