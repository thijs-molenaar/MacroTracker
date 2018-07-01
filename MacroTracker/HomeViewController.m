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
@property (strong) NSMutableArray *foods;

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

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // view appears en wil objectcontext initialisen, maar error door niet bestaande app delegate
    // functie managedObjectContext
    
    // Fetch the foods from persistent data store
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Food"];
    self.foods = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    NSLog(@"abcd");
}

- (IBAction)setTargetsInDb {
    NSManagedObjectContext *context = [self managedObjectContext];
    
    // Create a new managed object
    NSManagedObject *newFood = [NSEntityDescription insertNewObjectForEntityForName:@"Food" inManagedObjectContext:context];
    [newFood setValue:@"kefir/muesli/noten" forKey:@"name"];
    [newFood setValue:@"21" forKey:@"protein"];
    [newFood setValue:@"13" forKey:@"fat"];
    [newFood setValue:@"65" forKey:@"carbs"];
    [newFood setValue:@"13" forKey:@"fat"];
    [newFood setValue:@"cup" forKey:@"serving_size_type"];
    [newFood setValue:@"1" forKey:@"serving_size"];
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
