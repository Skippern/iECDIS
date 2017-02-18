//
//  DisplayOnlineMap.m
//  iECDIS
//
//  Created by Aun Johnsen on 2/10/16.
//  Copyright © 2016 Aun Johnsen. All rights reserved.
//
// This file contains information on sources for raster and vector tiles with nautical map data for background layers and overlays
//

#import "DisplayOnlineMap.h"

@implementation DisplayOnlineMap

- (id) init
{
    self = [super init];
    if (self) {
        _defaultOnlineMap = [[MKTileOverlay alloc] initWithURLTemplate:@"https://tiles.opennauticalchart.org/{z}/{x}/{y}.png"];
        // minimumZ, maximumZ
    }
    return self;
}

@end
