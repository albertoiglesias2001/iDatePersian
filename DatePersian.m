
/*
  *********************************************************************************
  Created by Alberto Iglesias (alberto@visualnet.inf.br)
  Copyright (c) 1999-2017 by Visual Net. All rights reserved.
  *********************************************************************************
*/

#import "DatePersian.h"
#import "iCore.h"

@interface B4IDatePersian ()

@end

@implementation B4IDatePersian
{

}


-(void)Initialize:(B4I*)bi :(NSString *)EventName {
    [B4IObjectWrapper setBIAndEventName:self :bi :EventName];
   
  //*********************************************************************************
    _Author = @"Alberto Iglesias (alberto@visualnet.inf.br)";
    _Version = @"1.0.0";
  //*********************************************************************************
    
    [NSThread detachNewThreadSelector:@selector(RetornoMensagem:) toTarget:self withObject:EventName];
   
}

- (NSString *)ToPersian:(B4I*)bi :(int)Year :(int)Month :(int)Day :(NSString *)Separator {
    
    

    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *gregorianComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
    
    NSLog(@"[In Gregorian calendar ->] Day: %ld, Month: %ld, Year:%ld",
          (long)[gregorianComponents day],
          (long)[gregorianComponents month],
          (long)[gregorianComponents year]);
    
    gregorianComponents.day = Day;
    gregorianComponents.month = Month;
    gregorianComponents.year = Year;
    
    // Create the date
    NSDate *date = [gregorianCalendar dateFromComponents:gregorianComponents];
    
     NSCalendar *hijriCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierPersian];
    
    NSDateComponents *hijriComponents = [hijriCalendar components:(NSCalendarUnitDay |
                                                                   NSCalendarUnitMonth |
                                                                   NSCalendarUnitYear)
                                                         fromDate:date];
    
    
    NSString *retDate = [NSString stringWithFormat:@"%ld%@%ld%@%ld",
                         (long)[hijriComponents year],Separator,
                         (long)[hijriComponents month],Separator,
                         (long)[hijriComponents day], nil];
 
    
    if (_DebugMode) NSLog(@"retDate =  %@", retDate);
    
    return retDate;
    
}

- (NSString *)ToPersianToday:(B4I*)bi :(NSString *)Separator {
    
    
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *gregorianComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
    
    if (_DebugMode) NSLog(@"[In Gregorian calendar ->] Day: %ld, Month: %ld, Year:%ld",
          (long)[gregorianComponents day],
          (long)[gregorianComponents month],
          (long)[gregorianComponents year]);
    
    
    gregorianComponents.day = [gregorianComponents day];
    gregorianComponents.month = [gregorianComponents month];
    gregorianComponents.year = [gregorianComponents year];
    
    NSDate *date = [gregorianCalendar dateFromComponents:gregorianComponents];
    
    NSCalendar *hijriCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierPersian];
    
    NSDateComponents *hijriComponents = [hijriCalendar components:(NSCalendarUnitDay |
                                                                   NSCalendarUnitMonth |
                                                                   NSCalendarUnitYear)
                                                         fromDate:date];
    
    
    if (_DebugMode)  NSLog(@"[In Hijri calendar ->] Day: %ld, Month: %ld, Year:%ld",
          (long)[hijriComponents day],
          (long)[hijriComponents month],
          (long)[hijriComponents year]);
    
    
    NSString *retDate = [NSString stringWithFormat:@"%ld%@%ld%@%ld",
                         (long)[hijriComponents year],Separator,
                         (long)[hijriComponents month],Separator,
                         (long)[hijriComponents day], nil];
    
    
    if (_DebugMode) NSLog(@"retDate =  %@", retDate);
    
    return retDate;
    
    
}

#pragma mark - ********** ⬇ Eventos ⬇ **********

-(void)RetornoMensagem:(NSString *)pMensagem
{
    if(_DebugMode) NSLog(@"RetornoMensagem: %@",pMensagem);
    [B4IObjectWrapper raiseEventFromDifferentThread:self :@"_oninitialized:" :@[pMensagem]];
}



@end
