//
//  SubviewViewController.m
//  StartTransition
//
//  Created by supermacho on 12.11.17.
//  Copyright © 2017 Evgeniy. All rights reserved.
//

#import "SubviewViewController.h"
#import "SampleViewController.h"
@interface SubviewViewController ()
@property (weak, nonatomic) IBOutlet UIView *testView;
@property(strong,nonatomic) SampleViewController * samples;
@end

@implementation SubviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}
- (void) displayContentController: (UIViewController*) content;
{
    [self addChildViewController:content];                 // 1
    content.view.bounds = self.testView.bounds;                 //2
    [self.testView addSubview:content.view];
    [content didMoveToParentViewController:self];          // 3
}


- (void) hideContentController: (UIViewController*) content
{
    [content willMoveToParentViewController:nil];  // 1
    [content.view removeFromSuperview];            // 2
    [content removeFromParentViewController];      // 3
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

- (IBAction)but:(id)sender {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.samples = [storyBoard instantiateViewControllerWithIdentifier:@"SampleViewController"];
//    [self addChildViewController:self.samples];
//    [self.view addSubview:self.samples.view];
//    [self.samples didMoveToParentViewController:self];
    //[self displayContentController:self.samples];
    
    CATransition* transition = [CATransition animation];
    transition.duration = 0.3;
    transition.type = kCATransitionFade;
    transition.subtype = kCATransitionFade;
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    [self.navigationController pushViewController:self.samples animated:NO];

}
@end
