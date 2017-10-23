//
//  Waver.h
//  Waver
//
//  Created by kevinzhow on 14/12/14.
//  Copyright (c) 2014年 Catch Inc. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Waver : UIView

@property (nonatomic, copy) void (^waverLevelCallback)(Waver * waver);

//显示的 波的条数
@property (nonatomic) NSUInteger numberOfWaves;

@property (nonatomic) UIColor * waveColor;

@property (nonatomic) CGFloat level;

@property (nonatomic) CGFloat mainWaveWidth;

@property (nonatomic) CGFloat decorativeWavesWidth;

@property (nonatomic) CGFloat idleAmplitude;

@property (nonatomic) CGFloat frequency;

@property (nonatomic, readonly) CGFloat amplitude;

@property (nonatomic) CGFloat density;

@property (nonatomic) CGFloat phaseShift;

//

@property (nonatomic, readonly) NSMutableArray * waves;

@end
