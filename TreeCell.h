//
//  TreeCell.h
//  island2
//
//  Created by dw on 2017/1/29.
//  Copyright © 2017年 陈松. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TreeCell : UITableViewCell
@property(nonatomic,strong) UITextView *contentDone;
@property(nonatomic,strong)UIButton *btn;

-(void)setContentDone:(UITextView *)text1;
                 // btn:(UIButton*)btn;
@end
