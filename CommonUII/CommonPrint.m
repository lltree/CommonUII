//
//  CommonPrint.m
//  CommonUI
//
//  Created by 程 on 2022/10/24.
//

#import "CommonPrint.h"

#ifdef DEBUG
#define CLog(FORMAT, ...) fprintf(stderr, "\n\n\nlog开始\n\n\n 文件名: %s\n 函数名: %s\n 行号: %zd\n \n 具体内容↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ \n\n\n    %s\n\n\n 具体内容↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑\n\n\nlog完毕 \n\n\n", [[[NSString stringWithUTF8String: __FILE__] lastPathComponent] UTF8String], [[NSString stringWithUTF8String: __FUNCTION__] UTF8String], __LINE__, [[NSString stringWithFormat: FORMAT, ## __VA_ARGS__] UTF8String]);
# define HanLog(fmt, ...) NSLog((@"文件名->%s\n" "函数名->%s\n" "行号->%d" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
# define HanLog(...);
# define CLog(...);
#endif

@implementation CommonPrint
- (void)    print{
    
    CLog(@"\n\n\nself   %@\n__func__   %s\n_cmd   %@\n",
         self,
         __func__,
         NSStringFromSelector(_cmd));
}

@end
