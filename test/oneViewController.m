//
//  oneViewController.m
//  test
//
//  Created by ws on 16/9/16.
//  Copyright © 2016年 ws. All rights reserved.
//

#import "oneViewController.h"
#import "twoViewController.h"

@interface oneViewController ()

@end

@implementation oneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    twoViewController *two = [[twoViewController alloc] init];
    [self.navigationController pushViewController:two animated:YES];
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
