//
//  AppDelegate.h
//  iECDIS
//
//  Created by Aun Johnsen on 3/11/2015.
//  Copyright (c) 2015 Aun Johnsen. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <MapKit/MapKit.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong) NSViewController *contentViewController;


@end

