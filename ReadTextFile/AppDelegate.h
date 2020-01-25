//
//  AppDelegate.h
//  ReadTextFile
//
//  Created by John Tran on 1/25/20.
//  Copyright © 2020 John Tran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

