//
//  ViewController.m
//  StartTransition
//
//  Created by Evgeniy on 10.11.17.
//  Copyright © 2017 Evgeniy. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "RZZoomAlphaAnimationController.h"
#import "RZTransitionsManager.h"
#import "RZCardSlideAnimationController.h"
@interface ViewController ()
@property (nonatomic, strong) SecondViewController* secondVC;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapFrom:)];
//    [self.nature addGestureRecognizer:tapGestureRecognizer];
    self.nature.layer.cornerRadius = 30;
    self.nature.clipsToBounds = YES;
    isFullScreen = false;
    tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgToFullScreen:)];
    tap.delegate = self;
    [self.nature addGestureRecognizer:tap];
    [self.nature setUserInteractionEnabled:YES];
}

//- (void) handleTapFrom: (UITapGestureRecognizer *)recognizer {
//    NSLog(@"Tapped");
//}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch;
{
    BOOL shouldReceiveTouch = YES;
    
    if (gestureRecognizer == tap) {
        shouldReceiveTouch = (touch.view == self.nature);
    }
    return shouldReceiveTouch;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)imgToFullScreen:(UITapGestureRecognizer *)tapGesture
{
    self.secondVC = [[SecondViewController alloc] init];
    
    UIStoryboard* storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    self.secondVC = [storyBoard instantiateViewControllerWithIdentifier:@"ID"];
    
    if (!isFullScreen) {
        
        
        
        [UIView animateWithDuration:5 delay:0 options:0 animations:^{
            //save previous frame
            prevFrame = self.nature.frame;
            self.nature.layer.cornerRadius = 0;
            self.nature.layer.zPosition = 3;
            [self.nature setFrame:[[UIScreen mainScreen] bounds]];
            //self.nature.image = self.secondVC.mount.image;
        }completion:^(BOOL finished){
            isFullScreen = true;
        }];
        return;
    } else {
        [UIView animateWithDuration:0.5 delay:0 options:0 animations:^{
            [self.nature setFrame:prevFrame];
            self.nature.layer.cornerRadius = 30;
        }completion:^(BOOL finished){
            isFullScreen = false;
        }];
        return;
    }
    
}

-(UIImage *)captureScreenInRect:(CGRect)captureFrame
{
    CALayer *layer;
    layer = self.view.layer;
    UIGraphicsBeginImageContext(self.view.bounds.size);
    CGContextClipToRect (UIGraphicsGetCurrentContext(),captureFrame);
    [layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *screenImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return screenImage;
}

- (IBAction)transBut:(id)sender {
    
    
    
    
    SecondViewController *nextViewController = [[SecondViewController alloc] init];
    UIStoryboard* storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    nextViewController = [storyBoard instantiateViewControllerWithIdentifier:@"ID"];
    [self presentViewController:nextViewController animated:NO completion:nil];
    //id<RZAnimationControllerProtocol> pushPopAnimationController = [[RZCardSlideAnimationController alloc] init];
    
    //[[RZTransitionsManager shared] setDefaultPushPopAnimationController:pushPopAnimationController];
    [UIView animateWithDuration:5 delay:0 options:0 animations:^{
        //save previous frame

        //self.nature.image = self.secondVC.mount.image;
    }completion:^(BOOL finished){

    }];
    [UIView animateWithDuration:5 animations:^{
//        id<RZAnimationControllerProtocol> presentDismissAnimationController = [[RZZoomAlphaAnimationController alloc] init];
//        [[RZTransitionsManager shared] setDefaultPresentDismissAnimationController:presentDismissAnimationController];
//        [self setTransitioningDelegate:[RZTransitionsManager shared]];
//        SecondViewController *nextViewController = [[SecondViewController alloc] init];
//        UIStoryboard* storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//        nextViewController = [storyBoard instantiateViewControllerWithIdentifier:@"ID"];
//        //self.nature
//        [nextViewController setTransitioningDelegate:[RZTransitionsManager shared]];
        //[self presentViewController:nextViewController animated:YES completion:nil];
    }];
    
}
@end
