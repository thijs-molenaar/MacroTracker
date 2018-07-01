//
//  HomeViewController.m
//  MacroTracker
//
//  Created by Thijs on 01/07/2018.
//  Copyright © 2018 Thijs. All rights reserved.
//

#import "HomeViewController.h"
#import "AppDelegate.h"
#import "Food+CoreDataProperties.h"
#define foodEntityName @"Food"



@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UIButton *setTargets;
@property (weak, nonatomic) IBOutlet UIButton *unsetTargets;
@property (weak, nonatomic) IBOutlet UILabel *targetsSetLabel;
@property (strong) NSMutableArray *foods;
@property(nonatomic, strong) NSPersistentContainer *persistanceContainer;


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
//    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
//    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Food"];
//    self.foods = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
//    NSLog(@"abcd");
    
    
//    NSPersistentContainer *persistanceContainer = [NSPersistentContainer persistentContainerWithName:@"MacroTracker"];
//    [persistanceContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription * _Nonnull description, NSError * _Nullable error) {
//        if (error != nil) {
//            NSLog(@"%@ %@", description, error);
//        }
//    }];
    self.persistanceContainer = ((AppDelegate *)[UIApplication sharedApplication].delegate).persistentContainer;

    
    NSFetchRequest *query = [NSFetchRequest fetchRequestWithEntityName:@"Food"];
    NSArray *results = [[self.persistanceContainer viewContext] executeFetchRequest:query error:nil];
    NSLog(@"asd");
}

- (IBAction)setTargetsInDb {
//    NSManagedObjectContext *context = [self managedObjectContext];
//
//    // Create a new managed object
//    NSManagedObject *newFood = [NSEntityDescription insertNewObjectForEntityForName:@"Food" inManagedObjectContext:context];
//    [newFood setValue:@"kefir/muesli/noten" forKey:@"name"];
//    [newFood setValue:@"21" forKey:@"protein"];
//    [newFood setValue:@"13" forKey:@"fat"];
//    [newFood setValue:@"65" forKey:@"carbs"];
//    [newFood setValue:@"13" forKey:@"fat"];
//    [newFood setValue:@"cup" forKey:@"serving_size_type"];
//    [newFood setValue:@"1" forKey:@"serving_size"];
    
    Food *food = [NSEntityDescription insertNewObjectForEntityForName:foodEntityName inManagedObjectContext:self.persistanceContainer.viewContext];
    food.name = @"kefir/muesli/noten";
    food.protein = 21;
    food.fat = 13;
    food.carbs = 65;
    food.serving_size_type = @"cup";
    food.serving_size = 1;
    
//    NSError *error = nil;
//    // Save the object to persistent store
//    if (![context save:&error]) {
//        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
//    }
    
    // close view
    //[self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)unsetTargetsInDb {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:foodEntityName];
    NSArray<Food *> *results = [self.persistanceContainer.viewContext executeFetchRequest:fetchRequest error:nil];
    for (Food *food in results) {
        NSLog(@"name %@", food.name);
        NSLog(@"protein  %i", food.protein);
        NSLog(@"fat  %i", food.fat);
        NSLog(@"carbs  %i", food.carbs);
    }
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
