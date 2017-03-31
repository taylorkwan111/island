//
//  TreeCell.m
//  island2
//
//  Created by dw on 2017/1/29.
//  Copyright © 2017年 陈松. All rights reserved.
//

#import "TreeCell.h"
#import "Tree.h"

@implementation TreeCell

@synthesize contentDone;
@synthesize btn;
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        contentDone=[[UITextView alloc]initWithFrame:CGRectMake(2, 2, 200, 30)];
        contentDone.backgroundColor=[UIColor greenColor];
        [self.contentView addSubview:contentDone];
        btn=[[UIButton alloc]initWithFrame:CGRectMake(200, 5, 30, 30)];
        btn.backgroundColor=[UIColor redColor];
        [self.contentView addSubview:btn];
    }
    return self;
}
-(void)setContentDone:(UITextView *)text1
{
    //Tree *tree=[[Tree alloc]init];
    //text1.text=tree.content.text;
    
    contentDone.text=text1.text;
}
@end
