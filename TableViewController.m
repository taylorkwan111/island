//
//  TableViewController.m
//  island2
//
//  Created by dw on 2017/3/29.
//  Copyright © 2017年 陈松. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewController.h"
#import "MovieModel.h"
#import "MJExtension.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"

@interface TableViewController ()
@property(nonatomic,strong)NSMutableArray *movies;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url=[NSURL URLWithString:@"http://api.douban.com/v2/movie/in_theaters"];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    NSData *responseData=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSDictionary * movieDic=[NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:nil];
//    NSLog(@"%@",movieDic);
    self.movies=[movieDic objectForKey:@"subjects"];
    [self.tableView reloadData];
    //NSLog(@"%@",self.movies.class);
//    NSString *title=[items objectForKey:@"titles"];
//    NSLog(@"%@",title);
//    params[@"title"]=@"标题";
//    params[@"images"]=@"images";
    //    params[@"c"]=@"subscribe";
//    [[AFHTTPSessionManager manager] GET:@"http://api.douban.com/v2/movie/in_theaters" parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
//        nil;
//    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *_Nullable responseObject)
//    {
//        
//        self.movies=[NSJSONSerialization dataWithJSONObject:responseObject options:kNilOptions error:nil];
//        [self.tableView reloadData];
//         NSLog(@"%@",self.movies);
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
//    {
//        nil;
//    }];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.movies.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID=@"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID ];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    NSDictionary *movie=self.movies[indexPath.row];
    cell.textLabel.text=[movie valueForKey:@"title"];
    cell.detailTextLabel.text=@"3435";
    NSDictionary *string=[movie valueForKey:@"images"];
    //NSDictionary *images=[string valueForKey:@"images"];
    NSString *string22 =[string objectForKey:@"small"];
    //NSLog(@"%@",string22);
   // NSString *string=[NSString stringWithFormat:@"%@",[movie valueForKey:@"images"]];
   // UIImage *image=[UIImage imageNamed:string22]; 
    //NSLog(@"%@",cell.imageView.image);
    

    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
