//
//  LadyData.m
//  CommonUI
//
//  Created by 程 on 2022/10/24.
//

#import "LadyData.h"
#import <YYImage/YYAnimatedImageView.h>

@implementation LadyData

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

//+ (YYAnimatedImageView *)imageView{
//    YYAnimatedImageView * yyi = [YYAnimatedImageView new];
//    NSLog(@"\n\n\nself   %@\n__func__   %s\n_cmd   %@\n",
//         self,
//         __func__,
//         NSStringFromSelector(_cmd));
//    return yyi;
//}


+ (NSString *)imageNamed:(NSString *)name{
   
   NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"ChengBundle" ofType:@"bundle"];
   
   
   //    NSBundle *bundle = [NSBundle bundleWithPath: bundlePath];
   //    NSString *image_path = [bundle pathForResource:name ofType:@"png"];
   
   
   NSString *image_path = [bundlePath stringByAppendingPathComponent:name];;
   UIImage *image = [[UIImage alloc] initWithContentsOfFile:image_path];
   
   return image_path;
   
}
+ (id)dataWithImageName:(NSString *)imageName{
   
   return  [self imageNamed:imageName];
}

@end
