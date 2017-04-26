//
//  MineViewController.h
//  island2
//
//  Created by 陈松 on 2016/12/29.
//  Copyright © 2016年 陈松. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginRegisterViewController.h"

@interface MineViewController : UIViewController

@property (nonatomic,weak) UIButton *headImageButton;
@property (nonatomic,weak) UIView *MineView;
@property (nonatomic,strong) UITextView *signatureTextView;
@property (nonatomic,weak) UITableView *tableView;

@property (nonatomic,copy) NSString *signature;
@property (nonatomic,copy) NSString *userName;


@end
