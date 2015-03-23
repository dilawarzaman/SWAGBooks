//
//  textView.h
//  SWAGBooks
//
//  Created by Dilawar Zaman on 3/23/15.
//  Copyright (c) 2015 Dilawar Zaman. All rights reserved.
//

#import "ViewController.h"

@interface textView : UIViewController{
}


@property (strong, nonatomic) IBOutlet UITextView *titleDetailView;
@property (strong, nonatomic) IBOutlet UITextView *authorDetailView;
@property (strong, nonatomic) IBOutlet UITextView *publisherDetailView;
@property (strong, nonatomic) IBOutlet UITextView *categoryDetailView;
@property (strong, nonatomic) IBOutlet UITextView *lastCheckedOutDetailView;


@property (strong, nonatomic) NSString *titl;
@property (strong, nonatomic) NSString *auth;
@property (strong, nonatomic) NSString *publ;
@property (strong, nonatomic) NSString *categ;
@property (strong, nonatomic) NSString *last;
@property (strong, nonatomic) NSString *lastTime;

@property (nonatomic) NSInteger currID;

- (IBAction)checkOut:(id)sender;
- (IBAction)backButton:(id)sender;

@end
