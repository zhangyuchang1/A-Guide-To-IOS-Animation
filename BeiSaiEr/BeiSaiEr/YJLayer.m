//
//  YJLayer.m
//  BeiSaiEr
//
//  Created by zyc on 2017/10/21.
//  Copyright © 2017年 zyc. All rights reserved.
//

#import "YJLayer.h"
#import <CoreGraphics/CoreGraphics.h>

// 外接矩形边长
#define outsideRectSize 20
@interface YJLayer()
{
    // 进度 0.5-圆  0-<矩形在右侧 1->矩形在左侧
    CGFloat progress;
    // 右侧点
    CGPoint POINT_B;
    // 左侧点
    CGPoint POINT_D;
}
// 位置
@property(nonatomic,assign)CGPoint position;
// 外接矩形
@property(nonatomic,assign)CGRect outsideRect;
// 跟随拖动移动的点
@property(nonatomic,assign)CGPoint movePoint;
@end
@implementation YJLayer
-(void)config
{
   
    CGFloat orign_x = self.position.x - outsideRectSize/2 + (progress - 0.5)*(self.frame.size.width - outsideRectSize);
    CGFloat origin_y = self.position.y - outsideRectSize/2;
    self.outsideRect = CGRectMake(orign_x, origin_y, outsideRectSize, outsideRectSize);
}

-(void)move
{
    //只要外接矩形在左侧，则改变B点；在右侧，改变D点
    if(progress <= 0.5){
        self.movePoint = POINT_D;
        NSLog(@"B点动");
    }else{
        self.movePoint = POINT_B;
        NSLog(@"D点动");
    }
    
    
}

-(void)drawInContext:(CGContextRef)ctx
{
    //“offset 指的是 A-C1,B-C2... 的距离，当设置为正方形边长的 1/3.6 倍时，画出来的圆弧完美贴合圆形。为什么是 3.6 ？这里有一篇文章。文章里三阶贝塞尔曲线拟合圆的时候最佳参数 h=0.552, 转换到我的的代码中就是 2/0.552 = 3.623。近似于 3.6。其实从直观的角度来看 , 如果圆心为 O，OC1, OC2 就一定是三等分点，也就是夹角为 20°。
    CGFloat offset = self.outsideRect.size.width / 3.6;
    
    
    CGFloat movedDistance = (self.outsideRect.size.width * 1 / 6) * fabs(progress-0.5)*2;
    
    
    CGPoint rectCenter = CGPointMake(self.outsideRect.origin.x + self.outsideRect.size.width/2 , self.outsideRect.origin.y + self.outsideRect.size.height/2);
    
    
    CGPoint pointA = CGPointMake(rectCenter.x ,self.outsideRect.origin.y + movedDistance);
    CGPoint pointB = CGPointMake(CGPointEqualToPoint(self.movePoint, POINT_D)? rectCenter.x + self.outsideRect.size.width/2 : rectCenter.x + self.outsideRect.size.width/2 + movedDistance*2 ,rectCenter.y);
    CGPoint pointC = CGPointMake(rectCenter.x ,rectCenter.y + self.outsideRect.size.height/2 - movedDistance);
    CGPoint pointD = CGPointMake(CGPointEqualToPoint(self.movePoint, POINT_D) ? self.outsideRect.origin.x - movedDistance*2 : self.outsideRect.origin.x, rectCenter.y);
    
    
    CGPoint c1 = CGPointMake(pointA.x + offset, pointA.y);
    CGPoint c2 = CGPointMake(pointB.x, CGPointEqualToPoint(self.movePoint, POINT_D) ? pointB.y - offset : pointB.y - offset + movedDistance);
    
    CGPoint c3 = CGPointMake(pointB.x, CGPointEqualToPoint(self.movePoint, POINT_D) ? pointB.y + offset : pointB.y + offset - movedDistance);
    CGPoint c4 = CGPointMake(pointC.x + offset, pointC.y);
    
    CGPoint c5 = CGPointMake(pointC.x - offset, pointC.y);
    CGPoint c6 = CGPointMake(pointD.x, CGPointEqualToPoint(self.movePoint, POINT_D) ? pointD.y + offset - movedDistance : pointD.y + offset);
    
    CGPoint c7 = CGPointMake(pointD.x, CGPointEqualToPoint(self.movePoint, POINT_D) ? pointD.y - offset + movedDistance : pointD.y - offset);
    CGPoint c8 = CGPointMake(pointA.x - offset, pointA.y);
    
    
    //圆的边界
    
//    UIBezierPath *ovalPath = [UIBezierPath bezierPath];
    
    
}
@end
