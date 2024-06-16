//
//  ViewColorModel.m
//  Obj-c training
//
//  Created by Sergei Veretennikov on 15.06.2024.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ViewColorModel : NSObject

@property (nonatomic, assign) uint red;
@property (nonatomic, assign) uint green;
@property (nonatomic, assign) uint blue;
@property (readonly) UIColor * color;

- (instancetype) initWithRed:(float)red green:(float)green blue:(float)blue;

@end
//- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
