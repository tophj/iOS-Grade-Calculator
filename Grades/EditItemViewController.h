//
//  EditItemViewController.h
//  Grades
//
//  Created by Toph on 12/16/12.
//  Copyright (c) 2012 Chris Jones. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol EditItemViewControllerDelegate;
@interface EditItemViewController : UIViewController

//Name of the Item
@property (weak, nonatomic) IBOutlet UITextField *nameText;

//Course Weight of the Item
@property (weak, nonatomic) IBOutlet UITextField *weightText;

//Amount of Points earned
@property (weak, nonatomic) IBOutlet UITextField *earnedText;

//Total amount of points the item was worth overall
@property (weak, nonatomic) IBOutlet UITextField *totalText;

//The selectedItem array passed in
@property (strong, nonatomic) NSMutableArray *selectedItemArray;

//Name of the item to be edited
@property (strong, nonatomic) NSString *name;
@property (nonatomic, assign) id <EditItemViewControllerDelegate> delegate;

@end
@protocol EditItemViewControllerDelegate

- (void)editItemViewControllerDelegate:(EditItemViewController *)controller didFinishWithSave:(BOOL)save;

@end