//
//  MovieDetailViewController.m
//  island2
//
//  Created by 陈松 on 2016/12/28.
//  Copyright © 2016年 陈松. All rights reserved.
//

#import "MovieDetailViewController.h"

@interface MovieDetailViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@end

@implementation MovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RANDOMCOLOR;
    self.title = [NSString stringWithFormat:@"当前分类为%@id是%zd",_classname,_index];
}

-(void)setIndex:(NSInteger)index{
    _index = index;
}
-(void)setClassname:(NSString *)classname{
    _classname = classname;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
