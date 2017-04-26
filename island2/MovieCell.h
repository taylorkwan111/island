//
//  MovieCell.h
//  island2
//
//  Created by 陈松 on 2016/12/28.
//  Copyright © 2016年 陈松. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MovieCell;
@protocol MovieBtnClickDelegate <NSObject>

-(void)MovieCell:(MovieCell*)Moviecell didClickMovieBtnTag:(NSInteger)MovieBtnTag currentMovieBtn:(UIButton*)sender;

@end

@interface MovieCell : UITableViewCell
 //cell标题
@property(nonatomic,strong)UILabel * classLab;
@property(nonatomic,strong)NSArray * classR;
/*
 *书名字
 */
@property (nonatomic,strong) NSString *bookname;
@property (nonatomic,strong) NSArray *array;
/*
 *图片
 */
@property (nonatomic,strong) NSString *bookimage;

@property(nonatomic,strong)UIScrollView * scroll;
@property(nonatomic,weak)id<MovieBtnClickDelegate> delegate;
-(void)countOfButton:(NSInteger)count andBookName:(NSArray *)bookname;
@end
