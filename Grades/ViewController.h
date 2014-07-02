//
//  ViewController.h
//  Grades
//
//  Created by CS3714 on 12/15/12.
//  Copyright (c) 2012 Chris Jones. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "AddClassViewController.h"
#import "LookAtClassViewController.h"


@interface ViewController : UITableViewController<UITableViewDataSource, UITableViewDelegate, AddClassViewControllerDelegate>


//The main dictionary containing all the songs by various artists
@property (strong, nonatomic) NSMutableDictionary *courseList;

//An array containing the list of courses
@property (strong, nonatomic) NSArray *courseNames;

//The total course grade
@property (strong, nonatomic) NSNumber *courseGrade;

//The main course table view
@property (strong, nonatomic) IBOutlet UITableView *tableView;

//The work dictionary
@property (strong, nonatomic) NSMutableDictionary *workDict;

-(void)addClass:(id)sender;

@end
