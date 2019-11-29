//
//  ViewController.m
//  TestYogaKit
//
//  Created by xiaoniu on 10/10/19.
//  Copyright © 2019 com.xffoundation. All rights reserved.
//

#import "ViewController.h"
#import <UIView+Yoga.h>
#import <Masonry/Masonry.h>

#define kRandomColor  [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1.0]

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self tagLayout];
//    [self inputLayout];
//    [self mixAutoLayout];
//    [self mLayout];
//    [self alignLayout];
//    [self display];
//    [self demo];
    self.view.yoga.isEnabled = YES;
//    [self demo1];
    [self flexGrow];
//
//    [self center];
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
    
    bgView.backgroundColor = [UIColor whiteColor];
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
    textField.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
    [textField configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.marginLeft = YGPointValue(10);
        layout.flexGrow = 1;
        layout.borderWidth = 1;
    }];
    
    UIButton *codeButton = [[UIButton alloc] init];
    codeButton.backgroundColor = [UIColor blueColor];
    [codeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    [codeButton configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.marginRight = YGPointValue(10);
    }];
    
    [codeButton addTarget:self action:@selector(codeButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [bgView addSubview:leftImageView];
    [bgView addSubview:textField];
    [bgView addSubview:codeButton];
    
    self.view.yoga.isEnabled = YES;
    [self.view.yoga applyLayoutPreservingOrigin:NO];
}

- (void)codeButtonClicked:(UIButton *)button {
    [button setTitle:@"验证" forState:UIControlStateNormal];
    button.superview.yoga.marginTop = YGPointValue(0);
    [button.yoga markDirty];
    [button.superview.yoga applyLayoutPreservingOrigin:YES];
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
        layout.marginRight = YGPointValue(20);
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
           layout.marginRight = YGPointValue(10);
       }];
       
       [redView addSubview:label];
    }
    
    redView.yoga.isEnabled = YES;
    [redView.yoga applyLayoutPreservingOrigin:YES];
    [self.view.yoga applyLayoutPreservingOrigin:NO];
}


- (void)alignLayout {
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor purpleColor];
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

- (void)display {
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor purpleColor];
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
        
        if ([label.text isEqualToString:@"投资理财"]) {
            label.yoga.display = YGDisplayNone;
        }
        
        [redView addSubview:label];
    }

    redView.yoga.isEnabled = YES;
    [redView.yoga applyLayoutPreservingOrigin:YES];
    [self.view.yoga applyLayoutPreservingOrigin:NO];
}

- (void)demo {
    UIView *contentView = [[UIView alloc] init];
    contentView.backgroundColor = [UIColor orangeColor];
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"1"];
    imageView.backgroundColor = [UIColor redColor];
    
    
    [contentView addSubview:imageView];
    
    UILabel *mainLabel = [[UILabel alloc] init];
    mainLabel.text = @"这是主标题";
    
    UILabel *descLabel = [[UILabel alloc] init];
    descLabel.text = @"这是描述";
    
    
    mainLabel.yoga.isEnabled = YES;
    descLabel.yoga.isEnabled = YES;
    
    [contentView addSubview:imageView];
    [contentView addSubview:mainLabel];
    [contentView addSubview:descLabel];
    
    [contentView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.paddingLeft = YGPointValue(10);
        layout.paddingTop = YGPointValue(10);
        layout.marginTop = YGPointValue(10);
        layout.width = YGPointValue(200);
        layout.height = YGPointValue(100);
        layout.flexDirection = YGFlexDirectionColumn;
    }];
    
    [imageView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.alignSelf = YGAlignFlexEnd;
        layout.justifyContent = YGJustifyFlexEnd;
        layout.bottom = YGPointValue(0);
        layout.position = YGPositionTypeAbsolute;
    }];
    
    [self.view addSubview:contentView];
    [self.view.yoga applyLayoutPreservingOrigin:YES];
}

- (void)demo1 {
    UIView *contentView = [[UIView alloc] init];
    contentView.backgroundColor = [UIColor orangeColor];
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"1"];
    imageView.backgroundColor = [UIColor redColor];
    
    
    [contentView addSubview:imageView];
    
    UILabel *mainLabel = [[UILabel alloc] init];
    mainLabel.text = @"这是主标题";
    mainLabel.backgroundColor = [UIColor greenColor];
    
    UILabel *descLabel = [[UILabel alloc] init];
    descLabel.text = @"这是描述";
    descLabel.backgroundColor = [UIColor whiteColor];
    
    mainLabel.yoga.isEnabled = YES;
    
    [mainLabel configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.alignSelf = YGAlignFlexStart;
    }];
    
    descLabel.yoga.isEnabled = YES;
    
    [descLabel configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexGrow = 1;
    }];
    
    [contentView addSubview:imageView];
    [contentView addSubview:mainLabel];
    [contentView addSubview:descLabel];
    
    [contentView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.paddingLeft = YGPointValue(10);
        layout.paddingTop = YGPointValue(10);
        layout.marginTop = YGPointValue(10);
        layout.width = YGPointValue(200);
        layout.height = YGPointValue(100);
        layout.alignItems = YGAlignStretch;
        layout.flexDirection = YGFlexDirectionColumn;
    }];
    
    [imageView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.alignSelf = YGAlignFlexEnd;
        layout.justifyContent = YGJustifyFlexEnd;
        layout.bottom = YGPointValue(0);
        layout.position = YGPositionTypeAbsolute;
    }];
    
    [self.view addSubview:contentView];
    [self.view.yoga applyLayoutPreservingOrigin:YES];
}

- (void)center {
    UIView *contentView = [[UIView alloc] init];
    contentView.backgroundColor = [UIColor orangeColor];

    UILabel *mainLabel = [[UILabel alloc] init];
    mainLabel.text = @"这是主标题";
    
    UILabel *descLabel = [[UILabel alloc] init];
    descLabel.text = @"描述";
    
    
    mainLabel.yoga.isEnabled = YES;
    descLabel.yoga.isEnabled = YES;
    
    [contentView addSubview:mainLabel];
    [contentView addSubview:descLabel];
    
    [contentView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexGrow = 1;
        layout.marginTop = YGPointValue(10);
        layout.justifyContent = YGJustifyCenter;
        layout.flexDirection = YGFlexDirectionRow;
    }];
    
    [self.view addSubview:contentView];
    self.view.yoga.isEnabled = YES;
    [self.view.yoga applyLayoutPreservingOrigin:YES];
}

- (void)flexGrow {
    UIView *contentView = [[UIView alloc] init];
    contentView.backgroundColor = kRandomColor;

//    UIImageView *imageView = [[UIImageView alloc] init];
//    imageView.image = [UIImage imageNamed:@"bd_logo1"];
//    imageView.backgroundColor = kRandomColor;
    
    UILabel *mainLabel = [[UILabel alloc] init];
    mainLabel.text = @"这是主标题";
    mainLabel.backgroundColor = kRandomColor;
    
    [contentView addSubview:mainLabel];
    
    [mainLabel configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexGrow = 1;
    }];

    [contentView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexDirection = YGFlexDirectionRow;
        layout.justifyContent = YGJustifySpaceAround;
        layout.height = YGPointValue(200);
        layout.width = YGPointValue([UIScreen mainScreen].bounds.size.width);
    }];
    
    [self.view addSubview:contentView];
    
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.view);
        make.height.mas_equalTo(200);
    }];

    [contentView.yoga applyLayoutPreservingOrigin:YES];
//    self.view.yoga.isEnabled = YES;
//    [self.view.yoga applyLayoutPreservingOrigin:YES];
}

@end
