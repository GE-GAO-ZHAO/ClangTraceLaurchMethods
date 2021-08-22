//
//  GGZGeneralOrderFileTool.h
//  ClangTraceLaurchMethods
//
//  Created by 葛高召 on 2021/8/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GGZGeneralOrderFileTool : NSObject

/// 生成trace.order文件；一般我们要检测启动前执行的函数，
/// 所以放到首页的viewDidAppear中调用该函数
+ (void)generateOrderFile;

@end

NS_ASSUME_NONNULL_END
