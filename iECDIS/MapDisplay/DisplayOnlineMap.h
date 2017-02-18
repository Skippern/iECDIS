//
//  DisplayOnlineMap.h
//  iECDIS
//
//  Created by Aun Johnsen on 2/10/16.
//  Copyright © 2016 Aun Johnsen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <MapKit/MKTileOverlay.h>

@interface DisplayOnlineMap : NSObject

@property MKTileOverlay *defaultOnlineMap; // The default online map

@end
