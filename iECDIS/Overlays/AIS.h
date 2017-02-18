//
//  AIS.h
//  iECDIS
//
//  Created by Aun Johnsen on 1/12/17.
//  Copyright © 2017 Aun Johnsen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface AIS : NSObject

@property MKPlacemark *AISTarget;
@property NSNumber *AISTargetMMSI;
@property NSString *AISTargetStatus;
@property NSNumber *AISTargetHeading;
@property NSNumber *AISTargetVesselType;
@property NSNumber *AISTargetLat;
@property NSNumber *AISTargetLong;
@property NSNumber *AISTargetSOG;
@property NSNumber *AISTargetCOG;
@property NSNumber *AISTargetLOA;
@property NSNumber *AISTargetBeam;
@property NSNumber *AISTargetROT;
@property NSDate *AISTargetTimestamp;
@property NSNumber *AISTargetIMONumber;
@property NSString *AISTargetCallSign;
@property NSString *AISTargetName;
@property NSString *AISTargetDestination;
@property NSDate *AISTargetETA;

- (id) initWithGeo:(NSNumber *)MMSI:(NSNumber *)Lat:(NSNumber *)Long:(NSNumber *)Type;
- (NSString *)getAISVesselType:(NSNumber *)vesselType;
- (void) requestUpdate:(NSNumber *)MMSI;
- (void) updateAISTarget:(NSNumber *)MMSI:(NSString *)Telegram;

@end
