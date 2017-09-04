//
//  WayPoint.h
//  iECDIS
//
//  Created by Aun Johnsen on 9/4/17.
//  Copyright © 2017 Aun Johnsen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "Position.h"

@interface WayPoint : NSObject

@property MKPlacemark *WPMarker;
@property NSNumber *WPID;
@property NSString *WPName;
@property Position *WPPos;

@end
