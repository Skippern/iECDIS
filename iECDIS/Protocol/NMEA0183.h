//
//  NMEA0183.h
//  iECDIS
//
//  Created by Aun Johnsen on 2/10/16.
//  Copyright © 2016 Aun Johnsen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NMEA0183 : NSObject

- (void)NMEA0183decoder:(NSString *)Telegram;

@end
