//
//  MyHomeViewController.m
//  island2
//
//  Created by 陈松 on 2016/12/31.
//  Copyright © 2016年 陈松. All rights reserved.
//

#import "MyHomeViewController.h"

@interface MyHomeViewController ()

@end

@implementation MyHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _backgroundImageURL = @"golf-gti-mk1.jpg";

    
    
    [self createMyInformation];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)createMyInformation
{
    //头像
    UIImageView *headImageView = [[UIImageView alloc]initWithFrame:CGRectMake(CScreenWidth / 10 * 3, 100, CScreenWidth / 10 * 4, CScreenWidth / 10 * 4)];
    headImageView.layer.cornerRadius = headImageView.layer.bounds.size.width / 2;
    [headImageView setImage:[UIImage imageNamed:_headImageURL]];
    headImageView.layer.masksToBounds = YES;
    [self.view addSubview:headImageView];
    
    //背景图片
    UIImageView *backGroundImageView =[[UIImageView alloc]initWithFrame:self.view.bounds] ;
    backGroundImageView.image = [UIImage imageNamed:_backgroundImageURL];
    backGroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:backGroundImageView];
    [self.view sendSubviewToBack:backGroundImageView];
    
    //id
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CScreenWidth/2, 100 + CScreenWidth / 10 * 4, 200, 50)];
    //nameLabel.backgroundColor =STRANGEBLUECOLOR;
    nameLabel.center = CGPointMake(CScreenWidth/2, 130 + CScreenWidth / 10 * 4);
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.font = [UIFont systemFontOfSize:20];
    nameLabel.text = self.userName;
    nameLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:nameLabel];
    
    //个人签名
    UILabel *signLabel = [[UILabel alloc]initWithFrame:CGRectMake(CScreenWidth / 5, 20 + nameLabel.layer.bounds.size.height,CScreenWidth / 5 * 3, CScreenHeight / 4)];
    signLabel.numberOfLines = 4;
    signLabel.textAlignment = NSTextAlignmentCenter;
    signLabel.center = CGPointMake(CScreenWidth/2,180 + CScreenWidth / 10 * 4 );
    signLabel.text = self.signature;
    signLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:signLabel];
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
