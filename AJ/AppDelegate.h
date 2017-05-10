//
//  AppDelegate.h
//  AJ
//
//  Created by TCG Digital on 10/05/17.
//  Copyright © 2017 TCG Digital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

