//
//  SomeCellValue.h
//  Obj-c training
//
//  Created by Sergei Veretennikov on 16.06.2024.
//

#import <UIKit/UIKit.h>

@interface SomeCellValue : NSObject

@property (nonatomic, assign) NSString * text;
@property (nonatomic) int position;

- (instancetype)initWithText:(NSString *)text position:(int)position;

@end
