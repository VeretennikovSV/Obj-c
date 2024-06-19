//
//  VSDSConfigurableCell.m
//  Obj-c training
//
//  Created by Sergei Veretennikov on 19.06.2024.
//

#import <UIKit/UIKit.h>
#import "VSDSConfigurableCell.h"

@implementation VSDSConfigurableCell
- (NSString *)vsdsReuseIdentifier {
    return NSStringFromClass([self class]);
}

- (void)prepareForReuse {
    [super prepareForReuse];
    for (UIView * contentView in self.contentView.subviews) {
        [contentView removeFromSuperview];
    }
}

- (instancetype)initWithConfigureContext:(void (^)(UITableViewCell * _Nonnull))configureContext onDidTap:(void (^)(UITableViewCell * _Nonnull))onDidTap {
    self = [self initWithConfigureContext:configureContext];
    if (self) {
        _onDidTap = onDidTap;
    }
    return self;
}

- (instancetype)initWithHeight:(NSNumber *)height andConfigureContext:(void (^)(UITableViewCell * _Nonnull))configureContext onDidTap:(void (^)(UITableViewCell * _Nonnull))onDidTap {
    self = [self initWithHeight:height andConfigureContext:configureContext];
    if (self) {
        _onDidTap = onDidTap;
    }
    return self;
}

- (instancetype)initWithHeight:(NSNumber *)height andConfigureContext:(void (^)(UITableViewCell * _Nonnull))configureContext {
    self = [self initWithConfigureContext:configureContext];
    if (self) {
        _cellHeight = height;
    }
    return self;
}

- (instancetype)initWithConfigureContext:(void (^)(UITableViewCell * _Nonnull))configureContext {
    self = [super init];
    if (self) {
        _configureContext = configureContext;
    }
    return self;
}

- (instancetype)init
{
    [NSException raise:@"WrongInitializer" format:@"Should be used initializers with configure context"];
    return [super init];
}

@end
