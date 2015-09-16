//
//  ViewController.h
//  TestSizeClassesOne
//
//  Created by zhangxiaohu on 14-10-14.
//  Copyright (c) 2014年 XR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *autoTable;

@end

