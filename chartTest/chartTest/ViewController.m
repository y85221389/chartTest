//
//  ViewController.m
//  chartTest
//
//  Created by 一路惠 on 2019/12/25.
//  Copyright © 2019 惠一路. All rights reserved.
//

#import "ViewController.h"
#import "HYLChartView.h"
#import "ChartTestView.h"
@interface ViewController ()
{
    HYLChartView *chartView;
    ChartTestView *hylView;
    
    int chartX;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//     chartView = [HYLChartView lineChartViewWithFrame:CGRectMake(0, 0, 300, 400)];
//    chartView.xValues = @[@1, @2, @3, @4, @5, @6, @7,@8, @9, @10];
//       chartView.yValues = @[@10, @20, @30, @40, @50,@60, @70, @80,@90, @100];
//       // 设置封闭图形的样式
//       chartView.type = QuadrilateralType;
////       self.LCView = chartView;
//       chartView.isShowLine = YES;
//       [chartView drawChartWithLineChart];
//       [self.view addSubview:chartView];
//
//    NSTimer *time = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(updatas) userInfo:nil repeats:YES];

    hylView = [[ChartTestView alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 400)];
    [self.view addSubview:hylView];
    
    
    NSTimer *time = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updatas) userInfo:nil repeats:YES];
}
- (void)updatas
{
    chartX += 40;
    int y = arc4random() %200;
    CGPoint point = CGPointMake(chartX, y);
    [hylView addBezierPoint:point andColor:[UIColor blackColor]];
//    chartX++;
//    int y = arc4random() %100;
//    CGPoint point = CGPointMake(chartX, y);
//    NSValue *pointobj = [NSValue valueWithCGPoint:point];
//
//    [chartView.pointArray addObject:pointobj];
//
//    for (int i = 0; i < chartView.pointArray.count; i ++) {
//        NSValue *pointObj = chartView.pointArray[i];
//        CGPoint pointRestored = [pointObj CGPointValue];
//
//        // 如果 X 轴数值大于,X 轴会自动往后移动
//        if (chartX > chartView.xValues.count) {
//            // 移除没有展示出来的点,不然数组里存放的太多了,内容会爆棚
//            if (pointRestored.x < (chartX - chartView.xValues.count) ) {
//                [chartView.pointArray removeObject:pointObj];
//            }
//        }
//    }
//    // 调用实时更新折线图的方法
//    [chartView exchangeLineAnyTime];
}

@end
