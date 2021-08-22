# ClangTraceLaurchMethods

[![CI Status](https://img.shields.io/travis/葛高召/ClangTraceLaurchMethods.svg?style=flat)](https://travis-ci.org/葛高召/ClangTraceLaurchMethods)
[![Version](https://img.shields.io/cocoapods/v/ClangTraceLaurchMethods.svg?style=flat)](https://cocoapods.org/pods/ClangTraceLaurchMethods)
[![License](https://img.shields.io/cocoapods/l/ClangTraceLaurchMethods.svg?style=flat)](https://cocoapods.org/pods/ClangTraceLaurchMethods)
[![Platform](https://img.shields.io/cocoapods/p/ClangTraceLaurchMethods.svg?style=flat)](https://cocoapods.org/pods/ClangTraceLaurchMethods)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

ClangTraceLaurchMethods is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ClangTraceLaurchMethods'
```

## Author

葛高召, gegaozhao@xdfzx.com

## License

ClangTraceLaurchMethods is available under the MIT license. See the LICENSE file for more info.

背景：
我们可以通过二进制重拍优化启动时间，减少page-fault次数，优化的方向时减少page-in操作，需要将启动相关的系统函数和应用函数进行放入一个page里面，正常一个page时可以存储所有的启动相关的函数的，然后将这些启动函数的函数签名写入.order文件供xcode 的链接器ld消费，那么我们第一步需要拿到启动相关的函数？具体步骤如下：


启动相关的函数：
第一步：配置apple clang custom compiles 的配置 在other-c-flag里增加-fsanitize-coverage=func,trace-pc-guard配置，系统会给每一个插入一个  __sanitizer_cov_trace_pc_guard 函数的hook,需要外部自己实现，拦截所有的函数信息

第二步：将获取的函数信息存在一个列表里，等待启动完毕，写入.order文件存入我们沙盒下任意目录，因为考虑到page的准确性，我们可以多运行几遍
，拿到最准确的启动函数信息

第三步：xcode ->windows->device and similor device -> 下载对应的包信息取出对应的order文件，拷贝到我们的目录下


消费order文件：
第一步：xcode-build-setting-linking 设置order-file的path为.order文件的路径即可

第二步：关掉我们获取启动函数的所有配置和注释相关的代码，这时再去command + r


优化成果检测：
第一种：system trace 看下page -falut次数，自己google看下
第二种：可以通过fishhook看mian函数之后优化前后的时间消耗








