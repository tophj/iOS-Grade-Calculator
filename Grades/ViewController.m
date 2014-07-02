//
//  ViewController.m
//  Grades
//
//  Created by CS3714 on 12/15/12.
//  Copyright (c) 2012 Chris Jones. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

NSString *current;

- (void)viewDidLoad
{
    // Obtain an object reference to the App Delegate object
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    
    //Initializes the songList to the one retrieved from memory by the appdelegate
    self.courseList = appDelegate.courseList;
    
    //Creates an array of all the artists.
    self.courseNames = [[self.courseList allKeys]sortedArrayUsingSelector:@selector(compare:)];
    
    // Set up the Edit system button on the left of the navigation bar
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    
    // Instantiate a Add button to invoke the add: method when tapped
    UIBarButtonItem *add = [[UIBarButtonItem alloc]
                                   initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                   target:self action:@selector(addClass:)];
    
    // Set up the Save custom button on the right of the navigation bar
    self.navigationItem.rightBarButtonItem = add;
    
    
    

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return self.courseList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    
    
    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger sectionNumber = [indexPath section];  // Identify the section number
    //NSUInteger rowNumber = [indexPath row]; //Identify the row number
    
    
    static NSString *CellIdentifier = @"MenuItemCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSString *currentCourse = [self.courseNames objectAtIndex:sectionNumber];
    

    
    
    NSDictionary *tempDict = [self.courseList objectForKey:currentCourse];
    
    NSArray *tempArray = [tempDict allValues];
    
    
    NSUInteger totalCourseGrade = [[tempArray objectAtIndex:0] intValue];
    
    
    
    cell.textLabel.text = currentCourse;
    
    //Sets the course icon depending on what the letter grade is
    if(totalCourseGrade == 11){
        cell.imageView.image = [UIImage imageNamed:@"F.png"];
    }
    if(totalCourseGrade == 10){
        cell.imageView.image = [UIImage imageNamed:@"D-.png"];
    }
    if(totalCourseGrade == 9){
        cell.imageView.image = [UIImage imageNamed:@"D.png"];
    }
    if(totalCourseGrade == 8){
        cell.imageView.image = [UIImage imageNamed:@"D+.png"];
    }
    if(totalCourseGrade == 7){
        cell.imageView.image = [UIImage imageNamed:@"C-.png"];
    }
    if(totalCourseGrade == 6){
        cell.imageView.image = [UIImage imageNamed:@"C.png"];
    }
    if(totalCourseGrade == 5){
        cell.imageView.image = [UIImage imageNamed:@"C+.png"];
    }
    if(totalCourseGrade == 4){
        cell.imageView.image = [UIImage imageNamed:@"B-.png"];
    }
    if(totalCourseGrade == 3){
        cell.imageView.image = [UIImage imageNamed:@"B.png"];
    }
    if(totalCourseGrade == 2){
        cell.imageView.image = [UIImage imageNamed:@"B+.png"];
    }
    if(totalCourseGrade == 1){
        cell.imageView.image = [UIImage imageNamed:@"A-.png"];
    }
    if(totalCourseGrade == 0){
        cell.imageView.image = [UIImage imageNamed:@"A.png"];
    }
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    NSString *currentCourse = [self.courseNames objectAtIndex:indexPath.section];
    
    current=currentCourse;
  
    [self performSegueWithIdentifier:@"lookAtClass" sender:self];
}

-(void)addClass:(id)sender{

    [self performSegueWithIdentifier:@"addClass" sender:self];
}


#pragma mark - AddClassViewController Protocol Method

/*
 This is the AddClassViewController delegate method we created. AddClassViewController informs
 the delegate RootViewController that the user tapped the Save button if the parameter is YES.
 */
- (void)addClassViewControllerDelegate:(AddClassViewController *)controller didFinishWithSave:(BOOL)save;
{
    
    if (save) {
        // Get the date entered by the user on the AddClassViewController
        NSString *name = controller.classText.text;
        
        if(name.length == 0){
            // Create the Alert View
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:@"Please enter in a class name"
                                                           delegate:self
                                                  cancelButtonTitle:@"Okay"
                                                  otherButtonTitles:nil];
            
            // Display the Alert View
            [alert show];
            
        
      
        }
        else{
            if ([self.courseNames containsObject:name]) {
                // Create the Alert View
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:@"Class already exists; please enter in a new class."
                                                           delegate:self
                                                  cancelButtonTitle:@"Okay"
                                                  otherButtonTitles:nil];
            
                // Display the Alert View
                [alert show];
            
            
            }
            else{
            
                NSMutableDictionary *classToAdd = [[NSMutableDictionary alloc]init];
                
                
                
                int zero = 0;
                NSNumber *grade = [NSNumber numberWithInt:zero];
              
                
                NSString *cg = @"Course Grade";
                NSString *wk = @"Work";
                
                NSMutableDictionary *classWork = [[NSMutableDictionary alloc]init];
                
                
                [classToAdd setValue:grade forKey:cg];
                [classToAdd setValue:classWork forKey:wk];
                
                
                [self.courseList setValue:classToAdd forKey:name];
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"addClass"]) {
        AddClassViewController *addClassViewController = [segue destinationViewController];
        
        
        addClassViewController.delegate = self;
        
    }
    if ([[segue identifier] isEqualToString:@"lookAtClass"]) {
        
        
        LookAtClassViewController *look = [segue destinationViewController];
        look.courseList = self.courseList;
        look.courseNames = self.courseNames;
        
        look.currentCourse = current;
        //look.delegate = self;
        
    }
}

// This is the method invoked when the user taps the Delete button in the Edit mode
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSUInteger sectionNumber = [indexPath section];
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {  // Handle the Delete action
        
        NSString *nameOfCourseToDelete = [self.courseNames objectAtIndex:indexPath.section];
        
        [self.courseList removeObjectForKey:nameOfCourseToDelete];
        self.courseNames = [[self.courseList allKeys]sortedArrayUsingSelector:@selector(compare:)];

  
        // Reload the rows and sections of the Table View countryCityTableView
        [self.tableView reloadData];
    }
}
// This is the method invoked when the user taps the detail accessory button
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{

    
    // Perform the segue named LookAtClass
    [self performSegueWithIdentifier:@"lookAtClass" sender:self];
}

@end
