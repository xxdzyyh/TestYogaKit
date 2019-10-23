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
    [self mLayout];
    [self alignLayout];
    
    BOOL res1 = [[NSObject class] isKindOfClass:[NSObject class]];
    BOOL res2 = [[NSObject class] isMemberOfClass:[NSObject class]];
    BOOL res3 = [[ViewController class] isKindOfClass:[ViewController class]];
    BOOL res4 = [[ViewController class] isMemberOfClass:[ViewController class]];
    NSLog(@"%d-%d-%d-%d",res1, res2, res3, res4);
}

- (void)tagLayout {
    NSArray *tags = @[@"微信",@"投资理财",@"七日年化收益",@"支付宝",@"超高收益",@"云闪付",@"花呗"];
    
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
    
    NSNumber *h = @([UIScreen mainScreen].bounds.size.width);
    NSArray *yLayout = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-240-[redView(180)]|" options:NSLayoutFormatAlignAllTop metrics:@{@"h":h} views: NSDictionaryOfVariableBindings(redView)];
    
    [self.view addConstraints:hLayout];
    [self.view addConstraints:yLayout];
    
    
    NSArray *tags = @[@"投资理财",@"超高收益",@"七日年化收益",@"支付宝",@"微信",@"云闪付",@"花呗"];
       
       UIView *tagBgView = [[UIView alloc] initWithFrame:CGRectZero];

       [tagBgView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
           layout.isEnabled = YES;
           layout.flexDirection = YGFlexDirectionColumn;
           layout.marginTop = YGPointValue(10);
           layout.paddingBottom = YGPointValue(10);
           layout.height = YGPointValue(140); 
           layout.flexWrap = YGWrapWrap;
           layout.alignContent = YGAlignCenter;
           layout.justifyContent = YGAlignCenter;
       }];
       
       [redView addSubview:tagBgView];
       
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
    
    redView.yoga.isEnabled = YES;
    [redView.yoga applyLayoutPreservingOrigin:YES];
}


- (void)mLayout {
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor greenColor];    
    [self.view addSubview:redView];

    [redView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.height = YGPointValue(140);
        layout.width = YGPointValue([UIScreen mainScreen].bounds.size.width-40);
        layout.marginTop = YGPointValue(20);
        layout.marginLeft = YGPointValue(20);
        layout.flexDirection = YGFlexDirectionColumn;
        layout.justifyContent = YGJustifyFlexEnd;
        
    
    }];
    
    NSArray *tags = @[@"七日年化收益",@"支付宝",@"超高收益"];

    for (NSString *obj in tags) {
       UILabel *label = [[UILabel alloc] init];

       label.text = obj;
       label.backgroundColor = [UIColor orangeColor];
       [label configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
           layout.isEnabled =YES;
           layout.marginLeft = YGPointValue(10);
           layout.marginTop = YGPointValue(10);
       }];
       
       [redView addSubview:label];
    }
    
    redView.yoga.isEnabled = YES;
    [redView.yoga applyLayoutPreservingOrigin:YES];
    [self.view.yoga applyLayoutPreservingOrigin:NO];
}


- (void)alignLayout {
    UIView *redView = [[UIView alloc] init];
      redView.backgroundColor = [UIColor greenColor];    
      [self.view addSubview:redView];

      [redView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
          layout.isEnabled = YES;
          layout.height = YGPointValue(140);
          layout.width = YGPointValue([UIScreen mainScreen].bounds.size.width-40);
          layout.marginTop = YGPointValue(20);
          layout.marginLeft = YGPointValue(20);
          layout.flexDirection = YGFlexDirectionRow;
          layout.alignItems = YGAlignCenter;
          layout.justifyContent = YGJustifySpaceBetween;
      }];
      
      NSArray *tags = @[@"微信",@"投资理财",@"七日年化收益",@"支付宝"];
         
         for (NSString *obj in tags) {
             UILabel *label = [[UILabel alloc] init];

             label.text = obj;
             label.backgroundColor = [UIColor orangeColor];
             [label configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
                 layout.isEnabled =YES;
                 layout.marginLeft = YGPointValue(10);
                 layout.height = YGPointValue(15*obj.length);
             }];
             
             [redView addSubview:label];
         }
      
      redView.yoga.isEnabled = YES;
      [redView.yoga applyLayoutPreservingOrigin:YES];
      [self.view.yoga applyLayoutPreservingOrigin:NO];
    
}

@end
