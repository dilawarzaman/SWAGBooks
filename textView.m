//
//  textView.m
//  SWAGBooks
//
//  Created by Dilawar Zaman on 3/23/15.
//  Copyright (c) 2015 Dilawar Zaman. All rights reserved.
//

#import "textView.h"

@interface textView ()

@end

@implementation textView
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
