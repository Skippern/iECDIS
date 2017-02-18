//
//  NMEA0183.m
//  iECDIS
//
//  Created by Aun Johnsen on 2/10/16.
//  Copyright © 2016 Aun Johnsen. All rights reserved.
//
// This file contains rules for how to evaluate the content of NMEA0183 messages, what each telegram type represents, and what each segment value means
//

#import "NMEA0183.h"

@implementation NMEA0183

- (void)NMEA0183decoder:(NSString *)Telegram
{
    // Example:
    // $GPGGA,123519,4807.038,N,01131.000,E,1,08,0.9,545.4,M,46.9,M,,*47
    // <telegram>,<time>,<lat,N/S>,<long,E/W>,<fix quality>,<no satelites>,<HDOP>,<altitude,M>,<geoid height,M>,<DGPS corr age>,<DGPS ID>,<checksum>
    NSArray *teleArray = [Telegram componentsSeparatedByString:@","];
    if ([teleArray[0] hasSuffix:@"GGA"]) {
        // [1] = UTC time
        // [2],[3] = Lat
        // [4],[5] = long
        // [6] = Fix quality
        // [7] = Number of Satellites tracked
        // [8] = HDOP
        // [9],[10] = Altitudes, Meters, above mean sea level
        // [11],[12] = Height of geoid (mean sea level) above WGS84 ellipsoid
        // [13] = time in seconds since last DGPS update
        // [14] = DGPS station ID number
        // [15] = checksum
    } else if ([teleArray[0] hasSuffix:@"GSA"]) {
        // [1] Autoselection of 2D or 3D fix (M=manual)
        // [2] 3D fix (1 = no fix, 2 = 2D fix, 3 = 3D fix)
        // [3...14] PRNS of satellites used for fix, space for 12
        // [15] PDOP
        // [16] HDOP
        // [17] VDOP
        // [18] checksum
    } else if ([teleArray[0] hasSuffix:@"GSV"]) {
        // [1] Number of sentences for full data
        // [2] Sentence number
        // [3] Number of satellites in view
        //
        // [4][8][12][16] Satellite PRN number
        // [5][9][13][17] Elevation, degrees
        // [6][10][14][18] Azimuth, degrees
        // [7][11][15][19] SNR - higher is better
        // [20] checksum
    } else if ([teleArray[0] hasSuffix:@"RMC"]) {
        // [1] Fix taken at UTC
        // [2] Status A=active or V=void
        // [3][4] Lat
        // [5][6] Long
        // [7] Speed over ground in knotw
        // [8] Track angle in degrees true
        // [9] date ddmmyy
        // [10][11] Magnetic variation
        // [12] checksum
    } else if ([teleArray[0] hasSuffix:@"GLL"]) {
        // [1][2] Lat
        // [3][4] Long
        // [5] UTC
        // [6] Data a=active, v=void
        // [7] checksum
    } else if ([teleArray[0] hasSuffix:@"VTG"]) {
        // [1][2] track made good (degrees) [2]=T=True
        // [3][4] track made true [4]=M=magnetic
        // [5][6] Ground speed [6]=N=Knots
        // [7][8] Ground speed [8]=K=KM/h
        // [9] checksum
    } else if ([teleArray[0] hasSuffix:@"WPL"]) {
        // [1][2] Lat
        // [3][4] Long
        // [5] WP Name
        // [6] checksum
    } else if ([teleArray[0] hasSuffix:@"AAM"]) {
        // [1] Arrival circle entered
        // [2] Perpendicular passed
        // [3] Curcle radius
        // [4] Units (N for Nautical Miles)
        // [5] Waypoint name
        // [6] checksum
    } else if ([teleArray[0] hasSuffix:@"APB"]) {
        // [1] Loran-C blink SNR warning, general warning
        // [2] Loran-C cycle warning
        // [3] cross-track error distance
        // [4] steer to correct (R=right/L=left)
        // [5] cross-track error units N=Nautical miles, K=KM
        // [6] arrival alarm circle
        // [7] arrival alarm perpendicular
        // [8][9] bearing, origin->destination
        // [10] destination waypoint ID
        // [11][12] bearing, present position to destination
        // [13][14] heading to stear
    } else if ([teleArray[0] hasSuffix:@"BOD"]) {
        // [1][2] bearing from [6] to [5] - T for True
        // [3][4] bearing from [6] to [5] - M for Magnetic
        // [5] DEST destination waypoint ID
        // [6] START origin waypoint ID
        // [7] checksum
    } else if ([teleArray[0] hasSuffix:@"BWC"]) {
        // [1] UTC time of fix
        // [2][3] Lat of waypoint
        // [4][5] Long of waypoint
        // [6][7] Bearing to waypoint, degrees T=True
        // [8][9] Bearing to waypoint, degrees M=Magnetic
        // [10][11] Distance to waypoint, N=Nautical Miles
        // [12] Waypoint ID
        // [13] checksum
    } else if ([teleArray[0] hasSuffix:@"RMB"]) {
        // [1] Data status A=OK, V=Void(Warning)
        // [2][3] Cross-track error (nautical miles), steer to correct [3] L=Left, R=Right
        // [4] Origin waypoint ID
        // [5] Destination waypoint ID
        // [6][7] Lat of destination waypoint
        // [8][9] Long of destination waypoint
        // [10] Range to destination, nautical miles
        // [11] True bearing to destination
        // [12] Velocity towards destination, knots
        // [13] Arrival alarm A=arrived, V=not arrived
        // [14] checksum
    } else if ([teleArray[0] hasSuffix:@"RTE"]) {
        // [1] Total number of sentences needed for full data
        // [2] this is sentence number
        // [3] Type c = complete list of waypoints in this route, w = first listed waypoint is start of current leg
        // [4] Route identifier
        // [5..n-1] Waypoint identifiers (names)
        // [n] checksum
    } else if ([teleArray[0] hasSuffix:@"XTE"]) {
        // [1] General warning flag V= warning
        // [2] Not used for GPS (Loran-C cycle lock flag)
        // [3] Cross track error distance
        // [4] Steer to correct L=left, R=right
        // [5] Distance units - N=Nautical miles
        // [6] checksum
    } else if ([teleArray[0] hasSuffix:@"ALM"]) {
        // [1] A.B
        // A = Total number of messages
        // B = Message number
        // [2] C.D
        // C = Satellite PRN number
        // D = GPS week number (0-1023)
        // [3] E=Satellite health (bits 17-24 of message)
        // [4] F=eccentricity
        // [5] hh=t index OA, almanac reference time
        // [6] hhhh=sigma index 1, inclination angle
        // [7] ... IMEGADOT rate of right ascension, SQRA(A) root of semi-major axis, Omega argument of perigeee, Omega index 0 longitude of ascencion node, M index 0 mean anomaly, a index f0 clock parameter, a index f1 clock parameter
    } else if ([teleArray[0] hasSuffix:@"HCHDG"]) {
        // [1] heading
        // [2][3] deviation
        // [4][5] variation
        // [6] checksum
    } else if ([teleArray[0] hasSuffix:@"ZDA"]) {
        // $GPZDA,hhmmss.ss,dd,mm,yyyy,xx,yy*CC
        // $GPZDA,201530.00,04,07,2002,00,00*60
        // [1] hhmmss.ss UTC
        // [2] dd
        // [3] mm
        // [4] yyyy
        // [5] local zone hours -13..13
        // [6] local zone minutes 0..59
        // [7] checksum
    } else if ([teleArray[0] hasSuffix:@"MSK"]) {
        // Control for a Beacon Receiver
        // [1] Frequency to use
        // [2] Frequency mode, A=auto, M=manual
        // [3] Beacon bit rate
        // [4] Bitrate, A=auto, M=manual
        // [5] frequency for MSS message status (null for no status)
        // [6] checksum
    } else if ([teleArray[0] hasSuffix:@"MSS"]) {
        // [1] signal strength in dB
        // [2] signal to noise ratio in dB
        // [3] Beacon Frequency in KJz
        // [4] Beacon bitrate in bps
        // [5] checksum
    } else if ([teleArray[0] hasSuffix:@"PGRME"]) {
        // [1][2] Estimated horizontal position error (M=meters)
        // [3][4] Estimated vertical error (VPE) (M=meters)
        // [5][6] Overall spherical equivalent position error (M=meters)
    } else if ([teleArray[0] hasSuffix:@"PGRMZ"]) {
        // [1][2] Altitude (f=feet)
        // [3] Position fix dimensions, 2=user altitude, 3=GPS altitude
    } else if ([teleArray[0] hasSuffix:@"PGRMM"]) {
        // [1] Currently active horizontal datum
    } else if ([teleArray[0] hasSuffix:@"PSLIB"]) {
        // Propertary sentences are used to control a Starlink differential beacon receiver. (Garmin's DBR is Starlink compatible as are many others.)
        // When the GPS receiver is set to change the DBR frequency or b/s rate, the "J" sentence is replaced (just once) by (for example):
        // $PSLIB,320.0,200*59
        // to set the DBR to 320kHz, 200b/s
        // $PSLIB,,,J*22 Status request
        // $PSLIB,,,K*23 Configuration request
    }
    else {
        NSLog(@"NMEA Telegram %@ not recognized", teleArray[0]);
    }
}

@end
