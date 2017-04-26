//
//  MyHomeViewController.h
//  island2
//
//  Created by 陈松 on 2016/12/31.
//  Copyright © 2016年 陈松. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyHomeViewController : UIViewController

@property (nonatomic,strong) NSString *userName;
@property (nonatomic,strong) NSString *signature;
@property (nonatomic,copy) NSString *backgroundImageURL;
@property (nonatomic,copy) NSString *headImageURL;

@property (nonatomic,weak) UIImageView *headImageView;
@property (nonatomic,weak) UITextView *signatureTextView;



@end
