//
//  BookViewController.m
//  island2
//
//  Created by 陈松 on 2016/12/28.
//  Copyright © 2016年 陈松. All rights reserved.
//

#import "BookViewController.h"
#import "BookCell.h"
#import "BookDetailViewController.h"
#import "AFNetworking.h"



@interface BookViewController ()<UITableViewDelegate,UITableViewDataSource,BookBtnClickDelegate>

@property(nonatomic,strong)UITableView * tabV;
@property(nonatomic,strong)NSArray * classA;
@property(nonatomic,strong)NSMutableArray * classB;
/**请求参数**/
@property(nonatomic,strong)NSMutableDictionary *params;
@end

@implementation BookViewController
-(NSArray*)classA{
    
    if (!_classA) {
        _classA = [NSArray arrayWithObjects:@"新书特卖",@"新书推荐",@"最受欢迎",@"畅销书",@"杂志", nil];
    }
    return _classA;
}
-(NSArray*)classB{
    
    if (!_classB) {
        _classB = [[NSMutableArray alloc]initWithCapacity:0];
        for (int i=0; i<=4; i++) {
            [_classB addObject: [NSString stringWithFormat:@"%d",arc4random()%(5)+6]];
        //arc4random()%(5)+6随机取一个数，范围为[0,4]+6;
        }
    }
    return _classB;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
//    self.view.backgroundColor = [UIColor brownColor];
    [self creatBookTab];

}
-(void)creatBookTab{
    UITableView * tab = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, CScreenWidth, CScreenHeight-113.2) style:0];
    tab.delegate =self;
    tab.dataSource = self;
    tab.separatorColor = [UIColor blackColor];
    [self.view addSubview:tab];
    _tabV= tab;
    [tab setSeparatorColor:[UIColor blueColor]];
    
}
//分割线贯穿
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPat{
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return  self.classA.count;
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *rid=@"rid";
    BookCell *cell=[tableView dequeueReusableCellWithIdentifier:rid];
    if(cell==nil){
        cell=[[BookCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
    }
    cell.classLab.text =self.classA[indexPath.row];
    NSInteger count = [self.classB[indexPath.row]integerValue];
    [cell countOfButton:count];
    cell.delegate = self;
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}
-(void)BookCell:(BookCell *)bookcell didClickBookBtnTag:(NSInteger)BookBtnTag currentBookBtn:(UIButton *)sender{
    
    BookCell *cell = (BookCell *)[[[sender superview]superview]superview];
    NSIndexPath *indexPathAll = [_tabV indexPathForCell:cell];
    NSLog(@"当前点击的是%@行id为%zd",self.classA[indexPathAll.row],BookBtnTag-10);
    [UIView animateWithDuration:0.3 animations:^{
        
        sender.transform = CGAffineTransformMakeScale(1.1, 1.1);
        
    } completion:^(BOOL finished) {
        
        sender.transform = CGAffineTransformIdentity;
    }];
    UIActivityIndicatorView * indicat = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:0];
    indicat.center = self.view.center;
    [indicat startAnimating];
    [self.view addSubview: indicat];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        BookDetailViewController * detail = [[BookDetailViewController alloc]init];
        detail.classname =self.classA[indexPathAll.row];
        detail.index =BookBtnTag-10;
        [self.navigationController pushViewController:detail animated:YES];
        [indicat stopAnimating];
    });
    
    
    
}

@end
