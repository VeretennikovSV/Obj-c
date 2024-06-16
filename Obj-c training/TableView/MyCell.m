//
//  MyCell.m
//  Obj-c training
//
//  Created by Sergei Veretennikov on 16.06.2024.
//

#import "MyCell.h"
#import "UIViewAutoLayout.h"

@interface MyCell ()
@property (nonatomic, assign) SomeCellValue * cellData;
@end

@implementation MyCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    if (selected) {
        [super setSelected:NO animated:YES];
        if (self.onDidTap) {
            self.onDidTap(self.cellData);
        }
    }
}

- (void)setViews {
    UILabel * label = [[UILabel alloc] init];
    UILabel * countLabel = [[UILabel alloc] init];
    UIStackView * stack = [[UIStackView alloc] init];
    label.font = [UIFont systemFontOfSize:30];

    stack.axis = UILayoutConstraintAxisHorizontal;
    stack.spacing = 16;

    label.text = self.cellData.text;
    NSString * stringValue = [[NSString alloc ] initWithFormat:@"%i", self.cellData.position];
    countLabel.text = stringValue;

    [stack autoLayoutWith:self.contentView];
    stack.alignment = UIStackViewAlignmentBottom;

    [NSLayoutConstraint activateConstraints:@[
        [NSLayoutConstraint constraintWithItem:stack attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView.safeAreaLayoutGuide attribute:NSLayoutAttributeTop multiplier:1 constant:0],
        [NSLayoutConstraint constraintWithItem:stack attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.contentView.safeAreaLayoutGuide attribute:NSLayoutAttributeLeading multiplier:1 constant:0],
        [NSLayoutConstraint constraintWithItem:stack attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView.safeAreaLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1 constant:0]
    ]];

    [stack addArrangedSubview: label];
    [stack addArrangedSubview:countLabel];
}

- (void)initWithCellData:(SomeCellValue *)cellData onDidTap:(void (^__weak)(SomeCellValue *__weak))onDidTap {
    if (self) {
        self.cellData = cellData;
        [self setViews];
        self.onDidTap = onDidTap;
    }
}

@end
