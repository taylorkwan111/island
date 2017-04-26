//
//  MovieCell.m
//  island2
//
//  Created by 陈松 on 2016/12/28.
//  Copyright © 2016年 陈松. All rights reserved.
//

#import "MovieCell.h"

@interface MovieCell()
@property(nonatomic,copy)NSString *name;
@end

@implementation MovieCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self  =  [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //self.backgroundColor = [UIColor greenColor];
        [self UIConfigure];
    }
    
    return  self;
    
}
-(void)countOfButton:(NSInteger)count andBookName:(NSMutableArray *)bookname{
    for (int i=0; i<count; i++) {
        UIButton *MovieBtn = [[UIButton alloc]init];
        MovieBtn.backgroundColor = RANDOMCOLOR;
        MovieBtn.frame = CGRectMake(10+i*100, 10, 90, 125);
        _scroll.contentSize = CGSizeMake(count*100+100, 100);
        
        MovieBtn.tag = i+10;
        [MovieBtn addTarget:self action:@selector(btnCli:) forControlEvents:1<<6];
        [_scroll addSubview: MovieBtn];
        
        //书名
        
        UILabel *booklabel = [[UILabel alloc]initWithFrame:CGRectMake(10+i*100, 140, 90, 20)];
        booklabel.backgroundColor=[UIColor redColor];
//        booklabel.text=bookname[i+1];
        
        NSString *bookName = bookname[i];
        booklabel.text = bookName;
        [_scroll addSubview: booklabel];
    }
    
    
    
}
-(void)setBookName:(NSString *)bookname
{
     self.bookname=bookname;
}

-(void)UIConfigure{
    //cell标题
    UILabel *classLab = [[UILabel alloc]initWithFrame:CGRectMake(16, 10, 80, 16)];
    _classLab = classLab;
    classLab.font = [UIFont systemFontOfSize:19];
    [self.contentView addSubview: classLab];
    //ScrollView
    UIScrollView *scv = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 27,CScreenWidth, 165)];
    scv.showsHorizontalScrollIndicator = YES;
    scv.showsVerticalScrollIndicator = NO;
    //scv.backgroundColor = [UIColor blueColor];
    _scroll = scv;
    [self.contentView addSubview:scv];

}
-(void)setClassR:(NSArray *)classR{
    
    _classR = classR;
    
}
-(void)btnCli:(UIButton*)sender{
    
    if ([self.delegate respondsToSelector:@selector(MovieCell:didClickMovieBtnTag:currentMovieBtn:)]) {
        
        [self.delegate MovieCell:self didClickMovieBtnTag:sender.tag currentMovieBtn:sender];
    }
    
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    //    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    
}
@end
