//
//  ViewController.h
//  UITableViewSample
//
//  Created by  on 12-5-12.
//  Copyright (c) 2012年 瓦力. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,retain) NSArray* titles;
@property (nonatomic,retain) IBOutlet UITableView* _tableview;
@end
