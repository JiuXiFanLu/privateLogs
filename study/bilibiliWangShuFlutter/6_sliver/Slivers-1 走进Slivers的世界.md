```dart
body:CustomScrollView(
    slivers:[
        SliverToBoxAdapter(
            child:FlutterLogo(size:100),
        ),
        SliverToBoxAdapter(
            child:FlutterLogo(size:100),
        ),
        SliverGrid(
            delegate:SliverChildBuilderDelegate((context,index){
                return Container(
                    height:200,
                    color:Colors.primaries[index % 18],
                );
            },childCount:23),
            gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:4,
            ),
        ),
        SliverList(
            delegate:SliverChildBuilderDelegate((context,index){
                return Container(
                    height:200,
                    color:Colors.primaries[index % Colors.primaries.length],
                );
            }),
        ),
    ],
)
```

sliver要当成另一个世界，和常用的组件（flutterlogo、container等等）是不同的，从普通的世界进入sliver的世界需要经过视窗的桥梁（一般用CustomScrollView）

在sliver的世界只能写sliver，不能用普通的组件，sliver组件都是由sliver开头，有很多。如果要用普通的weight，一两个就用SliverToBoxAdapter，多了就用SliverGrid或者SliverList。
