//
//  TableViewDataSource.m
//  Obj-c training
//
//  Created by Sergei Veretennikov on 16.06.2024.
//

#import "TableViewDataSource.h"
#import "MyCell.h"

@interface TableViewDataSource ()
@property (nonatomic, copy) NSMutableArray<SomeCellValue *> * cells;
@end

@implementation TableViewDataSource
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath { 
    MyCell * tableViewCell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    SomeCellValue * cellData = self.cells[indexPath.item];
    [tableViewCell initWithCellData:cellData onDidTap:self.onCellSelected];
    return tableViewCell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section { 
    return self.cells.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (instancetype)init
{
    self = [super init];
    NSMutableArray<SomeCellValue *> * array = [[NSMutableArray alloc] initWithObjects:
                                            [[SomeCellValue alloc] initWithText:@"Test1" position:1],
                                            [[SomeCellValue alloc] initWithText:@"Test2" position:2],
                                            [[SomeCellValue alloc] initWithText:@"Test3" position:3],
                                            [[SomeCellValue alloc] initWithText:@"Test4" position:4], nil];

    if (self) {
        self.cells = [[NSMutableArray alloc] initWithArray:array];
    }
    return self;
}

@end
