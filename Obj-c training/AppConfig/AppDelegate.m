//
//  AppDelegate.m
//  Obj-c training
//
//  Created by Sergei Veretennikov on 13.06.2024.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "Obj_c_training-Swift.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow * window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    [self setWindow: window];

    IViewController * viewController = [[IViewController alloc] initWithName:@"Sergei"];
    [viewController printSomeShitsInteger:1 string:@"Hello"];
    UIViewController * rootViewController = [[ViewController alloc] init];
    UINavigationController * navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    UINavigationBarAppearance * appearance = [[UINavigationBarAppearance alloc] init];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}


@end
