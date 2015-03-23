//
//  addBook.m
//  SWAGBooks
//
//  Created by Dilawar Zaman on 3/23/15.
//  Copyright (c) 2015 Dilawar Zaman. All rights reserved.
//

#import "addBook.h"
#import "AFNetworking.h"
@interface addBook ()

@end

@implementation addBook
@synthesize title;
@synthesize author;
@synthesize publisher;
@synthesize categories1;




- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)submit:(id)sender {
    NSString *url = [NSString stringWithFormat:@"http://prolific-interview.herokuapp.com/550850ceb89fdc0009273afa/books/"];
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary * params = [[NSMutableDictionary alloc] init];
    params = @{@"author":author.text , @"title":title.text , @"publisher":publisher.text , @"categories":categories1.text};
    
    [manager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)done:(id)sender {
    if ([author.text isEqual: @""] && [title.text isEqual: @""] && [publisher.text isEqual: @""] && [categories1.text isEqual: @""] ) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Are you sure?" message:@"Unsaved changes will be discarded?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
        // optional - add more buttons:
        [alert addButtonWithTitle:@"Yes"];
        [alert show];
    }
}
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
