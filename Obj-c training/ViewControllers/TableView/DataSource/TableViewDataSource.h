//
//  TableViewDataSource.h
//  Obj-c training
//
//  Created by Sergei Veretennikov on 16.06.2024.
//

#import <UIKit/UIKit.h>
#import "SomeCellValue.h"
#import "NetworkServiceImpl.h"
#import "BreedsArray.h"

NS_ASSUME_NONNULL_BEGIN

@interface TableViewDataSource : NSObject <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak) UITableView * tableView;
@property (nonatomic, nullable) void (^onCellSelected)(Breed * cell);
@property (nonatomic) NetworkServiceImpl<BreedsArray *> * networkService;
- (instancetype _Nonnull) initWithTableView:(UITableView *)tableView;
@end

NS_ASSUME_NONNULL_END
