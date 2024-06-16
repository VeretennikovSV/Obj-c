//
//  SomeCellValue.m
//  Obj-c training
//
//  Created by Sergei Veretennikov on 16.06.2024.
//

#import <Foundation/Foundation.h>
#import "SomeCellValue.h"

@implementation SomeCellValue

- (instancetype)initWithText:(NSString *)text position:(int)position {
    self = [super init];
    if (self) {
        self.text = text;
        self.position = position;
    }
    return self;
}

@end
