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

    
    
    // Do any additional setup after loading the view.
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
