//
//  LookAtAssignmentsViewController.m
//  Grades
//
//  Created by CS3714 on 12/16/12.
//  Copyright (c) 2012 Chris Jones. All rights reserved.
//

#import "LookAtAssignmentsViewController.h"

@interface LookAtAssignmentsViewController ()

@end

@implementation LookAtAssignmentsViewController


//Global variables used for setting the total grade
//double counter = 0;
//double totalWeight = 0;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    self.title = self.currentAssignment;
    // Instantiate a Add button to invoke the add: method when tapped
    UIBarButtonItem *add = [[UIBarButtonItem alloc]
                            initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                            target:self action:@selector(addItem:)];
    
    // Set up the Save custom button on the right of the navigation bar
    self.navigationItem.rightBarButtonItem = add;
    
    self.itemDict = [self.workDict objectForKey:self.currentAssignment];
    self.itemArray = (NSMutableArray*)[self.itemDict allKeys];

    NSUInteger totalCourseGrade = [[self.itemArray objectAtIndex:1]intValue];
    
    if(totalCourseGrade == 11){
        self.pictureView.image = [UIImage imageNamed:@"F.png"];
    }
    if(totalCourseGrade == 10){
        self.pictureView.image = [UIImage imageNamed:@"D-.png"];
    }
    if(totalCourseGrade == 9){
        self.pictureView.image = [UIImage imageNamed:@"D.png"];
    }
    if(totalCourseGrade == 8){
        self.pictureView.image = [UIImage imageNamed:@"D+.png"];
    }
    if(totalCourseGrade == 7){
        self.pictureView.image = [UIImage imageNamed:@"C-.png"];
    }
    if(totalCourseGrade == 6){
        self.pictureView.image = [UIImage imageNamed:@"C.png"];
    }
    if(totalCourseGrade == 5){
        self.pictureView.image = [UIImage imageNamed:@"C+.png"];
    }
    if(totalCourseGrade == 4){
        self.pictureView.image = [UIImage imageNamed:@"B-.png"];
    }
    if(totalCourseGrade == 3){
        self.pictureView.image = [UIImage imageNamed:@"B.png"];
    }
    if(totalCourseGrade == 2){
        self.pictureView.image = [UIImage imageNamed:@"B+.png"];
    }
    if(totalCourseGrade == 1){
        self.pictureView.image = [UIImage imageNamed:@"A-.png"];
    }
    if(totalCourseGrade == 0){
        self.pictureView.image = [UIImage imageNamed:@"A.png"];
    }

    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma addItem Delegate
- (void)addItemViewControllerDelegate:(AddItemViewController *)controller didFinishWithSave:(BOOL)save;
{
    
    if (save) {
        // Get the date entered by the user on the AddClassViewController
        NSString *name = controller.nameText.text;
        NSString *w = controller.weightText.text;
        NSString *s = controller.earnedText.text;
        NSString *t = controller.totalText.text;
        if(name.length == 0){
            // Create the Alert View
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:@"Please enter in an item name."
                                                           delegate:self
                                                  cancelButtonTitle:@"Okay"
                                                  otherButtonTitles:nil];
            
            // Display the Alert View
            [alert show];
        }
        else if(w.length ==0){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:@"Please enter in the items course weight."
                                                           delegate:self
                                                  cancelButtonTitle:@"Okay"
                                                  otherButtonTitles:nil];
            
            // Display the Alert View
            [alert show];

        }
        else if(s.length ==0){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:@"Please enter in the points you earned for the item."
                                                           delegate:self
                                                  cancelButtonTitle:@"Okay"
                                                  otherButtonTitles:nil];
            
            // Display the Alert View
            [alert show];
            
        }
        else if(t.length ==0){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:@"Please enter in the total points possible for the item."
                                                           delegate:self
                                                  cancelButtonTitle:@"Okay"
                                                  otherButtonTitles:nil];
            
            // Display the Alert View
            [alert show];
            
        }
        else{
            if ([self.itemArray containsObject:name]) {
                // Create the Alert View
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                message:@"Item already exists; please enter in a new item."
                                                               delegate:self
                                                      cancelButtonTitle:@"Okay"
                                                      otherButtonTitles:nil];
                
                // Display the Alert View
                [alert show];
                
                
            }

            else{
                
                
                
                
                
               // int zero = 0;
                
                
                
                double studentsScore = [controller.earnedText.text doubleValue];
                double totalScore = [controller.totalText.text doubleValue];
                
                double actualScore = (studentsScore/totalScore) * 100;
                
               // NSString *cg = @"Grade For Work";
               // NSString *wk = @"Total Percentage";
                
                int weight = [controller.weightText.text intValue];
                
                NSNumber *grade;
                
                NSNumber *weightInsert = [NSNumber numberWithInt:weight];
                NSNumber *studentInsert = [NSNumber numberWithInt:studentsScore];
                NSNumber *totalInsert = [NSNumber numberWithInt:totalScore];
                
                if(actualScore < 60){
                    grade = [NSNumber numberWithInt:11];
                }
                else if(actualScore >= 60 && actualScore < 63){
                    grade = [NSNumber numberWithInt:10];
                }
                else if(actualScore >= 63 && actualScore < 67){
                    grade = [NSNumber numberWithInt:9];
                }
                else if(actualScore >= 67 && actualScore < 70){
                    grade = [NSNumber numberWithInt:8];
                }
                else if(actualScore >= 70 && actualScore < 73){
                    grade = [NSNumber numberWithInt:7];
                }
                else if(actualScore >= 73 && actualScore < 77){
                    grade = [NSNumber numberWithInt:6];
                }
                else if(actualScore >= 77 && actualScore < 80){
                    grade = [NSNumber numberWithInt:5];
                }
                else if(actualScore >= 80 && actualScore < 83){
                    grade = [NSNumber numberWithInt:4];
                }
                else if(actualScore >= 83 && actualScore < 87){
                    grade = [NSNumber numberWithInt:3];
                }
                else if(actualScore >= 87 && actualScore < 90){
                    grade = [NSNumber numberWithInt:2];
                }
                else if(actualScore >= 90 && actualScore < 93){
                    grade = [NSNumber numberWithInt:1];
                }
                else if(actualScore >= 93 && actualScore <= 100){
                    grade = [NSNumber numberWithInt:0];
                }
                
                NSMutableArray *itemToAdd = [[NSMutableArray alloc]initWithObjects:weightInsert,studentInsert,totalInsert,grade,nil];
                [self.itemDict setValue:itemToAdd forKey:name];
                self.itemArray = (NSMutableArray*)[self.itemDict allKeys];
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
               
               
                
                
                
                
                [self.tableView reloadData];
                
                /*
                 Pop the current view controller AddCityViewController from the stack
                 and show the next view controller in the stack, which is ViewController.
                 */
                [self.navigationController popViewControllerAnimated:YES];
                
          }
            
        }
        
        
    }
    

    
    
    
}

#pragma editItem Delegate
- (void)editItemViewControllerDelegate:(EditItemViewController *)controller didFinishWithSave:(BOOL)save;
{
    
    if (save) {
        // Get the date entered by the user on the AddClassViewController
        NSString *name = controller.nameText.text;
        NSString *w = controller.weightText.text;
        NSString *s = controller.earnedText.text;
        NSString *t = controller.totalText.text;
        if(name.length == 0){
            // Create the Alert View
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:@"Please enter in an item name."
                                                           delegate:self
                                                  cancelButtonTitle:@"Okay"
                                                  otherButtonTitles:nil];
            
            // Display the Alert View
            [alert show];
        }
        else if(w.length ==0){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:@"Please enter in the items course weight."
                                                           delegate:self
                                                  cancelButtonTitle:@"Okay"
                                                  otherButtonTitles:nil];
            
            // Display the Alert View
            [alert show];
            
        }
        else if(s.length ==0){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:@"Please enter in the points you earned for the item."
                                                           delegate:self
                                                  cancelButtonTitle:@"Okay"
                                                  otherButtonTitles:nil];
            
            // Display the Alert View
            [alert show];
            
        }
        else if(t.length ==0){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:@"Please enter in the total points possible for the item."
                                                           delegate:self
                                                  cancelButtonTitle:@"Okay"
                                                  otherButtonTitles:nil];
            
            // Display the Alert View
            [alert show];
            
        }
        else{
        
      
                
                
                
                
                
                // int zero = 0;
                
                
                
                double studentsScore = [controller.earnedText.text doubleValue];
                double totalScore = [controller.totalText.text doubleValue];
                
                double actualScore = (studentsScore/totalScore) * 100;
                
                // NSString *cg = @"Grade For Work";
                // NSString *wk = @"Total Percentage";
                
                int weight = [controller.weightText.text intValue];
                
                NSNumber *grade;
                
                NSNumber *weightInsert = [NSNumber numberWithInt:weight];
                NSNumber *studentInsert = [NSNumber numberWithInt:studentsScore];
                NSNumber *totalInsert = [NSNumber numberWithInt:totalScore];
                
                if(actualScore < 60){
                    grade = [NSNumber numberWithInt:11];
                }
                else if(actualScore >= 60 && actualScore < 63){
                    grade = [NSNumber numberWithInt:10];
                }
                else if(actualScore >= 63 && actualScore < 67){
                    grade = [NSNumber numberWithInt:9];
                }
                else if(actualScore >= 67 && actualScore < 70){
                    grade = [NSNumber numberWithInt:8];
                }
                else if(actualScore >= 70 && actualScore < 73){
                    grade = [NSNumber numberWithInt:7];
                }
                else if(actualScore >= 73 && actualScore < 77){
                    grade = [NSNumber numberWithInt:6];
                }
                else if(actualScore >= 77 && actualScore < 80){
                    grade = [NSNumber numberWithInt:5];
                }
                else if(actualScore >= 80 && actualScore < 83){
                    grade = [NSNumber numberWithInt:4];
                }
                else if(actualScore >= 83 && actualScore < 87){
                    grade = [NSNumber numberWithInt:3];
                }
                else if(actualScore >= 87 && actualScore < 90){
                    grade = [NSNumber numberWithInt:2];
                }
                else if(actualScore >= 90 && actualScore < 93){
                    grade = [NSNumber numberWithInt:1];
                }
                else if(actualScore >= 93 && actualScore <= 100){
                    grade = [NSNumber numberWithInt:0];
                }
                
                NSMutableArray *itemToAdd = [[NSMutableArray alloc]initWithObjects:weightInsert,studentInsert,totalInsert,grade,nil];
                [self.itemDict setValue:itemToAdd forKey:name];
                self.itemArray = (NSMutableArray*)[self.itemDict allKeys];
  
                [self.tableView reloadData];
                
                /*
                 Pop the current view controller AddCityViewController from the stack
                 and show the next view controller in the stack, which is ViewController.
                 */
                [self.navigationController popViewControllerAnimated:YES];
                
            
            
        }
        
        
    }
    
    
    
    
    
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray *tempArray = [[NSMutableArray alloc]initWithArray:self.itemArray];
    NSString *tp = @"Total Percentage";
    NSString *wk = @"Grade For Work";
    [tempArray removeObject:tp];
    [tempArray removeObject:wk];
    
    self.currentItem = [tempArray objectAtIndex:indexPath.section];
    self.selectedItemArray = [self.itemDict objectForKey:self.currentItem];
    
    [self performSegueWithIdentifier:@"editItem" sender:self];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return (self.itemArray.count -2 );
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
   
        
    
    //NSUInteger sectionNumber = [indexPath section];  // Identify the section number
    //NSUInteger rowNumber = [indexPath row]; //Identify the row number
    
    NSString *tp = @"Total Percentage";
    NSString *wk = @"Grade For Work";

    static NSString *CellIdentifier = @"assignCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSMutableArray *tempArray = [[NSMutableArray alloc]initWithArray:self.itemArray];
    [tempArray removeObject:tp];
    [tempArray removeObject:wk];
    
    
    NSString *letter = [tempArray objectAtIndex:indexPath.section];

        
    
    self.currentItemArray = [self.itemDict objectForKey:letter];
    
    NSUInteger grade = [[self.currentItemArray objectAtIndex:3]intValue];
    /*
    double tempWeight = [[self.currentItemArray objectAtIndex:0]doubleValue];
    double tempTotal = [[self.currentItemArray objectAtIndex:2]doubleValue];
    double tempEarned = [[self.currentItemArray objectAtIndex:1]doubleValue];
    
    totalWeight = totalWeight + tempWeight;
    
    counter = counter + ((tempEarned/tempTotal)*tempWeight);
    

        
        double totalTotal = (counter/totalWeight)*100;
        NSNumber *totalGrade;
        
        
        if(totalTotal < 60){
            totalGrade = [NSNumber numberWithInt:11];
            self.pictureView.image = [UIImage imageNamed:@"F.png"];
        }
        else if(totalTotal >= 60 && totalTotal < 63){
            totalGrade = [NSNumber numberWithInt:10];
            self.pictureView.image = [UIImage imageNamed:@"D-.png"];
        }
        else if(totalTotal >= 63 && totalTotal < 67){
            totalGrade = [NSNumber numberWithInt:9];
            self.pictureView.image = [UIImage imageNamed:@"D.png"];
        }
        else if(totalTotal >= 67 && totalTotal < 70){
            totalGrade = [NSNumber numberWithInt:8];
            self.pictureView.image = [UIImage imageNamed:@"D+.png"];
        }
        else if(totalTotal >= 70 && totalTotal < 73){
            totalGrade = [NSNumber numberWithInt:7];
            self.pictureView.image = [UIImage imageNamed:@"C-.png"];
        }
        else if(totalTotal >= 73 && totalTotal < 77){
            totalGrade = [NSNumber numberWithInt:6];
            self.pictureView.image = [UIImage imageNamed:@"C.png"];
        }
        else if(totalTotal >= 77 && totalTotal < 80){
            totalGrade = [NSNumber numberWithInt:5];
            self.pictureView.image = [UIImage imageNamed:@"C+.png"];
        }
        else if(totalTotal >= 80 && totalTotal < 83){
            totalGrade = [NSNumber numberWithInt:4];
            self.pictureView.image = [UIImage imageNamed:@"B-.png"];
        }
        else if(totalTotal >= 83 && totalTotal < 87){
            totalGrade = [NSNumber numberWithInt:3];
            self.pictureView.image = [UIImage imageNamed:@"B.png"];
        }
        else if(totalTotal >= 87 && totalTotal < 90){
            totalGrade = [NSNumber numberWithInt:2];
            self.pictureView.image = [UIImage imageNamed:@"B+.png"];
        }
        else if(totalTotal >= 90 && totalTotal < 93){
            totalGrade = [NSNumber numberWithInt:1];
            self.pictureView.image = [UIImage imageNamed:@"A-.png"];
        }
        else if(totalTotal >= 93 && totalTotal <= 100){
            totalGrade = [NSNumber numberWithInt:0];
            self.pictureView.image = [UIImage imageNamed:@"A.png"];
        }
    //NSString *stringToInput = [totalGrade stringValue];
    
    
    [self.itemDict setValue:totalGrade forKey:wk];
    self.itemArray = (NSMutableArray*)[self.itemDict allKeys];
    */
    
    cell.textLabel.text = letter;
    
    //Sets the course icon depending on what the letter grade is
    if(grade == 11){
        cell.imageView.image = [UIImage imageNamed:@"F.png"];
    }
    if(grade == 10){
        cell.imageView.image = [UIImage imageNamed:@"D-.png"];
    }
    if(grade == 9){
        cell.imageView.image = [UIImage imageNamed:@"D.png"];
    }
    if(grade == 8){
        cell.imageView.image = [UIImage imageNamed:@"D+.png"];
    }
    if(grade == 7){
        cell.imageView.image = [UIImage imageNamed:@"C-.png"];
    }
    if(grade == 6){
        cell.imageView.image = [UIImage imageNamed:@"C.png"];
    }
    if(grade == 5){
        cell.imageView.image = [UIImage imageNamed:@"C+.png"];
    }
    if(grade == 4){
        cell.imageView.image = [UIImage imageNamed:@"B-.png"];
    }
    if(grade == 3){
        cell.imageView.image = [UIImage imageNamed:@"B.png"];
    }
    if(grade == 2){
        cell.imageView.image = [UIImage imageNamed:@"B+.png"];
    }
    if(grade == 1){
        cell.imageView.image = [UIImage imageNamed:@"A-.png"];
    }
    if(grade == 0){
        cell.imageView.image = [UIImage imageNamed:@"A.png"];
    }
    
    return cell;
}
-(void)addItem:(id)sender{
        [self performSegueWithIdentifier:@"addItem" sender:self];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    if ([[segue identifier] isEqualToString:@"addItem"]){
        AddItemViewController *add = [segue destinationViewController];
        add.delegate = self;

    }
    if ([[segue identifier] isEqualToString:@"editItem"]){
        EditItemViewController *edit = [segue destinationViewController];
        edit.name = self.currentItem;
        edit.delegate = self;
        edit.selectedItemArray = self.selectedItemArray;
        
    }
    
}
// This is the method invoked when the user taps the Delete button in the Edit mode
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSUInteger sectionNumber = [indexPath section];
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {  // Handle the Delete action
        
        NSString *nameOfItemToDelete = [self.itemArray objectAtIndex:indexPath.section];
        
        [self.itemDict removeObjectForKey:nameOfItemToDelete];
        
        self.itemArray = (NSMutableArray*)[[self.itemDict allKeys]sortedArrayUsingSelector:@selector(compare:)];
        
        
        
        // Reload the rows and sections of the Table View countryCityTableView
        [self.tableView reloadData];
    }
}

@end
