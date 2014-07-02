//
//  AddItemViewController.h
//  Grades
//
//  Created by CS3714 on 12/16/12.
//  Copyright (c) 2012 Chris Jones. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol AddItemViewControllerDelegate;
@interface AddItemViewController : UIViewController


//Name of item to add
@property (strong, nonatomic) IBOutlet UITextField *nameText;

//Weight of item to add
@property (strong, nonatomic) IBOutlet UITextField *weightText;

//Amount of points earned of item
@property (strong, nonatomic) IBOutlet UITextField *earnedText;

//Total amount of points item was worth
@property (strong, nonatomic) IBOutlet UITextField *totalText;


// The keyboardDone: method is invoked when the user taps Done on the keyboard
- (IBAction)keyboardDone:(id)sender;
@property (nonatomic, assign) id <AddItemViewControllerDelegate> delegate;

- (void)save:(id)sender;


@end
@protocol AddItemViewControllerDelegate

- (void)addItemViewControllerDelegate:(AddItemViewController *)controller didFinishWithSave:(BOOL)save;

@end