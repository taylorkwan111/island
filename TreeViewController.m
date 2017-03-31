//
//  TreeViewController.m
//  island2
//
//  Created by dw on 2017/1/29.
//  Copyright © 2017年 陈松. All rights reserved.
//

#import "TreeViewController.h"
#import "TreeCell.h"
#import "Tree.h"
@interface TreeViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISwitch *ifornot;
@property (weak, nonatomic) IBOutlet UITextView *sendContent;
@property (nonatomic,copy)NSMutableArray * trees;
- (IBAction)send:(id)sender;

@end

@implementation TreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.trees=[[NSMutableArray alloc]init];
    //_trees=[NSArray arrayWithObjects:@"1111",@"2222",@"3333",@"4444",@"4444",@"4444",@"4444",nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.trees.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *str=@"cell";
    TreeCell* cell=[tableView dequeueReusableCellWithIdentifier:str];
    if(cell==nil)
    {
        cell=[[TreeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    //Tree *tree=[[Tree alloc]init];
    //cell.contentDone.text=_sendContent.text;
    //cell.contentDone.text=tree.content.text;
    //_trees=[NSArray arrayWithObjects:cell.contentDone.text];
    //Tree *tree=[[Tree alloc]init];
    //tree.content.text=_sendContent.text;
    //cell.self.trees.indexPath.row;
    //cell.contentDone.text=self.trees[indexPath.row]
    cell.contentDone.text=[self.trees objectAtIndex:indexPath.row];
    return  cell;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)send:(id)sender
{
    //NSLog(@"send already!!");
    Tree *tree=[[Tree alloc]init];
    tree.content.text=self.sendContent.text;
    [self.trees addObject:tree];
    [self.tableView reloadData];
    //tree.content.text=_sendContent.text;
}
@end
