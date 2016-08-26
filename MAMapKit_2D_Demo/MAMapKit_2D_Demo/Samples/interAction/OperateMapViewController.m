//
//  OperateMapViewController.m
//  MAMapKit_2D_Demo
//
//  Created by shaobin on 16/8/16.
//  Copyright © 2016年 Autonavi. All rights reserved.
//

#import "OperateMapViewController.h"

@interface OperateMapViewController ()<MAMapViewDelegate>

@property (nonatomic, strong) MAMapView *mapView;

@end

@implementation OperateMapViewController

#pragma mark - Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                                                             style:UIBarButtonItemStyleBordered
                                                                            target:self
                                                                            action:@selector(returnAction)];
    
    self.mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
    self.mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.mapView.delegate = self;
    self.mapView.centerCoordinate = CLLocationCoordinate2DMake(39.907728, 116.397968);
    [self.view addSubview:self.mapView];
    
    UIView *switchsPannelView = [self makeSwitchsPannelView];
    switchsPannelView.center = CGPointMake(self.view.bounds.size.width - CGRectGetMidX(switchsPannelView.bounds) - 10,
                                        self.view.bounds.size.height -  CGRectGetMidY(switchsPannelView.bounds) - 10);
    
    switchsPannelView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin;
    [self.view addSubview:switchsPannelView];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (UIView *)makeSwitchsPannelView
{
    UIView *ret = [[UIView alloc] initWithFrame:CGRectZero];
    ret.backgroundColor = [UIColor whiteColor];
    
    
    UISwitch *swt1 = [[UISwitch alloc] init];
    UISwitch *swt2 = [[UISwitch alloc] init];
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, CGRectGetHeight(swt1.bounds))];
    label1.text = @"drag:";
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(label1.frame) + 5, 50, CGRectGetHeight(swt1.bounds))];
    label2.text = @"zoom:";
   
    [ret addSubview:label1];
    [ret addSubview:swt1];
    [ret addSubview:label2];
    [ret addSubview:swt2];
    
    CGRect tempFrame = swt1.frame;
    tempFrame.origin.x = CGRectGetMaxX(label1.frame) + 5;
    swt1.frame = tempFrame;
    
    tempFrame = swt2.frame;
    tempFrame.origin.x = CGRectGetMaxX(label2.frame) + 5;
    tempFrame.origin.y = CGRectGetMinY(label2.frame);
    swt2.frame = tempFrame;
    
    [swt1 addTarget:self action:@selector(enableDrag:) forControlEvents:UIControlEventValueChanged];
    [swt2 addTarget:self action:@selector(enableZoom:) forControlEvents:UIControlEventValueChanged];
    
    [swt1 setOn:self.mapView.isScrollEnabled];
    [swt2 setOn:self.mapView.isZoomEnabled];
    
    ret.bounds = CGRectMake(0, 0, CGRectGetMaxX(swt1.frame), CGRectGetMaxY(label2.frame));
    
    return ret;
}

#pragma mark - Action Handlers
- (void)returnAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)enableDrag:(UISwitch *)sender
{
    self.mapView.scrollEnabled = sender.isOn;
}

- (void)enableZoom:(UISwitch *)sender
{
    self.mapView.zoomEnabled = sender.isOn;
}

@end
