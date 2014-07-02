//
//  AppDelegate.m
//  Grades
//
//  Created by CS3714 on 12/15/12.
//  Copyright (c) 2012 Chris Jones. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    /************************************
     All application-specific and user data files must be written to the Documents directory. Nothing can be written
     into application's main bundle because it is locked for writing after your app is published. The contents of the
     Documents directory are backed up by iTunes during backup of an iOS device. Therefore, the user can recover the
     data written by your app from an earlier device backup.
     
     The Documents directory path on an iOS device is different from the one used for iOS Simulator.
     
     To obtain the Documents directory path, you use the NSSearchPathForDirectoriesInDomains function.
     However, this function was designed originally for Mac OS X, where multiple such directories could exist.
     Therefore, it returns an array of paths rather than a single path.
     For iOS, the resulting array's objectAtIndex:0 is the path to the Documents directory.
     ************************************/
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectoryPath = [paths objectAtIndex:0];
    NSString *plistFilePathInDocumentsDirectory = [documentsDirectoryPath stringByAppendingPathComponent:@"Courses.plist"];
    
    NSMutableDictionary *courseList = [[NSMutableDictionary alloc] initWithContentsOfFile:plistFilePathInDocumentsDirectory];
    
    if (!courseList) {
        
        NSString *plistFilePathInMainBundle = [[NSBundle mainBundle] pathForResource:@"Courses" ofType:@"plist"];
        
        // Instantiate a modifiable dictionary and initialize it with the content of the plist file in main bundle
        courseList = [[NSMutableDictionary alloc] initWithContentsOfFile:plistFilePathInMainBundle];
    }
    self.courseList = courseList;

   

    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    //Writes back the courseList dictionary once the user is done with it.
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectoryPath = [paths objectAtIndex:0];
    NSString *plistFilePathInDocumentsDirectory = [documentsDirectoryPath stringByAppendingPathComponent:@"Courses.plist"];
    
    [self.courseList writeToFile:plistFilePathInDocumentsDirectory atomically:YES];
    /*
     The flag "atomically" specifies whether the file should be written atomically or not.
     
     If flag is YES, the countryCities dictionary is written to an auxiliary file, and then the auxiliary file is
     renamed to path plistFilePathInDocumentsDirectory
     
     If flag is NO, the countryCities dictionary is written directly to path plistFilePathInDocumentsDirectory.
     
     The YES option guarantees that the path will not be corrupted even if the system crashes during writing.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
