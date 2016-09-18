//
//  UIButton+Common.m
//  test
//
//  Created by ws on 16/9/18.
//  Copyright © 2016年 ws. All rights reserved.
//

#import "UIButton+Common.h"
#import <POP.h>

@implementation UIButton (Common)

- (void)animateToImage:(NSString *)imageName{
    
    UIImage *image = [UIImage imageNamed:@"tweet_btn_liked"];
    if (!image) {
        return;
    }
    [self setImage:image forState:UIControlStateNormal];
    if ([self superview]) {
        UIView *superV = [self superview];
        UIImageView *imageV = [[UIImageView alloc] initWithImage:image];
        CGRect vFrame = [self convertRect:self.imageView.frame toView:superV];
        imageV.frame = vFrame;
        [superV addSubview:imageV];
        
        //animate
        CGAffineTransform fromTransform = imageV.transform;
        CGPoint fromCenter = imageV.center;
        CGFloat dx = CGRectGetWidth(self.frame)*1.5;
        CGFloat dy = CGRectGetHeight(self.frame)*2;
        CGFloat dScale = 3.0;
        CGFloat dRotation = M_PI_4;
        
        NSTimeInterval moveDurartion = 1.0;
        POPCustomAnimation *moveAnimate = [POPCustomAnimation animationWithBlock:^BOOL(id target, POPCustomAnimation *animation) {
            
            NSLog(@"%f---%f",animation.currentTime,animation.beginTime);
            float time_percent = (animation.currentTime - animation.beginTime) / moveDurartion;
            
            UIView *view = (UIView *)target;
            CGPoint toCenter = CGPointMake(fromCenter.x + time_percent * dx, fromCenter.y - time_percent * (2 - time_percent) * dy);
            view.center = toCenter;
            
            CGAffineTransform toTransform = fromTransform;
//            toTransform = CGAffineTransformTranslate(fromTransform, 50, 50);
            CGFloat toScale = 1 + time_percent *(dScale - 1);//线性放大
            toTransform = CGAffineTransformMakeScale(toScale, toScale);
            
            CGFloat toRotation = dRotation * (1- cosf(time_percent * M_PI_2));//cos曲线旋转（先慢后快）
            toTransform = CGAffineTransformRotate(toTransform, toRotation);
            
            view.transform = toTransform;
            view.alpha = 1 - time_percent;
            return time_percent < 1.0;
        }];
        moveAnimate.completionBlock = ^(POPAnimation *ani, BOOL isf){
            
            if (isf) {
                [imageV removeFromSuperview];
            }
        };
        [imageV pop_addAnimation:moveAnimate forKey:@"animateToImage"];
    }
}
@end
