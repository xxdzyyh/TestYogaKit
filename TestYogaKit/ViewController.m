//
//  ViewController.m
//  TestYogaKit
//
//  Created by xiaoniu on 10/10/19.
//  Copyright © 2019 com.xffoundation. All rights reserved.
//

#import "ViewController.h"
#import <UIView+Yoga.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self tagLayout];
    [self inputLayout];
    [self mixAutoLayout];
}

- (void)tagLayout {
    NSArray *tags = @[@"投资理财",@"超高收益",@"七日年化收益",@"支付宝",@"微信",@"云闪付",@"花呗"];
    
    UIView *tagBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 414, 100)];
    
    tagBgView.backgroundColor = [UIColor lightGrayColor];
    [tagBgView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexDirection = YGFlexDirectionRow;
        layout.marginTop = YGPointValue(100);
        layout.paddingBottom = YGPointValue(10);
        layout.width = YGPointValue([UIScreen mainScreen].bounds.size.width); 
        layout.flexWrap = YGWrapWrap;
    }];
    
    [self.view addSubview:tagBgView];
    
    for (NSString *obj in tags) {
        UILabel *label = [[UILabel alloc] init];

        label.text = obj;
        label.backgroundColor = [UIColor orangeColor];
        [label configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
            layout.isEnabled =YES;
            layout.marginLeft = YGPointValue(10);
            layout.marginTop = YGPointValue(10);
        }];
        
        [tagBgView addSubview:label];
    }
        
    self.view.yoga.isEnabled = YES;
    [self.view.yoga applyLayoutPreservingOrigin:NO];
}

- (void)inputLayout {
    UIView *bgView = [[UIView alloc] init];
    
    bgView.backgroundColor = [UIColor lightGrayColor];
    [bgView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.height = YGPointValue(40);
        layout.width = YGPointValue([UIScreen mainScreen].bounds.size.width);
        layout.marginTop = YGPointValue(20);
        layout.flexDirection = YGFlexDirectionRow;
    }];
    
    [self.view addSubview:bgView];
    
    UIImageView *leftImageView = [[UIImageView alloc] init];
    
    leftImageView.backgroundColor = [UIColor greenColor];
    [leftImageView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(40);
        layout.height = YGPointValue(40);
    }];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(40, 0, 200, 40)];
    textField.placeholder = @"这就是占位符";
    [textField configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.marginLeft = YGPointValue(10);
        layout.flexGrow = 1;
    }];
    
    UIButton *codeButton = [[UIButton alloc] init];
    [codeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    [codeButton configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.marginRight = YGPointValue(10);
    }];
    
    [bgView addSubview:leftImageView];
    [bgView addSubview:textField];
    [bgView addSubview:codeButton];
    
    self.view.yoga.isEnabled = YES;
    [self.view.yoga applyLayoutPreservingOrigin:NO];
}

- (void)mixAutoLayout {
    UIView *redView = [[UIView alloc] init];
    
    redView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:redView];
    
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSArray *hLayout = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[redView]-20-|" options:NSLayoutFormatAlignAllTop metrics:nil views: NSDictionaryOfVariableBindings(redView)];
    NSArray *yLayout = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-200-[redView]-20-|" options:NSLayoutFormatAlignAllTop metrics:nil views: NSDictionaryOfVariableBindings(redView)];
    
    [self.view addConstraints:hLayout];
    [self.view addConstraints:yLayout];
}

@end
