//
//  AppDelegate.h
//  MacroTracker
//
//  Created by Thijs on 30/06/2018.
//  Copyright © 2018 Thijs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;

@end

