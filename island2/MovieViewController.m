//
//  MovieViewController.m
//  island2
//
//  Created by 陈松 on 2016/12/28.
//  Copyright © 2016年 陈松. All rights reserved.
//

#import "MovieViewController.h"
#import "MovieCell.h"
#import "MovieDetailViewController.h"
#import "AFNetworking.h"
#import "MJExtension.h"


@interface MovieViewController ()<UITableViewDelegate,UITableViewDataSource,MovieBtnClickDelegate>

@property(nonatomic,strong)UITableView * tabV;
@property(nonatomic,strong)NSArray *classA;
@property(nonatomic,strong)NSMutableArray *classB;
@property(nonatomic,strong)NSMutableArray * classC;

@property(nonatomic,strong)NSMutableArray *movieName1;
@property(nonatomic,strong)NSMutableArray *movieName2;
@property(nonatomic,strong)NSMutableArray *movieName3;
@property(nonatomic,strong)NSMutableArray *movieName4;
@property (nonatomic,strong)NSMutableArray *testarr;
@property(nonatomic,strong)NSString *movieName;
/**请求参数**/
@property(nonatomic,strong)NSMutableDictionary *params;
@end

@implementation MovieViewController
-(NSArray*)classA{
    
    if (!_classA) {
        _classA = [NSArray arrayWithObjects:@"正在热映",@"即将上映",@"排行榜",@"北美票房榜",nil];
    }
    return _classA;
}
-(NSArray*)classB{
    
    if (!_classB) {
        _classB = [[NSMutableArray alloc]initWithCapacity:0];
        for (int i=0; i<4; i++) {
                if (i==0) {
                    NSURL *url=[NSURL URLWithString:@"http://api.douban.com/v2/movie/in_theaters"];
                    NSURLRequest *request=[NSURLRequest requestWithURL:url];
                    NSData *responseData=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
                    NSDictionary *dict =[NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:nil];
                    NSArray *theatermovies=[dict valueForKey:@"subjects"];
                    [_classB addObject: [NSString stringWithFormat:@"%zd",theatermovies.count]];
                    NSLog(@"热映数量:%@",[NSString stringWithFormat:@"%zd",theatermovies.count]);
                }
                if (i==1)
                {
                        NSURL *url=[NSURL URLWithString:@"http://api.douban.com/v2/movie/coming_soon"];
                        NSURLRequest *request=[NSURLRequest requestWithURL:url];
                        NSData *responseData=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
                        NSDictionary *dict =[NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:nil];
                        NSArray *comingmovies=[dict valueForKey:@"subjects"];
                        [_classB addObject: [NSString stringWithFormat:@"%zd",comingmovies.count]];
                    NSLog(@"即将上映数量:%@",[NSString stringWithFormat:@"%zd",comingmovies.count]);
                    
                }
                if(i==2)
                {
                        NSURL *url=[NSURL URLWithString:@"http://api.douban.com/v2/movie/top250"];
                        NSURLRequest *request=[NSURLRequest requestWithURL:url];
                        NSData *responseData=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
                        NSDictionary *dict =[NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:nil];
                    NSDictionary *dic1 = [dict valueForKey:@"subjects"];
                        NSArray *top250movies=[dic1 valueForKey:@"subject"];
                        [_classB addObject: [NSString stringWithFormat:@"%zd",top250movies.count]];
                    NSLog(@"排行榜数量:%@",[NSString stringWithFormat:@"%zd",top250movies.count]);
                        
                }
                if(i==3)
                {
                        NSURL *url=[NSURL URLWithString:@"http://api.douban.com/v2/movie/us_box"];
                        NSURLRequest *request=[NSURLRequest requestWithURL:url];
                        NSData *responseData=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
                       NSDictionary *dict =[NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:nil];
                        NSArray *usmovies=[dict valueForKey:@"subjects"];
                        [_classB addObject: [NSString stringWithFormat:@"%zd",usmovies.count]];
                    NSLog(@"北美榜数量:%@",[NSString stringWithFormat:@"%zd",usmovies.count]);
                }
        }
    }
    return _classB;
}
-(NSArray*)classC{
    if (!_classC) {
        _classC = [[NSMutableArray alloc]initWithCapacity:0];
        for (int i=0; i<=4; i++) {
            if (i==0) {
                NSURL *url=[NSURL URLWithString:@"http://api.douban.com/v2/movie/in_theaters"];
                NSURLRequest *request=[NSURLRequest requestWithURL:url];
                NSData *responseData=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
                NSDictionary *dict =[NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:nil];
                NSDictionary *dict2=[dict valueForKey:@"subjects"];
                _movieName1 = [dict2 valueForKey:@"title"];
                [_classC addObject: [NSString stringWithFormat:@"%@",_movieName1]];
                NSLog(@"热映:%@",_movieName1);
            }
            if (i==1) {
                NSURL *url=[NSURL URLWithString:@"http://api.douban.com/v2/movie/coming_soon"];
                NSURLRequest *request=[NSURLRequest requestWithURL:url];
                NSData *responseData=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
                NSDictionary *dict =[NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:nil];
                NSDictionary *dict2=[dict valueForKey:@"subjects"];
                _movieName2 = [dict2 valueForKey:@"title"];
                [_classC addObject: [NSString stringWithFormat:@"%@",_movieName2]];
                NSLog(@"即将上映:%@",_movieName2);
            }
            if (i==2) {
                NSURL *url=[NSURL URLWithString:@"http://api.douban.com/v2/movie/top250"];
                NSURLRequest *request=[NSURLRequest requestWithURL:url];
                NSData *responseData=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
                NSDictionary *dict =[NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:nil];
                NSDictionary *dict2=[dict valueForKey:@"subjects"];
                _movieName3 = [dict2 valueForKey:@"title"];
                [_classC addObject: [NSString stringWithFormat:@"%@",_movieName3]];
                NSLog(@"排行榜:%@",_movieName3);
            }
            if (i==3) {
                NSURL *url=[NSURL URLWithString:@"http://api.douban.com/v2/movie/us_box"];
                NSURLRequest *request=[NSURLRequest requestWithURL:url];
                NSData *responseData=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
                NSDictionary *dict =[NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:nil];
                NSDictionary *dict2=[dict valueForKey:@"subjects"];
                NSDictionary *dict3=[dict2 valueForKey:@"subject"];
                _movieName4 = [dict3 valueForKey:@"title"];
                [_classC addObject: [NSString stringWithFormat:@"%@",_movieName4]];
                NSLog(@"北美:%@",_movieName4);
            }
        }
        _classC = [[NSMutableArray alloc]initWithObjects:_movieName1,_movieName2,_movieName3,_movieName4, nil];
        
        }
    return _classC;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self creatMovieTab];
    for (int i=0; i<=4; i++) {
        if (i==0) {
            NSURL *url=[NSURL URLWithString:@"http://api.douban.com/v2/movie/in_theaters"];
            NSURLRequest *request=[NSURLRequest requestWithURL:url];
            NSData *responseData=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
            NSDictionary *dict =[NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:nil];
            NSDictionary *dict2=[dict valueForKey:@"subjects"];
            _movieName1 = [dict2 valueForKey:@"title"];
        }
        if (i==1) {
            NSURL *url=[NSURL URLWithString:@"http://api.douban.com/v2/movie/coming_soon"];
            NSURLRequest *request=[NSURLRequest requestWithURL:url];
            NSData *responseData=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
            NSDictionary *dict =[NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:nil];
            NSDictionary *dict2=[dict valueForKey:@"subjects"];
            _movieName2 = [dict2 valueForKey:@"title"];
        }
        if (i==2) {
            NSURL *url=[NSURL URLWithString:@"http://api.douban.com/v2/movie/top250"];
            NSURLRequest *request=[NSURLRequest requestWithURL:url];
            NSData *responseData=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
            NSDictionary *dict =[NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:nil];
            NSDictionary *dict2=[dict valueForKey:@"subjects"];
            _movieName3 = [dict2 valueForKey:@"title"];
        }
        if (i==3) {
            NSURL *url=[NSURL URLWithString:@"http://api.douban.com/v2/movie/us_box"];
            NSURLRequest *request=[NSURLRequest requestWithURL:url];
            NSData *responseData=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
            NSDictionary *dict =[NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:nil];
            NSDictionary *dict2=[dict valueForKey:@"subjects"];
            NSDictionary *dict3=[dict2 valueForKey:@"subject"];
            _movieName4 = [dict3 valueForKey:@"title"];
        }
    }
    _classC = [[NSMutableArray alloc]initWithObjects:_movieName1,_movieName2,_movieName3,_movieName4, nil];

    NSLog(@"classC:%@",_classC[0][0]);
    
}

-(void)creatMovieTab{
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
    
    MovieCell *cell=[tableView dequeueReusableCellWithIdentifier:rid];
    if(cell==nil){
        cell=[[MovieCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
    }
    cell.classLab.text =self.classA[indexPath.row];
    NSInteger count = [self.classB[indexPath.row]integerValue];

    NSLog(@"%@",_classC[indexPath.row]);
    [cell countOfButton:count andBookName:_classC[indexPath.row]];
    cell.delegate = self;
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}
-(void)MovieCell:(MovieCell *)Moviecell didClickMovieBtnTag:(NSInteger)MovieBtnTag currentMovieBtn:(UIButton *)sender{
    
    MovieCell *cell = (MovieCell *)[[[sender superview]superview]superview];
    NSIndexPath *indexPathAll = [_tabV indexPathForCell:cell];
    NSLog(@"当前点击的是%@行id为%zd",self.classA[indexPathAll.row],MovieBtnTag-10);
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
        MovieDetailViewController * detail = [[MovieDetailViewController alloc]init];
        detail.classname =self.classA[indexPathAll.row];
        detail.index =MovieBtnTag-10;
        [self.navigationController pushViewController:detail animated:YES];
        [indicat stopAnimating];
    });
    
    
}

@end
