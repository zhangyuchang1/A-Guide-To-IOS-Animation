//
//  NextViewController.m
//  Waver
//
//  Created by zyc on 2017/10/23.
//  Copyright © 2017年 Catch Inc. All rights reserved.
//

#import "NextViewController.h"
#import "YDWaveLoadingView.h"


@interface NextViewController ()
@property (nonatomic, strong) UIImageView *backImageView;
@property (nonatomic, strong) YDWaveLoadingView *loadingView;

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Do any additional setup after loading the view.
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, 60, 100, 50)];
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"BACK" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _loadingView = [YDWaveLoadingView loadingView];
    [self.view addSubview:_loadingView];
    _loadingView.center = self.view.center;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_loadingView startLoading];
    });
    
}
-(void)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)beginLoading:(id)sender
{
    [_loadingView startLoading];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
