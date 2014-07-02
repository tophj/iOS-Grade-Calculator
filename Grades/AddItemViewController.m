//
//  AddItemViewController.m
//  Grades
//
//  Created by CS3714 on 12/16/12.
//  Copyright (c) 2012 Chris Jones. All rights reserved.
//

#import "AddItemViewController.h"

@interface AddItemViewController ()

@end

@implementation AddItemViewController

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
    
    // Instantiate a Save button to invoke the save: method when tapped
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc]
                                   initWithBarButtonSystemItem:UIBarButtonSystemItemSave
                                   target:self action:@selector(save:)];
    
    // Set up the Save custom button on the right of the navigation bar
    self.navigationItem.rightBarButtonItem = saveButton;
    
    
       [self.nameText becomeFirstResponder];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)save:(id)sender{
    // Inform the delegate that the user tapped the Save button
    [self.delegate addItemViewControllerDelegate:self didFinishWithSave:YES];
}
- (IBAction)keyboardDone:(id)sender
{
    [sender resignFirstResponder];  // Deactivate the keyboard
}

@end
