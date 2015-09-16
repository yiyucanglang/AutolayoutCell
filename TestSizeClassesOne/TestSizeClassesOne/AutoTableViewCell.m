//
//  AutoTableViewCell.m
//  TestSizeClassesOne
//
//  Created by zhangxiaohu on 14-10-14.
//  Copyright (c) 2014年 XR. All rights reserved.
//

#import "AutoTableViewCell.h"

@implementation AutoTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)loadImageUrl:(NSString*)url
{
    [_logoImageView sd_setImageWithURL:[NSURL URLWithString:url]];
}

-(CGFloat)calculateCellHeightWithTitle:(NSString*)title descrip:(NSString*)discrip
{
    UIFont *font = _descriptionLabel.font;
//    float labelOneHeight = [self getStringHeight:title withFont:_titleLabel.font  labelWaith:[UIScreen mainScreen].bounds.size.width-20];
    float labelTwoHeight = [self getStringHeight:discrip withFont:_descriptionLabel.font  labelWaith:[UIScreen mainScreen].bounds.size.width-120];
    return labelTwoHeight+21.0f+16.0f;
}

-(float)getStringHeight:(NSString *)str withFont:(UIFont*)font labelWaith:(float)waith
{
    if (!([[[UIDevice currentDevice] systemVersion] floatValue]< 7.0f))
    {
        CGSize size = CGSizeMake(waith,10000);
        CGRect textRect = [str
                           boundingRectWithSize:size
                           options:NSStringDrawingUsesLineFragmentOrigin
                           attributes:@{NSFontAttributeName:font}
                           context:nil];
        return textRect.size.height;
    }
    else
    {
        CGSize maximumLabelSize = CGSizeMake(waith,10000);//1024-150=874/2=437  768-49=719-52=667  顶端和底端的空白部分高度共计52px
        CGSize expectedLabelSize = [str sizeWithFont:font constrainedToSize:maximumLabelSize
                                       lineBreakMode:NSLineBreakByWordWrapping];
        return expectedLabelSize.height;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(CGFloat)calulateHeightWithtTitle:(NSString*)title desrip:(NSString*)descrip
{
    //这里非常重要
    CGFloat preMaxWaith =[UIScreen mainScreen].bounds.size.width-108;

    [self.descriptionLabel setPreferredMaxLayoutWidth:preMaxWaith];
    [self.titleLabel setText:title];
    //这也很重要
    [self.descriptionLabel layoutIfNeeded];

    [self.descriptionLabel setText:descrip];

    [self.contentView layoutIfNeeded];
    CGSize size = [self.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height+1.0f;
}


@end
