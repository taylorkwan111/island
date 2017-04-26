//
//  forgetPasswordViewController.m
//  island2
//
//  Created by 邓唯 on 2017/4/26.
//  Copyright © 2017年 陈松. All rights reserved.
//

#import "forgetPasswordViewController.h"
#import "AFNetworking.h"

@interface forgetPasswordViewController ()
@property (weak, nonatomic) IBOutlet UITextField *forgetPasswordPhoneNum;
@property (weak, nonatomic) IBOutlet UITextField *forgetPasswordRescode;

@property (weak, nonatomic) IBOutlet UITextField *NewPassword;
- (IBAction)changPasswordBtn:(id)sender;
- (IBAction)sendCode;
- (IBAction)close;

@end

@implementation forgetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
- (IBAction)sendCode {
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    params[@"PhoneNum"]=self.forgetPasswordPhoneNum.text;
    
    [[AFHTTPSessionManager manager] POST:@"http://bxw2442250223.my3w.com/BackStage/GetVerifyCode" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        NSDictionary *dict =responseObject;
        NSString *errMsg = [dict valueForKey:@"ErrMsg"];
        NSLog(@"%@",errMsg);
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:errMsg delegate:self cancelButtonTitle:nil otherButtonTitles:@"确认", nil];
        [alert show];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
}

- (IBAction)close {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)changPasswordBtn:(id)sender
{
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    params[@"PhoneNum"]=self.forgetPasswordPhoneNum.text;
    params[@"Code"]=self.forgetPasswordRescode.text;
    params[@"PassWord"]=self.NewPassword.text;
    [[AFHTTPSessionManager manager] POST:@"http://bxw2442250223.my3w.com/BackStage/UpdatePwdResult" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        NSDictionary *dict =responseObject;
        NSString *errMsg = [dict valueForKey:@"ErrMsg"];
        NSLog(@"%@",errMsg);
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:errMsg delegate:self cancelButtonTitle:nil otherButtonTitles:@"确认", nil];
        [alert show];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];

}


@end
