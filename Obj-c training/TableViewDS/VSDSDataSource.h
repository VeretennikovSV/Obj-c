//
//  VSDSDataSource.h
//  Obj-c training
//
//  Created by Sergei Veretennikov on 19.06.2024.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "VSDSConfigurableCell.h"

@interface VSDSDataSource : NSObject <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak) UITableView * tableView;
@property (nonatomic, copy) NSMutableArray<VSDSConfigurableCell *> * configurableCells;
- (void)addCell:(VSDSConfigurableCell *)cell;
- (void)appendingCells:(NSArray<VSDSConfigurableCell *> *)cellArray;
- (instancetype)initWithTableView:(UITableView *)tableView;
@end
