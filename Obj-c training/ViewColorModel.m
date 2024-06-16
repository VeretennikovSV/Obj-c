//
//  ViewColorModel.m
//  Obj-c training
//
//  Created by Sergei Veretennikov on 15.06.2024.
//

#import <Foundation/Foundation.h>
#import "ViewColorModel.h"

@interface ViewColorModel ()

@property  CGFloat redFloat;
@property  CGFloat greenFloat;
@property  CGFloat blueFloat;

@end

@implementation ViewColorModel

- (uint)red {
    int wrappedValue = (int)self.redFloat;
    return wrappedValue;
}
- (void)setRed:(uint)red {
    float redValue = [[NSNumber numberWithInt:red] floatValue] / 255;
    self.redFloat = redValue;
    [self updateColor];
}

- (uint)green {
    int wrappedValue = (int)self.redFloat;
    return wrappedValue;
}
- (void)setGreen:(uint)red {
    float greenValue = [[NSNumber numberWithInt:red] floatValue] / 255;
    self.greenFloat = greenValue;
    [self updateColor];
}

- (uint)blue {
    int wrappedValue = (int)self.redFloat;
    return wrappedValue;
}
- (void)setBlue:(uint)red {
    float blueValue = [[NSNumber numberWithInt:red] floatValue] / 255;
    self.blueFloat = blueValue;
    [self updateColor];
}

- (void) updateColor {
    UIColor * newColor = [UIColor colorWithRed:self.redFloat green:self.greenFloat blue:self.blueFloat alpha:1];
    _color = newColor;
}

- (instancetype)initWithRed:(float)red green:(float)green blue:(float)blue {
    self = [super init];
    if (self) {
        self.redFloat = red;
        self.greenFloat = green;
        self.blueFloat = blue;
        [self updateColor];
    }
    return self;
}

@end
