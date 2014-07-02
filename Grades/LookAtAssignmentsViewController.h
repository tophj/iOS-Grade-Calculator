//
//  LookAtAssignmentsViewController.h
//  Grades
//
//  Created by CS3714 on 12/16/12.
//  Copyright (c) 2012 Chris Jones. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddItemViewController.h"
#import "EditItemViewController.h"

@interface LookAtAssignmentsViewController : UIViewController <AddItemViewControllerDelegate,EditItemViewControllerDelegate, UITableViewDataSource, UITableViewDelegate>


@property (strong, nonatomic) IBOutlet UIImageView *pictureView;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

//The current assignment
@property (strong, nonatomic) NSString *currentAssignment;

//Current Item used to send downstream to editView
@property (strong, nonatomic) NSString *currentItem;

//The selected Item Array
@property (strong, nonatomic)NSMutableArray *selectedItemArray;

//Array for the current assignment
@property (strong, nonatomic) NSMutableArray *itemArray;

//Array for the selectedItem
@property (strong, nonatomic) NSMutableArray *currentItemArray;

//The work dictionary
@property (strong, nonatomic) NSMutableDictionary *workDict;

//The item dictionary
@property (strong, nonatomic) NSMutableDictionary *itemDict;

-(void)addItem:(id)sender;


@end
