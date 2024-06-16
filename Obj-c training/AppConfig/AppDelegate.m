//
//  AppDelegate.m
//  Obj-c training
//
//  Created by Sergei Veretennikov on 13.06.2024.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow * window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    [self setWindow: window];

    UIViewController * rootViewController = [[ViewController alloc] init];
    UINavigationController * navigationController = [[UINavigationController alloc] initWithRootViewController:rootViewController];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}


@end
