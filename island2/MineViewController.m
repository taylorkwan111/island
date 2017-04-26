//
//  MineViewController.m
//  island2
//
//  Created by 陈松 on 2016/12/29.
//  Copyright © 2016年 陈松. All rights reserved.
//

#import "MineViewController.h"
#import "MyHomeViewController.h"
#import "LoginRegisterViewController.h"

@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, copy) NSArray *tabArray1;
@property (nonatomic, copy) NSArray *tabArray2;
@property (nonatomic, copy) NSArray *tabArray3;
@end

@implementation MineViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    NSArray *tabArray1 = [[NSArray alloc]initWithObjects:@"相册", nil];
    _tabArray1 = tabArray1;
    NSArray *tabArray2 = [[NSArray alloc]initWithObjects:@"图书",@"电影",@"音乐", nil];
    _tabArray2 = tabArray2;
    NSArray *tabArray3 = [[NSArray alloc]initWithObjects:@"豆列", nil];
    _tabArray3 = tabArray3;
    
    _signature = @"I just took some molly,what else?";
    _userName = @"TYMA";
    [self createMineView];
    [self createTableView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createMineView
{
    //view
    UIView *mineView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CScreenWidth, 160)];
    mineView.backgroundColor = STRANGEBLUECOLOR;
    [self.view addSubview:mineView];
    //头像
    UIButton *headImageButton = [[UIButton alloc]initWithFrame:CGRectMake((mineView.layer.bounds.size.width)/10, (mineView.layer.bounds.size.height) / 8, 90, 90)];
    headImageButton.backgroundColor = [UIColor blackColor];
    headImageButton.layer.cornerRadius = headImageButton.layer.bounds.size.width / 2;//将头像button设成圆形
    [headImageButton setImage:[UIImage imageNamed:@"headImageTest.jpg"] forState:UIControlStateNormal];
    headImageButton.layer.masksToBounds = YES;
    [mineView addSubview:headImageButton];
    //昵称
    UILabel *namelabel = [[UILabel alloc]initWithFrame:CGRectMake((mineView.layer.bounds.size.width)/16 + 40 , mineView.layer.bounds.size.height - 40, CScreenWidth, 26)];
    //namelabel.backgroundColor = [UIColor grayColor];
    namelabel.text = _userName;
    [mineView addSubview:namelabel];
    //个人主页
    UILabel *homePagelabel = [[UILabel alloc]initWithFrame:CGRectMake((mineView.layer.bounds.size.width)/10 * 6, (mineView.layer.bounds.size.height) / 8, 200, 30)];
    homePagelabel.text = @"个人主页>";
    homePagelabel.textColor = [UIColor whiteColor];
    homePagelabel.font = [UIFont systemFontOfSize:25.0];
    homePagelabel.userInteractionEnabled = YES;
    UITapGestureRecognizer *HomePageTapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(HomePageClick)];
    [homePagelabel addGestureRecognizer:HomePageTapGestureRecognizer];
    [mineView addSubview:homePagelabel];
    //个性签名
    UITextView *signatureTextView = [[UITextView alloc]initWithFrame:CGRectMake((mineView.layer.bounds.size.width)/10 * 5, (mineView.layer.bounds.size.height) / 8 + 30, CScreenWidth - ((mineView.layer.bounds.size.width)/10 * 5) - 10 , CScreenHeight - ((mineView.layer.bounds.size.height) / 8 + 30))];
    signatureTextView.font = [UIFont systemFontOfSize:15];
    signatureTextView.editable = NO;
    signatureTextView.text = _signature;
    signatureTextView.backgroundColor =[UIColor clearColor];
    [mineView addSubview:signatureTextView];
}
-(void)HomePageClick
{
    NSLog(@"你点击了个人主页");
    MyHomeViewController *myHomeView = [[MyHomeViewController alloc]init];
    myHomeView.headImageURL = @"headImageTest.jpg";
    myHomeView.userName = _userName;
    myHomeView.signature = _signature;
    
    [self.navigationController pushViewController:myHomeView animated:NO];
    
}
-(void)createTableView
{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 160, CScreenWidth, CScreenHeight - 160-113.2) style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    ;
    [self.view addSubview:tableView];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 3;
        case 2:
            return 1;
        default:
            break;
    }
    return 0;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"Identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil)
    {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = _tabArray1[indexPath.row];
            break;
        case 1:
            cell.textLabel.text = _tabArray2[indexPath.row];
            break;
        case 2:
            cell.textLabel.text = _tabArray3[indexPath.row];
            break;
        default:
            cell.textLabel.text = @"unKnown";
    
    }
    //cell.textLabel.text = @"fff";
    return cell;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    LoginRegisterViewController *lg=[[LoginRegisterViewController alloc]init];
    [self.navigationController pushViewController:lg animated:YES];
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
