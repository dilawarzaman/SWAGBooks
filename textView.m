//
//  textView.m
//  SWAGBooks
//
//  Created by Dilawar Zaman on 3/23/15.
//  Copyright (c) 2015 Dilawar Zaman. All rights reserved.
//

#import "textView.h"
#import "AFNetworking.h"

@interface textView ()

@end

@implementation textView
@synthesize currID;
@synthesize titleDetailView;
@synthesize authorDetailView;
@synthesize publisherDetailView;
@synthesize categoryDetailView;
@synthesize lastCheckedOutDetailView;

@synthesize titl;
@synthesize auth;
@synthesize publ;
@synthesize categ;
@synthesize last;
@synthesize lastTime;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (titl != (NSString *)[NSNull null])
        titleDetailView.text = titl;
    authorDetailView.text = auth;
    if (publ != (NSString *)[NSNull null])
        publisherDetailView.text = publ;
    if (categ != (NSString *)[NSNull null])
        categoryDetailView.text = categ;
    if (last != (NSString *)[NSNull null] && lastTime != (NSString *)[NSNull null])
        lastCheckedOutDetailView.text = [NSString stringWithFormat:@"%@ @ %@" , last, lastTime];

    titleDetailView.font = [UIFont fontWithName:@"Helvetica Neue" size:18.0];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)checkOut:(id)sender {
    NSString *url = [NSString stringWithFormat:@"http://prolific-interview.herokuapp.com/550850ceb89fdc0009273afa/books/%lu" , (unsigned long)currID ];
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary * params = [[NSMutableDictionary alloc] init];
    params = @{@"lastCheckedOutBy":@"Dilawar Zaman"};
    
    [manager PUT:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)backButton:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];

}
@end
