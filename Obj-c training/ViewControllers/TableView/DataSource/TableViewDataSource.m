//
//  TableViewDataSource.m
//  Obj-c training
//
//  Created by Sergei Veretennikov on 16.06.2024.
//

#import "TableViewDataSource.h"
#import "NetworkServiceImpl.h"
#import "BreedsArray.h"
#import "Breed.h"
#import "MyCell.h"

@interface TableViewDataSource ()
@property (nonatomic, copy) NSMutableArray<Breed *> * cells;
@end

@implementation TableViewDataSource
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {

    MyCell * tableViewCell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    Breed * cellData = self.cells[indexPath.item];
    [tableViewCell initWithCellData:cellData onDidTap:self.onCellSelected];
    return tableViewCell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section { 
    return self.cells.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (instancetype)initWithTableView:(UITableView *)tableView {
    self = [super init];
    if (self) {
        _tableView = tableView;
        _cells = [NSMutableArray array];
        _networkService = [[NetworkServiceImpl alloc] init];
        [self.networkService fetchDataForClass:BreedsArray.class urlString:@"https://catfact.ninja/breeds" completion:^(BreedsArray * _Nullable model) {
            __weak typeof(self) weak = self;
            weak.cells = model.data;
            dispatch_async(dispatch_get_main_queue(), ^{
                [weak.tableView reloadData];
            });
        }];
    }
    return self;
}

@end
