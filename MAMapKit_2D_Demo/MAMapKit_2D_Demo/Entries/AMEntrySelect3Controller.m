//
//  AMEntrySelect3Controller.m
//  MAMapKit_2D_Demo
//
//  Created by shaobin on 16/8/10.
//  Copyright © 2016年 Autonavi. All rights reserved.
//

#import "AMEntrySelect3Controller.h"

@interface AMEntrySelect3Controller ()

@end

@implementation AMEntrySelect3Controller

- (void)initEntries {
    self.entryTitles = @[@"地图自带大头针样式的点标注",
                         @"自定义样式的点标注",
                         @"动画效果的点标注",
                         @"默认样式的定位蓝点(定位、跟随、旋转效果)",
                         @"自定义样式的定位点, 地图转",
                         @"定位箭头旋转效果，地图不转",
                         @"地图上的信息窗口",
                         @"用实线(虚线)画直线、折线",
                         @"绘制多彩线",
                         @"大地曲线",
                         @"圆形",
                         @"矩形、多边形",
                         @"模拟跑步轨迹",
                         @"热力图",
                         @"实现自定义的overlay",
                         @"Tile Overlay",];
    
    self.entryClasses = @[@"AnnotationViewController",
                          @"CustomAnnotationViewController",
                          @"AnimatedAnnotationViewController",
                          @"UserLocationViewController",
                          @"CustomUserLocationViewController",
                          @"CustomUserLoactionViewController2",
                          @"CustomAnnotationViewController2",
                          @"LinesOverlayViewController",
                          @"ColoredLinesOverlayViewController",
                          @"GeodesicViewController",
                          @"CircleOverlayViewController",
                          @"PolygonOverlayViewController",
                          @"RunningLineViewController",
                          @"HeatMapTileOverlayViewController",
                          @"CustomOverlayViewController",
                          @"TileOverlayViewController",];
    
    self.entryDetails = self.entryClasses;
}


@end
