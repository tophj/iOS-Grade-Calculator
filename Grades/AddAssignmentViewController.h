//
//  AddAssignmentViewController.h
//  Grades
//
//  Created by CS3714 on 12/16/12.
//  Copyright (c) 2012 Chris Jones. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"


@protocol AddAssignmentViewControllerDelegate;


@interface AddAssignmentViewController : UIViewController
- (IBAction)keyboardDone:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *nameText;
@property (strong, nonatomic) IBOutlet UITextField *percentageText;

//The delegate object
@property (nonatomic, assign) id <AddAssignmentViewControllerDelegate> delegate;

- (void)save:(id)sender;


@end
@protocol AddAssignmentViewControllerDelegate

- (void)addAssignmentViewControllerDelegate:(AddAssignmentViewController *)controller didFinishWithSave:(BOOL)save;

@end
