//
//  addBook.h
//  SWAGBooks
//
//  Created by Dilawar Zaman on 3/23/15.
//  Copyright (c) 2015 Dilawar Zaman. All rights reserved.
//

#import "ViewController.h"

@interface addBook : ViewController <UITextFieldDelegate,UIAlertViewDelegate>


@property (strong, nonatomic) IBOutlet UITextField *title;
@property (strong, nonatomic) IBOutlet UITextField *author;
@property (strong, nonatomic) IBOutlet UITextField *publisher;
@property (strong, nonatomic) IBOutlet UITextField *categories1;

- (IBAction)submit:(id)sender;
- (IBAction)done:(id)sender;

@end
