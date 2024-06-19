//
//  VSDSConfigurableCell.h
//  Obj-c training
//
//  Created by Sergei Veretennikov on 19.06.2024.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VSDSConfigurableCell<Object: UITableViewCell *> : UITableViewCell
@property (nonatomic, readonly) NSString * vsdsReuseIdentifier;
@property (nonatomic) void (^configureContext)(Object _Nonnull cell);
@property (nonatomic, nullable) void (^onDidTap)(Object _Nonnull cell);
@property (nonatomic, nullable) NSNumber * cellHeight;

- (instancetype) initWithHeight:(nullable NSNumber *)height andConfigureContext:(void(^)(Object _Nonnull cell))configureContext onDidTap:(void(^)(Object _Nonnull cell))onDidTap;
- (instancetype) initWithHeight:(nullable NSNumber *)height andConfigureContext:(void(^)(Object _Nonnull cell))configureContext;

- (instancetype) initWithConfigureContext:(void(^)(Object _Nonnull cell))configureContext onDidTap:(void(^)(Object _Nonnull cell))onDidTap;
- (instancetype) initWithConfigureContext:(void(^)(Object _Nonnull cell))configureContext;
@end

NS_ASSUME_NONNULL_END
