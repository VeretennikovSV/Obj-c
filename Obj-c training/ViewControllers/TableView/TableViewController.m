//
//  TableViewController.m
//  Obj-c training
//
//  Created by Sergei Veretennikov on 16.06.2024.
//

#import "TableViewController.h"
#import "UIViewAutoLayout.h"
#import "MyCell.h"
#import "ViewController.h"
#import "BreedDetails.h"

@interface TableViewController ()
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, retain) TableViewDataSource * dataSource;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self setTableViewConstraints];
}

- (void)setTableViewConstraints {
    [self.tableView autoLayoutWith:self.view];

    [NSLayoutConstraint activateConstraints:@[
        [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeTop multiplier:1 constant:0],
        [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1 constant:0],
        [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1 constant:0],
        [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1 constant:0],
    ]];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _tableView = [[UITableView alloc] init];
        [self.tableView registerClass:MyCell.class forCellReuseIdentifier:@"cell"];
        
        _dataSource = [[TableViewDataSource alloc] initWithTableView:self.tableView];
        self.dataSource.onCellSelected = ^(Breed * cell) {
            __weak typeof(self) weakSelf = self;
            BreedDetails * detailsViewController = [[BreedDetails alloc] initWithBreed:cell];
            [weakSelf.navigationController pushViewController:detailsViewController animated:true];
        };
        self.tableView.dataSource = self.dataSource;
        self.tableView.delegate = self.dataSource;
    }
    return self;
}

@end
