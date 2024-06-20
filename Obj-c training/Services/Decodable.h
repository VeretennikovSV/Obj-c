//
//  Decodable.h
//  Obj-c training
//
//  Created by Sergei Veretennikov on 20.06.2024.
//

@protocol Decodable <NSObject>
+ (instancetype)initFromData:(NSData *)data error:(NSError *)error;
@end
