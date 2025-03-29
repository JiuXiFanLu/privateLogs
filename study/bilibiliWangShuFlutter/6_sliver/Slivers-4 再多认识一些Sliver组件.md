```dart
body:CustomScrollView(
    slivers:[
        SliverAppBar(
            title: Text("Flutter Demo Home Page")
        )，// SliverAppBar
        SliverToBoxAdapter(
            child: FlutterLogo(size: 100)
        )，// SliverToBoxAdapter
        SliverGrid(
            delegate: sliverchildListDelegate(
                [ Icon(Icons.animation),
                  Icon(Icons.translate)
                  Icon(Icons.save),
                  Icon(Icons.person),
                ],
            )，//SliverchildListDelegate
            gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent:180),//SliverGridDelegateWithMaxCrossAxisExtent
        )，// SliverGrid
    ],
),    //CustomScrollView
```

这期视频我们快速地介绍大量Sliver组件，以加深大家对Sliver组件的理解并扩充知识储备。

之后我们会介绍SliverFillRemaining和SliverLayoutBuilder这2枚组件。

SliverFillRemaining    当前视窗的剩余空间

SliverLayoutBuilder        

用于构建一个可以根据剩余空间大小动态调整布局的Sliver（一种可以滚动的组件）

```dart
SliverLayoutBuilder(
    builder:(Buildcontext context,Sliverconstraints constraints){
        print(constraints);
        return SliverToBoxAdapter();
    }
),
```

另外，这期视频的后半部分我们还会简单介绍SliverConstraints，为稍有基础的开发者提供一些进阶之道。
