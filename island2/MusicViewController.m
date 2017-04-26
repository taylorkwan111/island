//
//  MusicViewController.m
//  island2
//
//  Created by 陈松 on 2016/12/28.
//  Copyright © 2016年 陈松. All rights reserved.
//

#import "MusicViewController.h"
#import "AFNetworking.h"
#import "SDWebImage/UIButton+WebCache.h"
#import "CS.h"



@interface MusicViewController ()
@property(nonatomic,strong) NSMutableArray *musics;
@property(nonatomic,assign)NSInteger count;

@end

@implementation MusicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor=STRANGEBLUECOLOR;
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    params[@"showapi_appid"]=@"35183";
    params[@"showapi_sign"]=@"1d292155c78849f6bdb5b274850eae6e";
    params[@"topid"]=@"5";
    [[AFHTTPSessionManager manager] POST:@"http://route.showapi.com/213-4" parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * responseObject) {
        
        NSDictionary *showapi=responseObject[@"showapi_res_body"];
        NSDictionary *pagebean=showapi[@"pagebean"];
        self.musics=pagebean[@"songlist"];
        NSInteger count=self.musics.count;
        self.count=count;
        [self createMusicScrollView];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error");
        
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)createMusicScrollView
{
    
    UIScrollView* musicScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, CScreenWidth, CScreenHeight)];
    musicScrollView.contentSize = CGSizeMake(CScreenWidth,CScreenHeight * self.count );
    //musicScrollView.backgroundColor = [UIColor colorWithRed:199.0/255.0 green:222.0/255.0 blue:241.0/255.0 alpha:1];
    //musicScrollView.backgroundColor = [UIColor blackColor];
    musicScrollView.backgroundColor = STRANGEBLUECOLOR;
    [self.view addSubview:musicScrollView];
    _musicScrollView = musicScrollView;
    [self createMusic];
}

-(void)createMusic
{

    for(int i = 0;i<self.count;i++)
    {
        
        //歌曲图片
        UIButton *musicButton =[[UIButton alloc]initWithFrame:CGRectMake(CScreenWidth/15 +(i%2)*190, 30+(i/2)*190,CScreenWidth/2 - 40, CScreenWidth/2 - 40)];
        musicButton.backgroundColor = RANDOMCOLOR;
        NSDictionary *item= self.musics[i];
        NSString * images=item[@"albumpic_big"];
        NSURL *urlimage=[NSURL URLWithString:images];
        //NSString *string=[NSString stringWithContentsOfURL:urlimage encoding:NSUTF8StringEncoding error:nil];
        NSString *songname=item[@"songname"];
        NSString *singername=item[@"singername"];
        
        
        //NSLog(@"%@",im
        [musicButton sd_setImageWithURL:urlimage forState:UIControlStateNormal];
        _musicButton = musicButton;
        //musicButton.layer.cornerRadius = 5;
        //透明带
        UIView *blackArea = [[UIView alloc]initWithFrame:CGRectMake(0, (musicButton.layer.bounds.size.height) / 5 * 4, musicButton.layer.bounds.size.width, (musicButton.layer.bounds.size.height)/5)];
        blackArea.backgroundColor = [UIColor blackColor];
        blackArea.alpha = 0.5;
        [musicButton addSubview:blackArea];
        [_musicScrollView addSubview:musicButton];
        //音乐名字
        UILabel *musicNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(3, 0, musicButton.layer.bounds.size.width, (musicButton.layer.bounds.size.height)/5/2)];
        //musicNameLabel.font = [UIFont systemFontOfSize:(musicButton.layer.bounds.size.height) / 5 / 5 * 4];
        musicNameLabel.font=[UIFont systemFontOfSize:10];
        musicNameLabel.textColor = [UIColor whiteColor];
        musicNameLabel.text = songname;
        musicNameLabel.alpha = 1;
        [blackArea addSubview:musicNameLabel];
        
        UILabel *singerNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(3,15, musicButton.layer.bounds.size.width, (musicButton.layer.bounds.size.height)/5/2)];
        singerNameLabel.font=[UIFont systemFontOfSize:14];
        singerNameLabel.textColor = [UIColor whiteColor];
        singerNameLabel.text = singername;
        singerNameLabel.alpha = 1;
        [blackArea addSubview:singerNameLabel];
        
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
