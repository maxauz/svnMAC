//
//  AppDelegate.h
//  FacturaDB
//
//  Created by Rafael Delgado Aparicio on 14/12/12.
//  Copyright (c) 2012 Saga Falabella. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
@interface AppDelegate : UIResponder {
 NSString *dataBaseName;
    NSString *dataBasePath;
}

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic,retain) NSString *dataBaseName;
@property (nonatomic,retain) NSString *dataBasePath;

-(void)loadDB;

@end
