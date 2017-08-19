#RTL适配
基于Masonry基础上调整部分属性，无痛适配

----

##接入

部分文件可能后续还会修改，暂时不作为一个完整的库封装。直接拖动放入项目中。

##开启

* 默认不开启
* 全局引入 `GFSRTL.h`
	
	```Objective-C
	[[RTLManager appearance]setRTL:YES];
	```
	
##使用布局


* 特殊部分： Left 与 Right 布局时注意使用本库中的属性 `mas_rightRTL` `mas_leftRTL` `offset_RTL`

 ```
[label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label.mas_rightRTL).offset_RTL(10);
        make.top.equalTo(self.view).offset(50);
        make.height.equalTo(@30);
        make.width.equalTo(@120);
    }];
```
* 其余部分 与 正常使用完全相同。