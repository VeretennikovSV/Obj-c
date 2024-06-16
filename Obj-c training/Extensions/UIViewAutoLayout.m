//
//  UIViewAutoLayout.m
//  Obj-c training
//
//  Created by Sergei Veretennikov on 14.06.2024.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIViewAutoLayout.h"

@implementation UIView (Autolayout)

- (void)autoLayoutWith:(UIView *)view {
    self.translatesAutoresizingMaskIntoConstraints = false;
    [view addSubview:self];
}

- (void)setToEdgesOf:(UIView *)view {
    [self autoLayoutWith:view];
    [NSLayoutConstraint activateConstraints:@[
        [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:view.safeAreaLayoutGuide attribute:NSLayoutAttributeTop multiplier:1 constant:0],
        [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:view.safeAreaLayoutGuide attribute:NSLayoutAttributeLeading multiplier:1 constant:0],
        [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:view.safeAreaLayoutGuide attribute:NSLayoutAttributeTrailing multiplier:1 constant:0],
        [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:view.safeAreaLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1 constant:0]
    ]];
}

@end

@implementation UITextField (TFStyle)

- (void)defaultStyleWith:(CGColorRef *)color {
    self.borderStyle = UITextBorderStyleRoundedRect;
    self.layer.borderColor = color;
    self.layer.borderWidth = 1;
    self.layer.cornerRadius = 4;
//    self.keyboardType = UIKeyboardTypeNumberPad;
}

@end
