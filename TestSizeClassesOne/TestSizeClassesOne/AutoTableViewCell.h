//
//  AutoTableViewCell.h
//  TestSizeClassesOne
//
//  Created by zhangxiaohu on 14-10-14.
//  Copyright (c) 2014年 XR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIImageView+WebCache.h>

@interface AutoTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

-(CGFloat)calculateCellHeightWithTitle:(NSString*)title descrip:(NSString*)discrip;
-(void)loadImageUrl:(NSString*)url;

-(CGFloat)calulateHeightWithtTitle:(NSString*)title desrip:(NSString*)descrip;
@end
