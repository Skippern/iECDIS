//
//  ViewController.m
//  iECDIS
//
//  Created by Aun Johnsen on 3/11/2015.
//  Copyright (c) 2015 Aun Johnsen. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

//@synthesinonatomic, ze nonatomic contentViewController = _contentViewController;
@synthesize contentViewController;
- (NSViewController *)contentViewController {
    NSLog(@"contentViewController called in ViewController.m");
    if (contentViewController) {
        return contentViewController;
    }
    return contentViewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewDidLoad called");

    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    NSLog(@"setRepresentedObject called");

    // Update the view, if already loaded.
}

@end
