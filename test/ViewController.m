//
//  ViewController.m
//  test
//
//  Created by ws on 16/9/16.
//  Copyright © 2016年 ws. All rights reserved.
//

#import "ViewController.h"
#import "oneViewController.h"
#import "UIButton+Common.h"

@interface ViewController ()

@property (nonatomic, weak) UIButton *redBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *redBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 500, 50 , 50)];
    [redBtn setTitle:@"12" forState:UIControlStateNormal];
    
    [redBtn setImage:[UIImage imageNamed:@"tweet_btn_like"] forState:UIControlStateNormal];
    [self.view addSubview:redBtn];
    self.redBtn = redBtn;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.redBtn animateToImage:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    
//    oneViewController *one = [[oneViewController alloc] init];
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:one];
//    [self presentViewController:nav animated:YES completion:nil];
//}
@end
