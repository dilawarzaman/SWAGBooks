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

    // Do any additional setup after loading the view, typically from a nib.
    /*
     NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
     [request setURL:[NSURL URLWithString:@"http://prolific-interview.herokuapp.com/550850ceb89fdc0009273afa/"]];
     [request setHTTPMethod:@"GET"];
     
     
     NSURLResponse *requestResponse;
     NSData *requestHandler = [NSURLConnection sendSynchronousRequest:request returningResponse:&requestResponse error:nil];
     
     NSString *requestReply = [[NSString alloc] initWithBytes:[requestHandler bytes] length:[requestHandler length] encoding:NSASCIIStringEncoding];
     NSLog(@"requestReply: %@", requestReply);
     
     */
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:@"http://prolific-interview.herokuapp.com/550850ceb89fdc0009273afa/books" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //books = responseObject;
        //NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        //NSLog(@"JSON: %@", responseObject);
        
        
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
            
            NSString *category = res[@"categories"];
            if (category)
                [categories addObject:category];
             
            NSString *idN = res[@"id"];
            if (idN)
                [ids addObject:idN];
            
            NSString *lastCheckedOut = res[@"lastCheckedOut"];
            if (lastCheckedOut)
                [lastCheckOuts addObject:lastCheckedOut];
            
            NSString *lastCheckedOutBy = res[@"lastCheckedOutBy"];
            if (lastCheckedOutBy)
                [lastCheckedOutBys addObject:lastCheckedOutBy];
            
            NSString *publisher = res[@"publisher"];
            if (publisher)
                [publishers addObject:publisher];
            
            NSString *title = res[@"title"];
            if (title)
                [titles addObject:title];
             
            NSString *url = res[@"url"];
            if (url)
                [urls addObject:url];
            
        }

        //NSLog(@"%@", responseObject);
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
    NSLog(@"cell tapped");
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
