//
//  ViewController.m
//  SWAGBooks
//
//  Created by Dilawar Zaman on 3/22/15.
//  Copyright (c) 2015 Dilawar Zaman. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "textView.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize table;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    authors = [[NSMutableArray alloc] init];
    categories = [[NSMutableArray alloc] init];
    ids = [[NSMutableArray alloc] init];
    lastCheckOuts = [[NSMutableArray alloc] init];
    lastCheckedOutBys = [[NSMutableArray alloc] init];
    publishers = [[NSMutableArray alloc] init];
    titles = [[NSMutableArray alloc] init];
    urls = [[NSMutableArray alloc] init];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:@"http://prolific-interview.herokuapp.com/550850ceb89fdc0009273afa/books" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString *responseString = [operation responseString];
        NSData *data= [responseString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error;
        NSArray* results = [NSJSONSerialization JSONObjectWithData:data
                                                           options:0
                                                             error:&error];
        for (int i=0; i<results.count; i++)
        {
            count = results.count;
            
            NSDictionary *res=[results objectAtIndex:i];
            NSString *author = res[@"author"];
            if (author)
                [authors addObject:author];
            else
                [authors addObject:@""];
            NSString *category = res[@"categories"];
            if (category)
                [categories addObject:category];
            else
                [categories addObject:@""];
            NSString *idN = res[@"id"];
            if (idN)
                [ids addObject:idN];
            else
                [ids addObject:@""];
            NSString *lastCheckedOut = res[@"lastCheckedOut"];
            if (lastCheckedOut)
                [lastCheckOuts addObject:lastCheckedOut];
            else
                [lastCheckOuts addObject:@""];
            NSString *lastCheckedOutBy = res[@"lastCheckedOutBy"];
            if (lastCheckedOutBy)
                [lastCheckedOutBys addObject:lastCheckedOutBy];
            else
                [lastCheckedOutBys addObject:@""];
            NSString *publisher = res[@"publisher"];
            if (publisher)
                [publishers addObject:publisher];
            else
                [publishers addObject:@""];
            NSString *title = res[@"title"];
            if (title)
                [titles addObject:title];
            else
                [titles addObject:@""];
            NSString *url = res[@"url"];
            if (url)
                [urls addObject:url];
            else
                [urls addObject:@""];
        }

        [table reloadData];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return count;    //count number of row from counting array hear cataGorry is An Array
}



- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:MyIdentifier];
    }
    
    
    cell.textLabel.text = [titles objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [authors objectAtIndex:indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    currPage = indexPath.row;
    [self performSegueWithIdentifier:@"detailView" sender:self];

        
}
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"detailView"]) {
        textView* userViewController = [segue destinationViewController];
        userViewController.titl = [titles objectAtIndex:currPage];
        userViewController.auth = [authors objectAtIndex:currPage];
        userViewController.publ = [publishers objectAtIndex:currPage];
        userViewController.categ = [categories objectAtIndex:currPage];
        userViewController.last = [lastCheckedOutBys objectAtIndex:currPage];
        userViewController.lastTime = [lastCheckOuts objectAtIndex:currPage];
        userViewController.currID = [[ids objectAtIndex:currPage] intValue];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
