
/*
 *********************************************************************************
 Created by Alberto Iglesias (alberto@visualnet.inf.br)
 Copyright (c) 1999-2017 by Visual Net. All rights reserved.
 *********************************************************************************
 */

#import <Foundation/Foundation.h>
#import "iCore.h"

@class B4I;
//~shortname:DatePersian
//~event:onInitialized(EventName As String)
//~version:1.00
//~author:Alberto Iglesias (alberto@visualnet.inf.br)

@interface B4IDatePersian : NSObject

//Enable/Disable Debug mode from Library
@property (nonatomic, readwrite)BOOL DebugMode;

//Author of this Library
@property (nonatomic, readonly)NSString *Author;

//Library Version
@property (nonatomic, readonly)NSString *Version;

//Initializes the object.
- (void)Initialize:(B4I *)bi :(NSString *)EventName;

//Convert to date Persian
- (NSString *)ToPersian:(B4I*)bi :(int)Year :(int)Month :(int)Day :(NSString *)Separator;

//Convert to date Persian from today
- (NSString *)ToPersianToday:(B4I*)bi :(NSString *)Separator;


@end
