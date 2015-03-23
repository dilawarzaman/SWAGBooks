//
//  ViewController.h
//  SWAGBooks
//
//  Created by Dilawar Zaman on 3/22/15.
//  Copyright (c) 2015 Dilawar Zaman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    NSMutableArray *authors;
    NSMutableArray *categories;
    NSMutableArray *ids;
    NSMutableArray *lastCheckOuts;
    NSMutableArray *lastCheckedOutBys;
    NSMutableArray *publishers;
    NSMutableArray *titles;
    NSMutableArray *urls;

    NSUInteger count;
}

@property (strong, nonatomic) IBOutlet UITableView *table;


@end

