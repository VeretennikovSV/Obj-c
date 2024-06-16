//
//  UIViewAutoLayout.h
//  Obj-c training
//
//  Created by Sergei Veretennikov on 14.06.2024.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface  UIView (Autolayout)
- (void) autoLayoutWith:(UIView *)view;
- (void)setToEdgesOf:(UIView *)view;
@end

@interface UITextField (TFSyle)
- (void)defaultStyleWith:(CGColorRef *)color;
@end
