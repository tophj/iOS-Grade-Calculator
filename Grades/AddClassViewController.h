//
//  AddClassViewController.h
//  Grades
//
//  Created by CS3714 on 12/15/12.
//  Copyright (c) 2012 Chris Jones. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol AddClassViewControllerDelegate;


@interface AddClassViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *classText;

@property (nonatomic, assign) id <AddClassViewControllerDelegate> delegate;

// The keyboardDone: method is invoked when the user taps Done on the keyboard
- (IBAction)keyboardDone:(id)sender;


- (void)save:(id)sender;



@end

@protocol AddClassViewControllerDelegate

- (void)addClassViewControllerDelegate:(AddClassViewController *)controller didFinishWithSave:(BOOL)save;

@end
