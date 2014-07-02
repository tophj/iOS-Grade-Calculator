//
//  EditItemViewController.m
//  Grades
//
//  Created by Toph on 12/16/12.
//  Copyright (c) 2012 Chris Jones. All rights reserved.
//

#import "EditItemViewController.h"

@interface EditItemViewController ()

@end

@implementation EditItemViewController

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
    
    self.nameText.text = self.name;
    self.title = self.name;
    self.weightText.text = [[self.selectedItemArray objectAtIndex:0]stringValue];
    self.earnedText.text = [[self.selectedItemArray objectAtIndex:1]stringValue];
    self.totalText.text = [[self.selectedItemArray objectAtIndex:2]stringValue];
    
    // Instantiate a Save button to invoke the save: method when tapped
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc]
                                   initWithBarButtonSystemItem:UIBarButtonSystemItemSave
                                   target:self action:@selector(save:)];
    
    // Set up the Save custom button on the right of the navigation bar
    self.navigationItem.rightBarButtonItem = saveButton;
    
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
    [self.delegate editItemViewControllerDelegate:self didFinishWithSave:YES];
}
@end
