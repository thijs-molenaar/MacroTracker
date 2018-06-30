//
//  AddFoodToDbViewController.m
//  MacroTracker
//
//  Created by Thijs on 30/06/2018.
//  Copyright © 2018 Thijs. All rights reserved.
//

#import "AddFoodToDbViewController.h"

@interface AddFoodToDbViewController ()
@property (weak, nonatomic) IBOutlet UITextField *foodName;
@property (weak, nonatomic) IBOutlet UITextField *proteinAmount;
@property (weak, nonatomic) IBOutlet UITextField *fatAmount;
@property (weak, nonatomic) IBOutlet UITextField *carbsAmount;
@property (weak, nonatomic) IBOutlet UITextField *servingSize;
@property (weak, nonatomic) IBOutlet UIButton *addButton;


@end

@implementation AddFoodToDbViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

@end
