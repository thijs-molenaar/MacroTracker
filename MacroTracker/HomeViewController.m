//
//  HomeViewController.m
//  MacroTracker
//
//  Created by Thijs on 01/07/2018.
//  Copyright © 2018 Thijs. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UIButton *setTargets;
@property (weak, nonatomic) IBOutlet UIButton *unsetTargets;
@property (weak, nonatomic) IBOutlet UILabel *targetsSetLabel;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)setTargetsInDb {
}
- (IBAction)unsetTargetsInDb {
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
