//
//  LoginRegisterViewController.m
//  island2
//
//  Created by dw on 2017/3/21.
//  Copyright © 2017年 陈松. All rights reserved.
//

#import "LoginRegisterViewController.h"
#import "AFNetworking.h"

@interface LoginRegisterViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftMargin;
@property (weak, nonatomic) IBOutlet UITextField *loginPhoneNumber;

@property (weak, nonatomic) IBOutlet UITextField *loginPassword;
- (IBAction)loginBtn:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *registerPhoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *receiveCode;
@property (weak, nonatomic) IBOutlet UITextField *registerPassword;
- (IBAction)sendCode:(UIButton *)sender;

@end

@implementation LoginRegisterViewController
- (IBAction)showLoginOrRegister:(UIButton *)button {
    [self.view endEditing:YES];
    if (self.leftMargin.constant==0)
    {
        self.leftMargin.constant=-self.view.frame.size.width;
//        button.selected=YES;
        [button setTitle:@"已有账号?" forState:UIControlStateNormal];
    }
    else
    {
        self.leftMargin.constant=0;
//        button.selected=NO;
        [button setTitle:@"注册账号?" forState:UIControlStateNormal];
    }
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    NSString *registerUserName=self.registerUserName.text;
//    NSString *registerPassword=self.registerPassword.text;
//    NSString *loginUserName=self.loginUserName.text;
//    NSString *loginPassword=self.loginPassword.text;
    
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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
- (IBAction)loginBtn:(UIButton *)sender {

    
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    params[@"UserName"]=self.loginPhoneNumber.text;
    params[@"PassWord"]=self.loginPassword.text;
    [[AFHTTPSessionManager manager] POST:@"http://bxw2442250223.my3w.com/BackStage/LoginResult" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];

}
- (IBAction)registerBtn:(UIButton *)sender {
    
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    params[@"UserName"]=self.registerPhoneNumber.text;
    params[@"ResCode"]=self.receiveCode.text;
    params[@"PassWord"]=self.registerPassword.text;
    [[AFHTTPSessionManager manager] POST:@"http://bxw2442250223.my3w.com/BackStage/RegisterResult" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];

}


- (IBAction)sendCode:(UIButton *)sender {
    
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    params[@"UserName"]=self.registerPhoneNumber.text;
    [[AFHTTPSessionManager manager] POST:@"http://bxw2442250223.my3w.com/BackStage/GetRegisterCode" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

@end
