//
//  ViewController.m
//  TestSizeClassesOne
//
//  Created by zhangxiaohu on 14-10-14.
//  Copyright (c) 2014年 XR. All rights reserved.
//

#import "ViewController.h"
#import "AutoTableViewCell.h"

@interface ViewController ()
{
    NSMutableArray* imageArray;
    NSMutableArray* nameArray;
    NSMutableArray* descriptionArray;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _autoTable .rowHeight = UITableViewAutomaticDimension;
    
    // Do any additional setup after loading the view, typically from a nib.
//    array = [NSMutableArray arrayWithObjects:@"img5.imgtn.bdimg.com/it/u=4040080498,3072784853&fm=90&gp=0.jpg",@"img2.imgtn.bdimg.com/it/u=2384677404,2895132414&fm=21&gp=0.jpg",@"img2.imgtn.bdimg.com/it/u=262781505,2408318453&fm=21&gp=0.jpg", nil];
    
    nameArray = [NSMutableArray arrayWithObjects:@"蜗壳",@"AI",@"大詹皇",nil];
     imageArray = [NSMutableArray arrayWithObjects:@"u=4040080498,3072784853&fm=90&gp=0.jpg",@"u=2384677404,2895132414&fm=21&gp=0.jpg",@"u=262781505,2408318453&fm=21&gp=0.jpg", nil];
    descriptionArray = [NSMutableArray arrayWithObjects:@"蜗壳打球好潇洒，好飘逸，铁王之王",@"AI，史上最矮状元，无冕之王，crossover简直厉害，观赏性强，永远的MVP!!!!",@"最年轻的一万分先生，MVP，奥布莱恩杯，效率之王，天之骄子，全宇宙最强的球员没有之一，强突暴扣身体棒，发际线又高了，关键时刻又耸了，带领骑士夺冠吧，虽然看起来还没戏！！！！！！", nil];
    
//    [self.autoTable setNeedsUpdateConstraints];

    self.autoTable.dataSource =self;
    self.autoTable.delegate =self;

    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    AutoTableViewCell *cell = (AutoTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"autoCell"];
    [cell.titleLabel setText:nil];
    [cell.titleLabel setText:[nameArray objectAtIndex:indexPath.row]];
    //补上的几句，给用来显示的DetailLabel 设置最大布局宽度
    CGFloat preMaxWaith =[UIScreen mainScreen].bounds.size.width-108;
    [cell.descriptionLabel setPreferredMaxLayoutWidth:preMaxWaith];
    [cell.descriptionLabel layoutIfNeeded];

    [cell.descriptionLabel setText:nil];
    [cell.logoImageView setImage:[UIImage imageNamed:[imageArray objectAtIndex:indexPath.row]]];
    [cell.descriptionLabel setText:[descriptionArray objectAtIndex:indexPath.row]];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static AutoTableViewCell *cell = nil;
    static dispatch_once_t onceToken;
    //只会走一次
    dispatch_once(&onceToken, ^{
        cell = (AutoTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"autoCell"];
    });
    
    //calculate
    CGFloat height = [cell calulateHeightWithtTitle:[nameArray objectAtIndex:indexPath.row] desrip:[descriptionArray objectAtIndex:indexPath.row]];
    
    return height;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
