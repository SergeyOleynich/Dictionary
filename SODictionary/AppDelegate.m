//
//  AppDelegate.m
//  SODictionary
//
//  Created by Sergey on 27.06.15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import "AppDelegate.h"
#import "SOStudent.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSArray *names = @[@"Sergey", @"Alex", @"Sacha", @"Maxim", @"Andrey", @"Misha", @"Vova", @"Ilya"];
    
    NSArray *lastNames = @[@"Balabanov", @"Balabanov", @"Vashyk", @"Shevchenko", @"Izotov", @"Rydenko", @"Shovko", @"Brig"];
    
    NSArray *phreses = @[@"Hello to all",
                         @"Hello to everyone",
                         @"Hello!",
                         @"Hi",
                         @"Hi guys!",
                         @"How are you doing?",
                         @"Hel-lo",
                         @"Hi, hi, hi!"];
    
    NSMutableDictionary *jounal = [NSMutableDictionary dictionary];
    
    for (int i = 0; i < names.count; i++) {
        SOStudent *student = [[SOStudent alloc] init];
        student.firstName = [names objectAtIndex:i];
        student.lastName = [lastNames objectAtIndex:i];
        student.helloPhrase = [phreses objectAtIndex:i];
        [jounal setObject:student forKey:[NSString stringWithFormat:@"%@ %@", student.lastName, student.firstName]];
    }
    
    SOStudent *student;
    for (int i = 0; i < [[jounal allKeys] count]; i++) {
        student = [jounal objectForKey:[[jounal allKeys] objectAtIndex:i]];
        NSLog(@"%@ %@ said:\"%@\"", student.lastName, student.firstName, student.helloPhrase);
    }
    
    NSArray *sortedKeys = [jounal keysSortedByValueUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSString *firstStudent = [((SOStudent *)obj1).lastName stringByAppendingString:((SOStudent *)obj1).firstName];
        NSString *secondStudent = [((SOStudent *)obj2).lastName stringByAppendingString:((SOStudent *)obj2).firstName];
        return [firstStudent compare:secondStudent];
    }];
    
    NSLog(@"%@", sortedKeys);
    
    for (int i = 0; i < [sortedKeys count]; i++) {
        student = [jounal objectForKey:[sortedKeys objectAtIndex:i]];
        NSLog(@"%@ %@ said:\"%@\"", student.lastName, student.firstName, student.helloPhrase);
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
