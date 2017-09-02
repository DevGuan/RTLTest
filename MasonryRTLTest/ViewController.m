//
//  ViewController.m
//  MasonryRTLTest
//
//  Created by 管复生 on 2017/8/18.
//  Copyright © 2017年 DevGuan. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
#import "GFSRTL.h"

@interface ViewController ()<UINavigationControllerDelegate>
@property (weak ,nonatomic)UILabel *leftLabel;
@property (weak ,nonatomic)UILabel *rightLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    UILabel *label = [[UILabel alloc]init];
    label.text = @"我是左边的";
    label.backgroundColor = [UIColor greenColor];
    [self.view addSubview:label];
    _leftLabel = label;
    label.textAlignment = NSTextAlignmentLeft;
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left_RTL.equalTo(self.view.mas_leftRTL).offset_RTL(10);
        make.top.equalTo(self.view).offset(50);
        make.height.equalTo(@30);
        make.width.equalTo(@120);
    }];
    
    UILabel *label2 = [[UILabel alloc]init];
    label2.text = @"我是右边的";
    label2.backgroundColor = [UIColor greenColor];
    [self.view addSubview:label2];
    _rightLabel = label2;
    label2.textAlignment = NSTextAlignmentLeft;
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left_RTL.equalTo(label.mas_rightRTL).offset_RTL(10);
        make.top.equalTo(self.view).offset(50);
        make.height.equalTo(@30);
        make.width.equalTo(@120);
    }];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"RTL" forState:UIControlStateNormal];
    [btn setTitle:@"LTR" forState:UIControlStateSelected];
    [btn addTarget:self action:@selector(RTLChanged:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    btn.selected = [[RTLManager appearance]RTL];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.height.width.equalTo(@80);
    }];
    
    self.title = btn.currentTitle;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    self.navigationController.delegate = self;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)RTLChanged:(UIButton *)sender
{
    [[RTLManager appearance]setRTL:!sender.selected];
    sender.selected = !sender.selected;
    
    
    [self.navigationController pushViewController:[ViewController new] animated:YES];
}


@end
