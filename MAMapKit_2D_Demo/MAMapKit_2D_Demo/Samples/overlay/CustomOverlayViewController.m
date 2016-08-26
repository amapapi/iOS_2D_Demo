//
//  CustomOverlayViewController.m
//  Category_demo
//
//  Created by songjian on 13-3-21.
//  Copyright (c) 2013年 songjian. All rights reserved.
//

#import "CustomOverlayViewController.h"
#import "CustomOverlay.h"
#import "CustomOverlayRenderer.h"

@interface CustomOverlayViewController ()<MAMapViewDelegate>

@property (nonatomic, strong) MAMapView *mapView;
@property (nonatomic, strong) CustomOverlay *customOverlay;

@end

@implementation CustomOverlayViewController

#pragma mark - MAMapViewDelegate

- (MAOverlayRenderer *)mapView:(MAMapView *)mapView rendererForOverlay:(id <MAOverlay>)overlay
{
    if ([overlay isKindOfClass:[CustomOverlay class]])
    {
        CustomOverlayRenderer *renderer = [[CustomOverlayRenderer alloc] initWithOverlay:overlay];
        
        return renderer;
    }
    
    return nil;
}

#pragma mark - Initialization

- (void)initOverlay
{
    self.customOverlay = [[CustomOverlay alloc] initWithCenter:CLLocationCoordinate2DMake(39.929641, 116.431025) radius:10000];
}

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initOverlay];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                                                             style:UIBarButtonItemStyleBordered
                                                                            target:self
                                                                            action:@selector(returnAction)];
    
    self.mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
    self.mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.mapView.delegate = self;
    [self.view addSubview:self.mapView];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.mapView addOverlay:self.customOverlay];
}

#pragma mark - action handling
- (void)returnAction {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
