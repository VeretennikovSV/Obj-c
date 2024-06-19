//
//  VSDSDataSource.m
//  Obj-c training
//
//  Created by Sergei Veretennikov on 19.06.2024.
//

#import <Foundation/Foundation.h>
#import "VSDSDataSource.h"
#import "VSDSConfigurableCell.h"

@interface VSDSDataSource ()
@end

@implementation VSDSDataSource
@synthesize configurableCells = cells;

- (NSMutableArray<VSDSConfigurableCell *> *)configurableCells {
    return cells;
}

- (void)setConfigurableCells:(NSMutableArray<VSDSConfigurableCell *> *)configurableCells {
    cells = configurableCells;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    VSDSConfigurableCell * cellConfigurator = cells[indexPath.item];
    VSDSConfigurableCell * cell = [tableView dequeueReusableCellWithIdentifier:cellConfigurator.vsdsReuseIdentifier];
    cellConfigurator.configureContext(cell);
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section { 
    return cells.count;
}

- (void)addCell:(VSDSConfigurableCell *)cell {
    [self.tableView registerClass:cell.class forCellReuseIdentifier:cell.vsdsReuseIdentifier];
    [cells addObject:cell];
}

- (void)appendingCells:(NSArray<VSDSConfigurableCell *> *)cellArray {
    for (VSDSConfigurableCell * cell in cellArray) {
        [self.tableView registerClass:cell.class forCellReuseIdentifier:cell.vsdsReuseIdentifier];
    }
    [cells addObjectsFromArray:cellArray];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat cellHeight = cells[indexPath.item].cellHeight.floatValue;
    if (cellHeight) {
        return cellHeight;
    }
    return UITableViewAutomaticDimension;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    VSDSConfigurableCell * cell = cells[indexPath.item];
    if (cell.onDidTap) {
        cell.onDidTap(cell);
    }
}

- (instancetype)initWithTableView:(UITableView *)tableView {
    self = [super init];
    if (self) {
        _tableView = tableView;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self setConfigurableCells:[NSMutableArray array]];
    }
    return self;
}

@end
