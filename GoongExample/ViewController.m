//
//  ViewController.m
//  GoongExample
//
//  Created by iBinh on 1/7/20.
//  Copyright © 2020 Goong. All rights reserved.
//

#import "ViewController.h"
@import GoongSDK;
@import GoongGeocoder;
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[GoongAutocompleteViewController alloc] initWithAccessToken:@""];
    // Do any additional setup after loading the view.
}



@end
