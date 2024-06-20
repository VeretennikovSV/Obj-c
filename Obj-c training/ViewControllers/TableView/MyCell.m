//
//  MyCell.m
//  Obj-c training
//
//  Created by Sergei Veretennikov on 16.06.2024.
//

#import "MyCell.h"
#import "UIViewAutoLayout.h"
#import "Breed.h"
#import <objc/runtime.h>

@interface MyCell ()
@property (atomic, strong) UIStackView * stack;
@property (nonatomic, assign) Breed * cellData;
@end

@implementation MyCell

- (void)prepareForReuse {
    [super prepareForReuse];
    for (UIView * view in self.stack.arrangedSubviews) {
        [view removeFromSuperview];
    }
}

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
    NSMutableArray<UILabel *> * subviews = [NSMutableArray array];
    if (self.cellData.origin) {
        UILabel * label = [[UILabel alloc] init];
        label.text = self.cellData.origin;
        [subviews addObject: label];
    }
    if (self.cellData.breed) {
        UILabel * label = [[UILabel alloc] init];
        label.text = self.cellData.breed;
        [subviews addObject: label];
    }
    if (self.cellData.country) {
        UILabel * label = [[UILabel alloc] init];
        label.text = self.cellData.country;
        [subviews addObject: label];
    }
    if (self.cellData.coat) {
        UILabel * label = [[UILabel alloc] init];
        label.text = self.cellData.coat;
        [subviews addObject: label];
    }
    if (self.cellData.pattern) {
        UILabel * label = [[UILabel alloc] init];
        label.text = self.cellData.pattern;
        [subviews addObject: label];
    }

    for (UILabel * label in subviews) {
        label.font = [UIFont systemFontOfSize:12 weight:UIFontWeightSemibold];
        [self.stack addArrangedSubview:label];
    }
}

- (void) setStackOnSubview {
    self.stack.axis = UILayoutConstraintAxisVertical;
    self.stack.spacing = 4;
    self.stack.alignment = UIStackViewAlignmentLeading;
    [self.stack setToEdgesOf:self.contentView];
}

- (void)initWithCellData:(Breed *)cellData onDidTap:(void (^__weak)(Breed *__weak))onDidTap {
    if (self) {
        _stack = [[UIStackView alloc] init];
        _cellData = cellData;
        [self setViews];
        _onDidTap = onDidTap;
        [self setStackOnSubview];
    }
}

@end
