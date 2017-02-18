//
//  DisplayBSB.h
//  iECDIS
//
//  Created by Aun Johnsen on 2/10/16.
//  Copyright © 2016 Aun Johnsen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DisplayBSB : NSObject

//@property NSString *BSBCopyright; // CRR/*
//@property NSString *BSBName; // CHT/NA=*
//@property NSString *BSBNumber; // CHT/NU=*
//@property NSString *BSBChartType; // CHF/*
//@property NSDate *BSBChartED; // CED/ED=*
//@property NSString *BSBNMT; // NMT/NE=*
//@property NSDate *BSBNMTDate; // NMT/ND=*
//@property NSString *BSBOrganization; //ORG/*
//@property

@property NSString *KAPCopyright; // CRR/*
@property NSString *KAPName; // BSB/NA=*
@property NSString *KAPNMT; // NMT/NE=*
@property NSDate *KAPNMTDate; // NMT/ND=*
@property NSDate *KAPChartDate; // CED/ED=*
@property NSString *KAPDatum; // KNP/GD=*
@property NSString *KAPProjection; // KNP/PR=*
@property NSString *KAPUnits; // KNP/UN=*
@property NSNumber *KAPScale; // KNP/SC=*

- (NSString *)getScale;

@end
