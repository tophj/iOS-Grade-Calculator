//
//  LookAtClassViewController.h
//  Grades
//
//  Created by CS3714 on 12/16/12.
//  Copyright (c) 2012 Chris Jones. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddAssignmentViewController.h"
#import "ViewController.h"
#import "LookAtAssignmentsViewController.h"

@interface LookAtClassViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, AddAssignmentViewControllerDelegate>
@property (strong, nonatomic) IBOutlet UILabel *courseLabel;
@property (strong, nonatomic) IBOutlet UILabel *gradeLabel;
@property (strong, nonatomic) IBOutlet UIImageView *gradeImage;

@property (strong, nonatomic) NSString *currentCourse;

//The main dictionary containing all the songs by various artists
@property (strong, nonatomic) NSMutableDictionary *courseList;

//An array containing the list of courses
@property (strong, nonatomic) NSArray *courseNames;

//An array containing the list of assignments
@property (strong, nonatomic) NSArray *assignmentNames;


//The total course grade
@property (strong, nonatomic) NSNumber *courseGrade;

//The current assignment
@property (strong, nonatomic) NSString *currentAssignment;

//The work dictionary
@property (strong, nonatomic) NSMutableDictionary *workDict;

//The main course table view
@property (strong, nonatomic) IBOutlet UITableView *tableView;

-(void)addAssignment:(id)sender;

@end
