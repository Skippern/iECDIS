//
//  AIS.m
//  iECDIS
//
//  Created by Aun Johnsen on 1/12/17.
//  Copyright © 2017 Aun Johnsen. All rights reserved.
//
// Overlay to display other vessels via AIS protocol data, and interact with an external AIS unit. Allow for receiving AIS data from third party services such as MarineTraffic, if real time sharing is active.

#import "AIS.h"

@implementation AIS

- (id) init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
- (id) initWithGeo:(NSNumber *)MMSI :(NSNumber *)Lat :(NSNumber *)Long :(NSNumber *)Type
{
    self = [super init];
    if (self) {
        _AISTargetMMSI = MMSI;
        _AISTargetLat = Lat;
        _AISTargetLong = Long;
        _AISTargetVesselType = Type;
    }
    return self;
}
- (NSString *)getAISVesselType:(NSNumber *)vesselType
{
    switch ([vesselType integerValue]) {
        case 10:
        case 11:
        case 12:
        case 13:
        case 14:
        case 15:
        case 16:
        case 17:
        case 18:
        case 19:
        case 38:
        case 39:
            return NSLocalizedString(@"Reserved", @"Reserved AIS Vessel Type");
            break;
        case 20:
        case 21:
        case 22:
        case 23:
        case 24:
        case 25:
        case 26:
        case 27:
        case 28:
            return NSLocalizedString(@"Wing in Ground", @"Wing in Ground AIS Vessel Type");
            break;
        case 29:
            return NSLocalizedString(@"SAR Aircraft", @"SAR Aircraft AIS Vessel Type");
        case 30:
            return NSLocalizedString(@"Fishing", @"Fishing AIS Vessel Type");
            break;
        case 31:
        case 32:
        case 52:
            return NSLocalizedString(@"Tug", @"Tug AIS Vessel Type");
            break;
        case 33:
            return NSLocalizedString(@"Dredger", @"Dredger AIS Vessel Type");
            break;
        case 34:
            return NSLocalizedString(@"Dive Vessel", @"Dive Vessel AIS Vessel Type");
            break;
        case 35:
            return NSLocalizedString(@"Military Ops", @"Military Ops AIS Vessel Type");
            break;
        case 36:
            return NSLocalizedString(@"Sailing Vessel", @"Sailing AIS Vessel Type");
            break;
        case 37:
            return NSLocalizedString(@"Pleasure Craft", @"Pleasure Craft AIS Vessel Type");
            break;
        case 40:
        case 41:
        case 42:
        case 43:
        case 44:
        case 45:
        case 46:
        case 47:
        case 48:
        case 49:
            return NSLocalizedString(@"High-Speed Craft", @"High-Speed Craft AIS Vessel Type");
            break;
        case 50:
            return NSLocalizedString(@"Pilot Vessel", @"Pilot Vessel AIS Vessel Type");
            break;
        case 51:
            return NSLocalizedString(@"SAR", @"Search and Rescue AIS Vessel Type");
            break;
        case 53:
            return NSLocalizedString(@"Port Tender", @"Port Tender AIS Vessel Type");
            break;
        case 54:
            return NSLocalizedString(@"Anti-Pollution", @"Anti-Pollution AIS Vessel Type");
            break;
        case 55:
            return NSLocalizedString(@"Law Enforce", @"Law Enforcement AIS Vessel Type");
            break;
        case 56:
        case 57:
            return NSLocalizedString(@"Local Vessel", @"Local Vessel AIS Vessel Type");
            break;
        case 58:
            return NSLocalizedString(@"Medical Trans", @"Medical/Hospital AIS Vessel Type");
            break;
        case 59:
            return NSLocalizedString(@"Special Craft", @"Special Craft AIS Vessel Type");
            break;
        case 60:
        case 61:
        case 62:
        case 63:
        case 64:
        case 65:
        case 66:
        case 67:
        case 68:
        case 69:
            return NSLocalizedString(@"Passenger", @"Passenger AIS Vessel Type");
            break;
        case 70:
        case 75:
        case 76:
        case 77:
        case 78:
        case 79:
            return NSLocalizedString(@"Cargo", @"Cargo AIS Vessel Type");
            break;
        case 71:
            return NSLocalizedString(@"Cargo - Hazard A (Major)", @"Cargo Hazard A AIS Vessel Type");
            break;
        case 72:
            return NSLocalizedString(@"Cargo - Hazard B", @"Cargo Hazard B AIS Vessel Type");
            break;
        case 73:
            return NSLocalizedString(@"Cargo - Hazard C (Minor)", @"Cargo Hazard C AIS Vessel Type");
            break;
        case 74:
            return NSLocalizedString(@"Cargo - Hazard D (Recognizable)", @"Cargo Hazard D AIS Vessel Type");
            break;
        case 80:
        case 85:
        case 86:
        case 87:
        case 88:
        case 89:
            return NSLocalizedString(@"Tanker", @"Tanker AIS Vessel Type");
            break;
        case 81:
            return NSLocalizedString(@"Tanker - Hazard A (Major)", @"Tanker Hazard A AIS Vessel Type");
            break;
        case 82:
            return NSLocalizedString(@"Tanker - Hazard B", @"Tanker Hazard B AIS Vessel Type");
            break;
        case 83:
            return NSLocalizedString(@"Tanker - Hazard C (Minor)", @"Tanker Hazard C AIS Vessel Type");
            break;
        case 84:
            return NSLocalizedString(@"Tanker - Hazard D (Recognizable)", @"Tanker Hazard C AIS Vessel Type");
        case 90:
        case 91:
        case 92:
        case 93:
        case 94:
        case 95:
        case 96:
        case 97:
        case 98:
        case 99:
            return NSLocalizedString(@"Other", @"Other AIS Vessel Type");
            break;
        case 100:
            return NSLocalizedString(@"Default Navaid", @"Default AIS Navaid");
            break;
        case 101:
            return NSLocalizedString(@"Reference point", @"Reference Point AIS Navaid");
            break;
        case 102:
            return NSLocalizedString(@"RACON", @"RACON AIS Navaid");
            break;
        case 103:
            return NSLocalizedString(@"Offshore Structure", @"Offshore Structure AIS Navaid");
            break;
        case 104:
            return NSLocalizedString(@"Spare", @"Spare AIS Navaid");
            break;
        case 105:
            return NSLocalizedString(@"Light, without sectors", @"Lights without sectors AIS Navaid");
            break;
        case 106:
            return NSLocalizedString(@"Light, with sectors", @"Lights with sectors AIS Navaid");
            break;
        case 107:
            return NSLocalizedString(@"Leading Light Front", @"Front Leading Light AIS Navaid");
            break;
        case 108:
            return NSLocalizedString(@"Leading Light Rear", @"Rear Leading Light AIS Navaid");
            break;
        case 109:
            return NSLocalizedString(@"Beacon, Cardinal N", @"North Cardinal Beacon AIS Navaid");
            break;
        case 110:
            return NSLocalizedString(@"Beacon, Cardinal E", @"East Cardinal Beacon AIS Navaid");
            break;
        case 111:
            return NSLocalizedString(@"Beacon, Cardinal S", @"South Cardinal Beacon AIS Navaid");
            break;
        case 112:
            return NSLocalizedString(@"Beacon, Cardinal W", @"West Cardinal Beacon AIS Navaid");
            break;
        case 113:
            return NSLocalizedString(@"Beacon, Port hand", @"Port hand Beacon AIS Navaid");
            break;
        case 114:
            return NSLocalizedString(@"Beacon, Starboard hand", @"Starboard hand Beacon AIS Navaid");
            break;
        case 115:
            return NSLocalizedString(@"Beacon, Preferred Channel port hand", @"Port Preferred Channel Beacon AIS Navaid");
            break;
        case 116:
            return NSLocalizedString(@"Beacon, Preferred Channel starboard hand", @"Starboard Preferred Channel Beacon AIS Navaid");
            break;
        case 117:
            return NSLocalizedString(@"Beacon, Isolated danger", @"Isolated Danger Beacon AIS Navaid");
            break;
        case 118:
            return NSLocalizedString(@"Beacon, Safe water", @"Safe Water Beacon AIS Navaid");
            break;
        case 119:
            return NSLocalizedString(@"Beacon, Special mark", @"Special Mark Beacon AIS Navaid");
            break;
        case 120:
            return NSLocalizedString(@"Cardinal Mark N", @"North Cardinal AIS Navaid");
            break;
        case 121:
            return NSLocalizedString(@"Cardinal Mark E", @"East Cardinal AIS Navaid");
            break;
        case 122:
            return NSLocalizedString(@"Cardinal Mark S", @"South Cardinal AIS Navaid");
            break;
        case 123:
            return NSLocalizedString(@"Cardinal Mark W", @"West Cardinal AIS Navaid");
            break;
        case 124:
            return NSLocalizedString(@"Port hand Mark", @"Port hand AIS Navaid");
            break;
        case 125:
            return NSLocalizedString(@"Starboard hand Mark", @"Starboard hand AIS Navaid");
            break;
        case 126:
            return NSLocalizedString(@"Preferred Channel Port hand", @"Port Perferred Channel AIS Navaid");
            break;
        case 127:
            return NSLocalizedString(@"Preferred Channel Starboard hand", @"Starboard Preferred Channel AIS Navaid");
            break;
        case 128:
            return NSLocalizedString(@"Isolated danger", @"Isolated Danger AIS Navaid");
            break;
        case 129:
            return NSLocalizedString(@"Safe Water", @"Safe Water AIS Navaid");
            break;
        case 130:
            return NSLocalizedString(@"Manned VTS / Special Mark", @"Manned VTS/Special Mark AIS Navaid");
            break;
        case 131:
            return NSLocalizedString(@"Light Vessel / LANBY", @"Light Vessel/LANBY AIS Navaid");
            break;
            
        default:
            return NSLocalizedString(@"Unknown", @"Unknown AIS Vessel Type");
            break;
    }
}
- (void)requestUpdate:(NSNumber *)MMSI
{
    
}
- (void)updateAISTarget:(NSNumber *)MMSI :(NSString *)Telegram
{
    // Get the variables from teh Telegram, and set the new values in the object corresponding with MMSI
}

@end
