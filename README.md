AADynamicLabel
==============

A subclass of `UILabel` which use `NSMutableAttributedString` to create label with multiple fonts.

## Demo

Create a AADynamicLabel is as simple as use a normal `UILabel`.

```objc
AADynamicLabel *label = [AADynamicLabel new];
[label addText:@"Beginning of my text " withFont:[UIFont systemFontOfSize:12]];
[label addText:@"important word bolded, " withFont:[UIFont boldSystemFontOfSize:12]];
[label addText:@"end of my text which use the default font of my label "];
[label addText:@"with red point in the end." color:[UIColor redColor]];
[self.view addSubview:label];
```

![AADynamicLabel example preview](http://zupimages.net/up/14/04/whhc.png)
