//
//  ViewController.m
//  MacroTracker
//
//  Created by Thijs on 30/06/2018.
//  Copyright © 2018 Thijs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *calcButton;
@property (weak, nonatomic) IBOutlet UILabel *proteinAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *fatAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *carbsAmountLabel;
@property (weak, nonatomic) IBOutlet UITextField *targetCaloriesTextBox;
@property (weak, nonatomic) IBOutlet UITextField *bodyweightTextBox;

@property NSInteger proteinAmount;
@property NSInteger fatAmount;
@property NSInteger carbsAmount;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self addDoneButton];
}

// add done button to keypad inputs so they can actually be closed by user
- (void)addDoneButton {
    UIToolbar* keyboardToolbar = [[UIToolbar alloc] init];
    [keyboardToolbar sizeToFit];
    UIBarButtonItem *flexBarButton = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                      target:nil action:nil];
    UIBarButtonItem *doneBarButton = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                      target:self.view action:@selector(endEditing:)];
    keyboardToolbar.items = @[flexBarButton, doneBarButton];
    self.targetCaloriesTextBox.inputAccessoryView = keyboardToolbar;
    self.bodyweightTextBox.inputAccessoryView = keyboardToolbar;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)calcButtonPressed {
   
    if (!_targetCaloriesTextBox.hasText || !_bodyweightTextBox.hasText) {
        return;
    }
    
    NSInteger targetCalories = [_targetCaloriesTextBox.text integerValue];
    NSInteger bodyweightInKg = [_bodyweightTextBox.text integerValue];
    
    // take 2 grams per kg of bodyweight as protein guideline
    _proteinAmount = bodyweightInKg * 2;
    
    // take 1 gram per kg of bodyweight as fat guideline
    _fatAmount = bodyweightInKg;
    
    // calc carbs by formula: (target calories - (4p + 9f))/4
    // e.g. bodyweight is 70 kg, target calories 2000
    // carbs will be (2000 - (280 + 630))/4  = (2000 - 910) / 4 = 1090 / 4 = 272.5 grams of carbs
    _carbsAmount = (targetCalories - (4 * _proteinAmount + 9 * _fatAmount))/4;
    
    _proteinAmountLabel.text = [NSString stringWithFormat:@"%@%@", [NSString stringWithFormat:@"%i", _proteinAmount], @" grams"] ;
    _fatAmountLabel.text = [NSString stringWithFormat:@"%@%@", [NSString stringWithFormat:@"%i", _fatAmount], @" grams"] ;
    _carbsAmountLabel.text = [NSString stringWithFormat:@"%@%@", [NSString stringWithFormat:@"%i", _carbsAmount], @" grams"] ;
    
}


@end
