//
//  LookAtClassViewController.m
//  Grades
//
//  Created by CS3714 on 12/16/12.
//  Copyright (c) 2012 Chris Jones. All rights reserved.
//

#import "LookAtClassViewController.h"

@interface LookAtClassViewController ()

@end

@implementation LookAtClassViewController


NSString *goingtoSend;

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
    
    // Instantiate a Add button to invoke the add: method when tapped
    UIBarButtonItem *add = [[UIBarButtonItem alloc]
                            initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                            target:self action:@selector(addAssignment:)];
    
    // Set up the Save custom button on the right of the navigation bar
    self.navigationItem.rightBarButtonItem = add;
    
    NSDictionary *tempDict = [self.courseList objectForKey:self.currentCourse];
    
    self.courseLabel.text = self.currentCourse;
    
    
    NSArray *tempArray = [tempDict allValues];
    NSUInteger totalCourseGrade = [[tempArray objectAtIndex:0] intValue];
    
    NSString *work = @"Work";
    
    
    self.workDict = [tempDict objectForKey:work];
    
    self.assignmentNames = [[self.workDict allKeys]sortedArrayUsingSelector:@selector(compare:)];

    if(totalCourseGrade == 11){
        self.gradeImage.image = [UIImage imageNamed:@"F.png"];
    }
    if(totalCourseGrade == 10){
        self.gradeImage.image = [UIImage imageNamed:@"D-.png"];
    }
    if(totalCourseGrade == 9){
        self.gradeImage.image = [UIImage imageNamed:@"D.png"];
    }
    if(totalCourseGrade == 8){
        self.gradeImage.image = [UIImage imageNamed:@"D+.png"];
    }
    if(totalCourseGrade == 7){
        self.gradeImage.image = [UIImage imageNamed:@"C-.png"];
    }
    if(totalCourseGrade == 6){
        self.gradeImage.image = [UIImage imageNamed:@"C.png"];
    }
    if(totalCourseGrade == 5){
        self.gradeImage.image = [UIImage imageNamed:@"C+.png"];
    }
    if(totalCourseGrade == 4){
        self.gradeImage.image = [UIImage imageNamed:@"B-.png"];
    }
    if(totalCourseGrade == 3){
        self.gradeImage.image = [UIImage imageNamed:@"B.png"];
    }
    if(totalCourseGrade == 2){
        self.gradeImage.image = [UIImage imageNamed:@"B+.png"];
    }
    if(totalCourseGrade == 1){
        self.gradeImage.image = [UIImage imageNamed:@"A-.png"];
    }
    if(totalCourseGrade == 0){
        self.gradeImage.image = [UIImage imageNamed:@"A.png"];
    }

    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addAssignment:(id)sender{
    
    [self performSegueWithIdentifier:@"addAssign" sender:self];

}




#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    goingtoSend = [self.assignmentNames objectAtIndex :indexPath.section];

    [self performSegueWithIdentifier:@"lookAssign" sender:self];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return self.workDict.count;
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
    
    
    static NSString *CellIdentifier = @"workCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    self.currentAssignment = [self.assignmentNames objectAtIndex:indexPath.section];
    
    
    NSMutableDictionary *assignmentDictionary = [self.workDict objectForKey:self.currentAssignment];
    NSString *tp = @"Total Percentage";
    NSString *gw = @"Grade for Work";
    
    NSString *totalPercentOfCourse = [assignmentDictionary objectForKey:tp];
    NSUInteger grade = [[assignmentDictionary objectForKey:gw] intValue];
    
    NSString *tempAppending = [NSString stringWithFormat:@" (%@%%)",totalPercentOfCourse];
    
    NSString *currentCourseWithAppend = self.currentAssignment;
    currentCourseWithAppend = [currentCourseWithAppend stringByAppendingString:tempAppending];


 
    
    cell.textLabel.text = currentCourseWithAppend;
    
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
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"addAssign"]) {
        AddAssignmentViewController *addAssignment = [segue destinationViewController];
        addAssignment.delegate = self;
        
    }
    if ([[segue identifier] isEqualToString:@"lookAssign"]){
        LookAtAssignmentsViewController *look = [segue destinationViewController];
        look.workDict = self.workDict;
        look.currentAssignment = goingtoSend;
    }
    
}
#pragma addAssignment Delegate
- (void)addAssignmentViewControllerDelegate:(AddAssignmentViewController *)controller didFinishWithSave:(BOOL)save;
{
    
    if (save) {
        // Get the date entered by the user on the AddClassViewController
        NSString *name = controller.nameText.text;
        NSString *wk = @"Work";
        
        NSMutableDictionary *classDict = [self.courseList objectForKey:self.currentCourse];
        self.workDict = [classDict objectForKey:wk];
        NSArray *nameOfWorkStuff = [self.workDict allKeys];
        NSUInteger checkNumber = controller.percentageText.text.intValue;
        
        
        if(name.length == 0){
            // Create the Alert View
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:@"Please enter in an assignment name"
                                                           delegate:self
                                                  cancelButtonTitle:@"Okay"
                                                  otherButtonTitles:nil];
            
            // Display the Alert View
            [alert show];
            
            
            
        }
        else if(checkNumber > 100){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:@"Please enter in a number less than 100"
                                                           delegate:self
                                                  cancelButtonTitle:@"Okay"
                                                  otherButtonTitles:nil];
            
            // Display the Alert View
            [alert show];
            
        }
        else{
            if ([nameOfWorkStuff containsObject:name]) {
                // Create the Alert View
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                message:@"Assignment already exists; please enter in a new assignment."
                                                               delegate:self
                                                      cancelButtonTitle:@"Okay"
                                                      otherButtonTitles:nil];
                
                // Display the Alert View
                [alert show];
                
                
            }
            else{
                
                NSMutableDictionary *assignmentToAdd = [[NSMutableDictionary alloc]init];
                
                
                
                int zero = 0;
                NSNumber *grade = [NSNumber numberWithInt:zero];
                
                
                NSString *cg = @"Grade For Work";
                NSString *wk = @"Total Percentage";
               // NSString *t = @"Total";
                
                NSString *stringToAdd = controller.percentageText.text;
                
                
              
                [assignmentToAdd setValue:stringToAdd forKey:wk];
                
                NSString *nameToAdd = controller.nameText.text;

//                NSMutableArray *totalStuff = [[NSMutableArray alloc]init];
                
                
                //NSMutableDictionary *classWork = [[NSMutableDictionary alloc]init];
                
                
                [assignmentToAdd setValue:grade forKey:cg];
                
                //[assignmentToAdd setValue:totalStuff forKey:t];
                
                
                [self.workDict setValue:assignmentToAdd forKey:nameToAdd];
        
                self.assignmentNames = [[self.workDict allKeys]sortedArrayUsingSelector:@selector(compare:)];
                
                
                self.courseNames = [[self.courseList allKeys]sortedArrayUsingSelector:@selector(compare:)];
                
                [self.tableView reloadData];
                [self.navigationController popViewControllerAnimated:YES];
                
            }
        }
    }
  
    /*
     Pop the current view controller AddCityViewController from the stack
     and show the next view controller in the stack, which is ViewController.
     */
    
    
}
// This is the method invoked when the user taps the Delete button in the Edit mode
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSUInteger sectionNumber = [indexPath section];
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {  // Handle the Delete action
        
        NSString *nameOfAssignmentToDelete = [self.assignmentNames objectAtIndex:indexPath.section];
        
        [self.workDict removeObjectForKey:nameOfAssignmentToDelete];
        
        self.assignmentNames = [[self.workDict allKeys]sortedArrayUsingSelector:@selector(compare:)];

        
        
        // Reload the rows and sections of the Table View countryCityTableView
        [self.tableView reloadData];
    }
}


@end
