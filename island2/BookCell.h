//
//  BookCell.h
//  island2
//
//  Created by 陈松 on 2016/12/28.
//  Copyright © 2016年 陈松. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BookCell;
@protocol BookBtnClickDelegate <NSObject>

-(void)BookCell:(BookCell*)bookcell didClickBookBtnTag:(NSInteger)BookBtnTag currentBookBtn:(UIButton*)sender;

@end

@interface BookCell : UITableViewCell
 //cell标题
@property(nonatomic,strong)UILabel * classLab;
@property(nonatomic,strong)NSArray * classR;
@property(nonatomic,strong)UIScrollView * scroll;
@property(nonatomic,weak)id<BookBtnClickDelegate> delegate;
-(void)countOfButton:(NSInteger)count;
@end
