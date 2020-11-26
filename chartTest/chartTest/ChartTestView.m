//
//  ChartTestView.m
//  chartTest
//
//  Created by 一路惠 on 2019/12/25.
//  Copyright © 2019 惠一路. All rights reserved.
//

#import "ChartTestView.h"
#define KCircleRadius1 5 //线条上圆圈半径

@interface ChartTestView ()<CAAnimationDelegate>
@property (nonatomic,assign)CGPoint prePoint;
@property (nonatomic,strong)UIScrollView *chartScrollView;

@end
@implementation ChartTestView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _prePoint = CGPointMake(0,0);
        
        _chartScrollView = [[UIScrollView alloc] initWithFrame:frame];
        [self addSubview:_chartScrollView];
    }
    return self;
}

- (void)addBezierPoint:(CGPoint)point andColor:(UIColor *)color
{
    
    UIBezierPath *lineBeizer = [UIBezierPath bezierPath];
    lineBeizer.lineCapStyle = kCGLineCapRound;
    [lineBeizer moveToPoint:_prePoint];
    [lineBeizer addCurveToPoint:point controlPoint1:CGPointMake((point.x+_prePoint.x)/2, _prePoint.y) controlPoint2:CGPointMake((point.x+_prePoint.x)/2, point.y)];
    
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = lineBeizer.CGPath;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.strokeColor = color.CGColor;
    shapeLayer.lineWidth = 3;
    [self.chartScrollView.layer addSublayer:shapeLayer];

    
    CABasicAnimation *strokeAnmi = [CABasicAnimation animation];
    strokeAnmi.keyPath = @"strokeEnd";
    strokeAnmi.fromValue = [NSNumber numberWithFloat:0];
    strokeAnmi.toValue = [NSNumber numberWithFloat:1.0f];
    strokeAnmi.duration =0.5f;
    strokeAnmi.delegate = self;
    strokeAnmi.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    strokeAnmi.autoreverses = NO;
    [shapeLayer addAnimation:strokeAnmi forKey:@"stroke"];
    
    if (point.x > _chartScrollView.frame.size.width)
    {
        [_chartScrollView setContentSize:CGSizeMake(point.x + 20, _chartScrollView.contentSize.height)];
        [_chartScrollView setContentOffset:CGPointMake(_chartScrollView.contentOffset.x + point.x - _prePoint.x, _chartScrollView.contentOffset.y) animated:YES];
    }
    _prePoint = point;

}
//-(NSMutableArray *)addDataPointWith:(UIView *)view andArr:(NSArray *)DataArr andInterval:(CGFloat)interval{
//    CGFloat height = self.chartScrollView.bounds.size.height - 13 - KCircleRadius1 / 2 - 4;
//    //初始点
//    NSMutableArray *arr = [NSMutableArray arrayWithArray:DataArr];
//    NSMutableArray * marr = [NSMutableArray array];
//    CGFloat xMargin = CGRectGetWidth(self.chartScrollView.frame) / (_xRow - 1);
//    for (int i = 0; i<arr.count; i++) {
//        float tempHeight = [arr[i] floatValue] / (interval * (_row - 1)) ;
//        NSValue *point = [NSValue valueWithCGPoint:CGPointMake(xMargin * i + xMargin, (height *(1 - tempHeight) + 13))];
//        if (i == 0) {
//            //            NSValue *point1 = [NSValue valueWithCGPoint:CGPointMake(0 , (height + 13))];
//            NSValue *point1 = [NSValue valueWithCGPoint:CGPointMake(0 , (height *(1 - tempHeight) + 13))];
//            [marr addObject:point1];
//        }
//        [marr addObject:point];
//    }
//    return marr;
//}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
