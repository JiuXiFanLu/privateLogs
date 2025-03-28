# SliverAppBar导航条

参数：

floating:true        //一旦往回就显示

pinned:true.             //一直显示，靠下时是有阴影效果的

snap:true                 //一往下就显示  



```dart
stretch:true,        //需要让它生效
flexibleSpace: FlexibleSpaceBar(
    background: Flutteogo(),
    title: Text("FlexiblespaceBar Title"),
    stretchModes:[
        //拉拽时的效果，他们之间互不排斥
        StretchMode.ground,                //让背景模糊
        StretchMode.bckground,             //放大
        StretchModeStretchMode.fadeTitle,//让字消失
    ],

    collapseMode:CollapsMode.parallax,//回的时候的效果,此为默认
                                
),// FlexiblespaceBar
```
