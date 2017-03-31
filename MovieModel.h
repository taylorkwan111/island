//
//  MovieModel.h
//  island2
//
//  Created by dw on 2017/3/29.
//  Copyright © 2017年 陈松. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieModel : NSObject
/**名字**/
@property(nonatomic,copy) NSString *title;
/**图片**/
@property(nonatomic,copy)NSDictionary *images;
@end
